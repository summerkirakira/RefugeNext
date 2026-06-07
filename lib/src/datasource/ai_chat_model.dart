import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../repo/ai_chat.dart';
import 'models/ai/ai_message.dart';
import 'models/ai/ai_stream_event.dart';

/// AI 对话状态层（独立 ChangeNotifier，不并入 MainDataModel）。
/// 职责：订阅 AiRepo.streamChat → 累积流式文本 → 管理生成态/停止/重生成 → 每轮结束自动持久化。
class AiChatModel extends ChangeNotifier {
  final AiRepo _repo;

  /// 会话标识，决定持久化文件（一会话一文件）。单会话直接用固定值。
  final String sessionId;

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
    required this.sessionId,
    this.scene = 'qa',
    AiRepo? repo,
  }) : _repo = repo ?? AiRepo();

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

  /// 从磁盘加载历史（应在进入会话时调用一次）。
  Future<void> loadFromDisk() async {
    final history = await _repo.loadHistory(sessionId);
    _messages
      ..clear()
      ..addAll(history);
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

  /// 清空会话（内存 + 磁盘）。
  Future<void> clear() async {
    if (_isGenerating) return;
    _messages.clear();
    _streamingText = '';
    _cards.clear();
    _errorMessage = null;
    await _repo.clearHistory(sessionId);
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
          case AiToolRequestEvent():
            _toolStatusLabel = '正在调用工具…';
          case AiCardEvent(:final data):
            _cards.add(data);
          case AiDoneEvent():
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
        await _commitAssistant(); // 用户停止：提交已生成的部分
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
    }
  }

  /// 把累积的流式文本提交为一条助手消息并持久化。
  /// 出错时不提交；无内容时不提交。
  Future<void> _commitAssistant() async {
    if (_errorMessage != null) return;
    final text = _streamingText.trim();
    if (text.isEmpty) return;
    _messages.add(AiMessage(role: 'assistant', content: text));
    _streamingText = '';
    await _repo.saveHistory(sessionId, _messages);
  }

  @override
  void dispose() {
    _cancelToken?.cancel('disposed');
    super.dispose();
  }
}
