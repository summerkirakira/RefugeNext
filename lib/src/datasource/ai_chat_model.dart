import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../repo/ai_chat.dart';
import 'models/ai/ai_message.dart';
import 'models/ai/ai_stream_event.dart';
import 'models/ai/ai_usage.dart';

/// AI 对话状态层（独立 ChangeNotifier，不并入 MainDataModel）。
/// 职责：订阅 AiRepo.streamChat → 累积流式文本 → 管理生成态/停止/重生成 → 每轮结束自动持久化。
class AiChatModel extends ChangeNotifier {
  final AiRepo _repo;

  /// 当前会话标识（决定持久化文件 `ai_chat_<id>.json`）。可通过切换会话改变。
  String _sessionId;

  /// 会话列表（元数据）。
  final List<AiSessionMeta> _sessions = [];

  /// 当前场景：qa | recommend | plan。
  String scene;

  final List<AiMessage> _messages = [];
  String _streamingText = '';
  bool _isGenerating = false;
  String? _toolStatusLabel;
  final List<Map<String, dynamic>> _cards = [];
  String? _errorMessage;
  bool _lastErrorRetryable = false;

  CancelToken? _cancelToken;

  AiChatModel({
    String sessionId = 'main',
    this.scene = 'qa',
    AiRepo? repo,
  })  : _sessionId = sessionId,
        _repo = repo ?? AiRepo();

  /// 当前会话 id。
  String get currentSessionId => _sessionId;

  /// 当前会话标题（用于 AppBar）。
  String get currentTitle {
    for (final s in _sessions) {
      if (s.id == _sessionId) return s.title;
    }
    return '新对话';
  }

  /// 会话列表，按最近更新倒序。
  List<AiSessionMeta> get sessions {
    final list = [..._sessions];
    list.sort((a, b) => b.updatedAt - a.updatedAt);
    return List.unmodifiable(list);
  }

  AiSessionMeta? get _currentMeta {
    for (final s in _sessions) {
      if (s.id == _sessionId) return s;
    }
    return null;
  }

  int get _now => DateTime.now().millisecondsSinceEpoch;

  /// 已提交的对话历史（持久化 / 发送给服务端的内容）。
  List<AiMessage> get messages => List.unmodifiable(_messages);

  /// 当前正在流式生成、尚未提交的助手文本。
  String get streamingText => _streamingText;

  bool get isGenerating => _isGenerating;

  /// 服务端工具进行中的展示文案（如「正在检索资料」），null 表示无。
  String? get toolStatusLabel => _toolStatusLabel;

  /// 本轮产出的结构化卡片（船卡片等）。
  List<Map<String, dynamic>> get cards => List.unmodifiable(_cards);

  /// 最近一次错误（null 表示无）。
  String? get errorMessage => _errorMessage;

  /// 最近一次错误是否可重试（LLM 429/5xx、网络错误为 true；业务/未知错误为 false）。
  /// 供 UI 决定是否显示「重试」入口。
  bool get lastErrorRetryable => _lastErrorRetryable;

  /// 当日 AI 用量（null 表示尚未拉取到）。
  AiUsage? _usage;
  AiUsage? get usage => _usage;

  /// 拉取当日用量并刷新 UI；静默失败（不影响聊天）。
  Future<void> refreshUsage() async {
    try {
      _usage = await _repo.fetchUsage();
      notifyListeners();
    } catch (_) {
      // 忽略：用量拉取失败不应打断对话
    }
  }

  /// 多会话初始化：加载会话列表 + 当前会话历史（进入页面时调用一次，名称沿用）。
  Future<void> loadFromDisk() async {
    final list = await _repo.loadSessions();
    _sessions
      ..clear()
      ..addAll(list);
    if (_sessions.isEmpty) {
      // 首次：建默认会话，id 用 'main' 以接住可能已存在的 ai_chat_main.json。
      _sessions.add(AiSessionMeta(id: 'main', title: '新对话', updatedAt: _now));
      await _repo.saveSessions(_sessions);
      _sessionId = 'main';
    } else {
      // 选最近更新的会话作为当前。
      _sessions.sort((a, b) => b.updatedAt - a.updatedAt);
      _sessionId = _sessions.first.id;
    }
    final history = await _repo.loadHistory(_sessionId);
    _messages
      ..clear()
      ..addAll(history);
    notifyListeners();
  }

  /// 切换到已有会话。
  Future<void> switchSession(String id) async {
    if (_isGenerating || id == _sessionId) return;
    _sessionId = id;
    _streamingText = '';
    _cards.clear();
    _errorMessage = null;
    final history = await _repo.loadHistory(id);
    _messages
      ..clear()
      ..addAll(history);
    notifyListeners();
  }

  /// 新建会话并切换过去（空白）。
  Future<void> newSession() async {
    if (_isGenerating) return;
    final meta = AiSessionMeta(id: _now.toString(), title: '新对话', updatedAt: _now);
    _sessions.add(meta);
    await _repo.saveSessions(_sessions);
    _sessionId = meta.id;
    _messages.clear();
    _streamingText = '';
    _cards.clear();
    _errorMessage = null;
    notifyListeners();
  }

