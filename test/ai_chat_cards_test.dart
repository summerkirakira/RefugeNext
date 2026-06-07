import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/models/ai/ai_message.dart';
import 'package:refuge_next/src/datasource/models/ai/tool_call.dart';
import 'package:refuge_next/src/widgets/ai_chat/ai_chat_page.dart';

void main() {
  group('hangarCardIdsOf', () {
    test('assistant 带 show_hangar_cards → 返回 ids', () {
      final m = const AiMessage(
        role: 'assistant',
        content: '这是你的船',
        toolCalls: [
          ToolCall(id: 'c1', name: 'show_hangar_cards', arguments: {
            'ids': [101, 202, 303]
          }),
        ],
      );
      expect(hangarCardIdsOf(m), [101, 202, 303]);
    });

    test('ids 含字符串数字也能解析；非法项剔除', () {
      final m = const AiMessage(
        role: 'assistant',
        toolCalls: [
          ToolCall(id: 'c1', name: 'show_hangar_cards', arguments: {
            'ids': [1, '2', 'x']
          }),
        ],
      );
      expect(hangarCardIdsOf(m), [1, 2]);
    });

    test('其它工具 / 其它角色 / 无工具 → 空', () {
      expect(
        hangarCardIdsOf(const AiMessage(role: 'assistant', toolCalls: [
          ToolCall(id: 'c1', name: 'get_hangar', arguments: {})
        ])),
        isEmpty,
      );
      expect(hangarCardIdsOf(userMessage('hi')), isEmpty);
      expect(
        hangarCardIdsOf(const AiMessage(role: 'assistant', content: '纯文本')),
        isEmpty,
      );
    });
  });

  group('buybackCardIdsOf', () {
    test('assistant 带 show_buyback_cards → 返回 ids', () {
      final m = const AiMessage(
        role: 'assistant',
        toolCalls: [
          ToolCall(id: 'c1', name: 'show_buyback_cards', arguments: {
            'ids': [7, 8]
          }),
        ],
      );
      expect(buybackCardIdsOf(m), [7, 8]);
    });

    test('两种卡片工具互不干扰', () {
      final m = const AiMessage(
        role: 'assistant',
        toolCalls: [
          ToolCall(id: 'c1', name: 'show_hangar_cards', arguments: {
            'ids': [1]
          }),
        ],
      );
      expect(hangarCardIdsOf(m), [1]);
      expect(buybackCardIdsOf(m), isEmpty);
    });
  });
}
