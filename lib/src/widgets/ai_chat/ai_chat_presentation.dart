import 'dart:convert';

import '../../datasource/models/ai/ai_message.dart';
import '../../datasource/models/ai/server_tools.dart';
import '../../datasource/models/ai/tool_call.dart';

enum AiEntryKind { user, assistant, tools, cards, activity }

enum AiToolState { running, waiting, returned, failed, incomplete }

const _cardToolNames = {
  'show_hangar_cards',
  'show_buyback_cards',
  'show_item_card',
};

class AiToolPresentation {
  const AiToolPresentation(this.id, this.label, this.state);
  final String id;
  final String label;
  final AiToolState state;

  String get status => switch (state) {
        AiToolState.running => '执行中',
        AiToolState.waiting => '等待结果',
        AiToolState.returned => '已返回结果',
        AiToolState.failed => '失败',
        AiToolState.incomplete => '未完成',
      };
}

class AiChatEntry {
  AiChatEntry(this.id, this.kind,
      {this.text = '', this.message, this.tools = const []});
  final String id;
  final AiEntryKind kind;
  final String text;
  final AiMessage? message;
  final List<AiToolPresentation> tools;
}

String aiToolLabel(ToolCall call) {
  final query = call.arguments['query'];
  return serverToolLabel(call.name, query: query is String ? query : null) ??
      const {
        'get_hangar': '查看机库',
        'get_user_ships': '查看拥有的舰船',
        'get_user_info': '查看账户信息',
        'get_buyback': '查看回购',
        'show_hangar_cards': '展示机库卡片',
        'show_buyback_cards': '展示回购卡片',
        'show_item_card': '展示物品卡片',
        'plan_ccu_upgrade': '规划 CCU 升级',
      }[call.name] ??
      '调用工具';
}

bool _failed(Object? content) {
  if (content is String) {
    try {
      content = jsonDecode(content);
    } on FormatException {
      return false;
    }
  }
  if (content is! Map) return false;
  final error = content['error'];
  return content['is_error'] == true ||
      content['isError'] == true ||
      content['ok'] == false ||
      content['status'] == 'failed' ||
      content['status'] == 'error' ||
      (error != null && error != false && error != '');
}

/// 只派生展示节点，不修改发送给服务端或持久化的消息。
List<AiChatEntry> buildAiChatEntries({
  required String sessionId,
  required List<AiMessage> messages,
  bool generating = false,
  String streamingText = '',
  String? toolLabel,
}) {
  final entries = <AiChatEntry>[];
  // 调用 ID 只在同一轮内关联，避免旧记录复用 ID 时串联结果。
  var turn = -1;
  final turns = <int>[];
  final results = <(int, String), AiMessage>{};
  for (var i = 0; i < messages.length; i++) {
    final message = messages[i];
    if (message.role == 'user') turn = i;
    turns.add(turn);
    if (message.role == 'tool' && message.toolCallId != null) {
      results[(turn, message.toolCallId!)] = message;
    }
  }
  final activeTurn = turn;
  var assignedRunning = false;
  for (var i = 0; i < messages.length; i++) {
    final message = messages[i];
    if (message.role != 'user' && message.role != 'assistant') continue;
    final text = message.content is String ? message.content as String : '';
    final prefix = '$sessionId:$i';
    if (text.trim().isNotEmpty) {
      entries.add(AiChatEntry('$prefix:text',
          message.role == 'user' ? AiEntryKind.user : AiEntryKind.assistant,
          text: text));
    }
    if (message.role != 'assistant') continue;
    final tools = <AiToolPresentation>[];
    for (final call in message.toolCalls ?? <ToolCall>[]) {
      // 展示卡片的调用直接渲染业务卡片，不再重复显示工具过程。
      if (_cardToolNames.contains(call.name)) continue;
      final result = results[(turns[i], call.id)];
      var state = AiToolState.incomplete;
      if (result != null && result.content != null) {
        state =
            _failed(result.content) ? AiToolState.failed : AiToolState.returned;
      } else if (generating && turns[i] == activeTurn) {
        state = assignedRunning ? AiToolState.waiting : AiToolState.running;
        assignedRunning = true;
      }
      tools.add(AiToolPresentation(call.id, aiToolLabel(call), state));
    }
    if (tools.isNotEmpty) {
      if (entries.isNotEmpty && entries.last.kind == AiEntryKind.tools) {
        final previous = entries.removeLast();
        entries.add(AiChatEntry(previous.id, AiEntryKind.tools,
            tools: [...previous.tools, ...tools]));
      } else {
        entries.add(AiChatEntry(
            '$prefix:tools:${tools.first.id}', AiEntryKind.tools,
            tools: tools));
      }
    }
    if (message.toolCalls?.any((call) => _cardToolNames.contains(call.name)) ==
        true) {
      entries.add(
          AiChatEntry('$prefix:cards', AiEntryKind.cards, message: message));
    }
  }
  if (generating && streamingText.isNotEmpty) {
    entries.add(AiChatEntry('$sessionId:stream', AiEntryKind.assistant,
        text: '$streamingText▌'));
  } else if (generating && !assignedRunning) {
    // 实际调用记录已到达时，不再重复显示通用“正在调用工具”。
    final hasCurrentCalls = messages
        .skip(activeTurn < 0 ? 0 : activeTurn)
        .any((m) => m.toolCalls?.isNotEmpty == true);
    if (toolLabel != '正在调用工具…' || !hasCurrentCalls) {
      entries.add(AiChatEntry('$sessionId:activity', AiEntryKind.activity,
          text: toolLabel ?? '思考中…'));
    }
  }
  return entries;
}