  /// 删除会话；若删的是当前会话，自动切到最近剩余的（没有则新建）。
  Future<void> deleteSession(String id) async {
    if (_isGenerating) return;
    _sessions.removeWhere((s) => s.id == id);
    await _repo.clearHistory(id);
    await _repo.saveSessions(_sessions);
    if (id == _sessionId) {
      if (_sessions.isEmpty) {
        await newSession();
        return;
      }
      _sessions.sort((a, b) => b.updatedAt - a.updatedAt);
      await switchSession(_sessions.first.id);
      return;
    }
    notifyListeners();
  }

  void setScene(String value) {
    if (scene == value) return;
    scene = value;
    notifyListeners();
  }

  /// 发送一条用户消息并开始流式生成。
  Future<void> send(String userInput) async {
    final text = userInput.trim();
    if (text.isEmpty || _isGenerating) return;
    _messages.add(userMessage(text));
    // 更新会话元数据：标题取首条用户消息，刷新更新时间。
    final meta = _currentMeta;
    if (meta != null) {
      meta.updatedAt = _now;
      if (meta.title.isEmpty || meta.title == '新对话') {
        meta.title = text.length > 18 ? '${text.substring(0, 18)}…' : text;
      }
      await _repo.saveSessions(_sessions);
    }
    notifyListeners();
    await _runTurn();
  }

  /// 重新生成：丢弃末尾的助手回复，对最后一条用户消息重跑。
  Future<void> regenerate() async {
    if (_isGenerating) return;
    while (_messages.isNotEmpty && _messages.last.role == 'assistant') {
      _messages.removeLast();
    }
    if (_messages.isEmpty || _messages.last.role != 'user') return;
    notifyListeners();
    await _runTurn();
  }

  /// 中止当前生成。已生成的部分会作为助手消息提交。
  void stop() {
    _cancelToken?.cancel('user_stop');
  }

  /// 清空当前会话内容（保留会话本身）。
  Future<void> clear() async {
    if (_isGenerating) return;
    _messages.clear();
    _streamingText = '';
    _cards.clear();
    _errorMessage = null;
    await _repo.clearHistory(_sessionId);
    notifyListeners();
  }

  Future<void> _runTurn() async {
    _isGenerating = true;
    _streamingText = '';
    _toolStatusLabel = null;
    _errorMessage = null;
    _lastErrorRetryable = false;
    _cards.clear();
    _cancelToken = CancelToken();
    notifyListeners();

    try {
      await for (final ev in _repo.streamChat(
        scene: scene,
        history: List.of(_messages),
        cancelToken: _cancelToken,
      )) {
        switch (ev) {
          case AiTokenEvent(:final text):
            _streamingText += text;
            _toolStatusLabel = null;
          case AiToolRunningEvent(:final label):
            _toolStatusLabel = label;
            // 调工具前已流式的文本属于服务端 assistant 轮，其权威副本会随 inlineMessages 回来——
            // 清空在途文本，避免与内联 assistant.content 重复（并让状态条展示工具进度）。
            _streamingText = '';
          case AiToolRequestEvent(:final assistant, :final inlineMessages):
            // 服务端本段内联工具往返（assistant+tool）须先按序纳入历史，排在最终 assistant 之前。
            _messages.addAll(inlineMessages);
            // 把「调用工具」的助手轮（含 content+tool_calls+provider_state）纳入完整历史。
            // assistant.content 即工具调用前的文本；若为空则回退到已流式累积的文本。
            final c = assistant.content;
            final hasContent = c is String && c.isNotEmpty;
            _messages.add(
              hasContent || _streamingText.isEmpty
                  ? assistant
                  : assistant.copyWith(content: _streamingText),
            );
            _streamingText = '';
            _toolStatusLabel = '正在调用工具…';
          case AiToolResultEvent(:final message):
            // 工具结果轮纳入完整历史（UI 不渲染 role=tool）。
            _messages.add(message);
          case AiCardEvent(:final data):
            _cards.add(data);
          case AiDoneEvent(:final inlineMessages):
            // 纯 RAG 段：服务端内联工具往返排在 _commitAssistant 追加的最终答案文本之前。
            _messages.addAll(inlineMessages);
            break; // 仅退出 switch；循环随后自然结束
          case AiErrorEvent(:final message, :final retryable):
            _errorMessage = message;
            _lastErrorRetryable = retryable;
        }
        notifyListeners();
      }
      await _commitAssistant();
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) {
        await _commitAssistant(); //用户停止：提交已生成的部分
      } else {
        _errorMessage = '网络错误: ${e.message}';
        _lastErrorRetryable = true; // 网络错误可重试
      }
    } catch (e) {
      _errorMessage = '$e';
      _lastErrorRetryable = false;
    } finally {
      _isGenerating = false;
      _cancelToken = null;
      _toolStatusLabel = null;
      notifyListeners();
      // 本轮结束后刷新当日用量（不阻塞收尾）。
      unawaited(refreshUsage());
    }
  }

  /// 收尾：把最终助手文本（若有）追加为一条消息，并持久化**完整** transcript
  /// （已含本轮工具往返：assistant(tool_calls)+tool 结果）。出错时不提交、不持久化。
  Future<void> _commitAssistant() async {
    if (_errorMessage != null) return;
    final text = _streamingText.trim();
    if (text.isNotEmpty) {
      _messages.add(AiMessage(role: 'assistant', content: text));
    }
    _streamingText = '';
    await _repo.saveHistory(_sessionId, _messages);
  }

  @override
  void dispose() {
    _cancelToken?.cancel('disposed');
    super.dispose();
  }
}
