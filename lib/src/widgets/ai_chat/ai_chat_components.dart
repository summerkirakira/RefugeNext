import 'package:flutter/material.dart';

import 'ai_chat_presentation.dart';
import 'ai_markdown.dart';

/// 按聊天窗格宽度布局，不读取整个桌面窗口宽度。
class AiChatWidth extends StatelessWidget {
  const AiChatWidth({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.topCenter,
      heightFactor: 1,
      child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: LayoutBuilder(
              builder: (context, constraints) => Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth >= 600 ? 24 : 12),
                  child: SizedBox(width: double.infinity, child: child)))));
}

class AiMessageView extends StatelessWidget {
  const AiMessageView({super.key, required this.user, required this.text});
  final bool user;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    if (user) {
      return LayoutBuilder(
          builder: (context, constraints) => Align(
              alignment: Alignment.centerRight,
              child: Container(
                  constraints:
                      BoxConstraints(maxWidth: constraints.maxWidth * .86),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
                  decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      borderRadius: BorderRadius.circular(18)),
                  child: SelectionArea(
                      child: Text(text,
                          style: TextStyle(
                              color: colors.onPrimaryContainer,
                              fontSize: 15,
                              height: 1.5))))));
    }
    return AiMarkdown(text: text);
  }
}

class AiAssistantHeading extends StatelessWidget {
  const AiAssistantHeading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(Icons.auto_awesome, size: 15, color: colors.primary),
      const SizedBox(width: 6),
      Text('小九',
          style: theme.textTheme.labelMedium
              ?.copyWith(color: colors.primary, fontWeight: FontWeight.w600)),
    ]);
  }
}

class AiActivityView extends StatelessWidget {
  const AiActivityView({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) => Row(children: [
        SizedBox.square(
            dimension: 15,
            child: CircularProgressIndicator(
                strokeWidth: 2, color: Theme.of(context).colorScheme.primary)),
        const SizedBox(width: 10),
        Expanded(
            child: Text(label,
                style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onSurfaceVariant))),
      ]);
}

class AiToolGroup extends StatelessWidget {
  const AiToolGroup(
      {super.key,
      required this.entry,
      required this.expanded,
      required this.onExpansionChanged});
  final AiChatEntry entry;
  final bool expanded;
  final ValueChanged<bool> onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final running = entry.tools.any((e) => e.state == AiToolState.running);
    final failed = entry.tools.any((e) => e.state == AiToolState.failed);
    final incomplete =
        entry.tools.any((e) => e.state == AiToolState.incomplete);
    final status = running
        ? '执行中'
        : failed
            ? '有调用失败'
            : incomplete
                ? '未完成'
                : '已返回结果';
    return Material(
        color: colors.surfaceContainerLow,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
                color: running
                    ? colors.primary.withValues(alpha: .4)
                    : colors.outlineVariant.withValues(alpha: .65))),
        clipBehavior: Clip.antiAlias,
        child: ExpansionTile(
          // 避免与外部列表的滚动位置共用 PageStorage 值。
          key: PageStorageKey('ai-tool-group:${entry.id}'),
          initiallyExpanded: expanded,
          onExpansionChanged: onExpansionChanged,
          shape: const Border(), collapsedShape: const Border(),
          tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          leading: running
              ? const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(strokeWidth: 2))
              : failed || incomplete
                  ? Icon(failed ? Icons.error_outline : Icons.more_horiz,
                      color: failed ? colors.error : colors.onSurfaceVariant,
                      size: 20)
                  : null,
          title: Text('${entry.tools.length} 次工具调用 · $status',
              style:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          subtitle: Text(entry.tools.map((e) => e.label).join(' · '),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: colors.onSurfaceVariant)),
          children: [
            for (final tool in entry.tools)
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 6),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                      color: colors.surface,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tool.label, style: const TextStyle(fontSize: 13)),
                        const SizedBox(height: 3),
                        Text(tool.status,
                            style: TextStyle(
                                fontSize: 12,
                                color: tool.state == AiToolState.failed
                                    ? colors.error
                                    : colors.onSurfaceVariant)),
                      ])),
          ],
        ));
  }
}

class AiChatComposer extends StatefulWidget {
  const AiChatComposer(
      {super.key,
      required this.controller,
      required this.generating,
      required this.onSend,
      required this.onStop});
  final TextEditingController controller;
  final bool generating;
  final VoidCallback onSend, onStop;
  @override
  State<AiChatComposer> createState() => _AiChatComposerState();
}

class _AiChatComposerState extends State<AiChatComposer> {
  bool _focused = false;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
        top: false,
        child: AiChatWidth(
            child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Focus(
                    onFocusChange: (value) => setState(() => _focused = value),
                    child: AnimatedContainer(
                        key: const ValueKey('ai-composer-surface'),
                        duration: const Duration(milliseconds: 160),
                        decoration: BoxDecoration(
                            color: colors.surface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: _focused
                                    ? colors.primary.withValues(alpha: .55)
                                    : colors.outlineVariant
                                        .withValues(alpha: .6)),
                            boxShadow: [
                              if (Theme.of(context).brightness ==
                                  Brightness.light)
                                BoxShadow(
                                    color: colors.shadow.withValues(alpha: .04),
                                    blurRadius: 16,
                                    offset: const Offset(0, 3))
                            ]),
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(14, 12, 8, 6),
                            child: ValueListenableBuilder<TextEditingValue>(
                                valueListenable: widget.controller,
                                builder: (context, value, _) {
                                  final sendable = !widget.generating &&
                                      value.text.trim().isNotEmpty;
                                  return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                            key: const ValueKey(
                                                'ai-composer-input'),
                                            controller: widget.controller,
                                            minLines: 2,
                                            maxLines: 6,
                                            style: TextStyle(
                                                fontSize: 16,
                                                height: 1.35,
                                                color: colors.onSurface),
                                            textInputAction:
                                                TextInputAction.send,
                                            onSubmitted: (_) {
                                              if (sendable) widget.onSend();
                                            },
                                            decoration: InputDecoration(
                                                hintText: '问问小九…',
                                                hintStyle: TextStyle(
                                                    color: colors
                                                        .onSurfaceVariant
                                                        .withValues(
                                                            alpha: .65)),
                                                filled: false,
                                                border: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                isDense: true,
                                                contentPadding:
                                                    EdgeInsets.zero)),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Material(
                                                color: widget.generating ||
                                                        sendable
                                                    ? colors.primary
                                                    : colors
                                                        .surfaceContainerHighest,
                                                shape: const CircleBorder(),
                                                clipBehavior: Clip.antiAlias,
                                                child: IconButton(
                                                    tooltip: widget.generating
                                                        ? '停止'
                                                        : '发送',
                                                    onPressed: widget.generating
                                                        ? widget.onStop
                                                        : sendable
                                                            ? widget.onSend
                                                            : null,
                                                    color: colors.onPrimary,
                                                    disabledColor:
                                                        colors.onSurfaceVariant,
                                                    constraints:
                                                        const BoxConstraints(
                                                            minWidth: 44,
                                                            minHeight: 44),
                                                    icon: Icon(
                                                        widget.generating
                                                            ? Icons.stop_rounded
                                                            : Icons
                                                                .arrow_upward_rounded,
                                                        size: 22)))),
                                      ]);
                                })))))));
  }
}
