import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// 与 CirnoTerminal 的 Hermes 共用同样的 Markdown 排版规则。
class AiMarkdown extends StatelessWidget {
  const AiMarkdown({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final bodyStyle = theme.textTheme.bodyMedium?.copyWith(height: 1.45);
    // 使用整段选择区域，避免 SelectableText 内部滚动在点击/列表复用时滑动正文。
    return SelectionArea(
        child: MarkdownBody(
      data: text,
      selectable: false,
      softLineBreak: true,
      styleSheet: MarkdownStyleSheet.fromTheme(theme).copyWith(
        a: bodyStyle?.copyWith(
          color: colors.primary,
          decoration: TextDecoration.underline,
          decorationColor: colors.primary,
        ),
        p: bodyStyle,
        pPadding: const EdgeInsets.only(bottom: 4),
        h1: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        h1Padding: const EdgeInsets.only(top: 8, bottom: 6),
        h2: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        h2Padding: const EdgeInsets.only(top: 7, bottom: 5),
        h3: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
        h3Padding: const EdgeInsets.only(top: 6, bottom: 4),
        h4: bodyStyle?.copyWith(fontWeight: FontWeight.w700),
        code: TextStyle(
          fontFamily: 'monospace',
          fontSize: 13,
          height: 1.4,
          color: colors.onSurface,
          backgroundColor: colors.surfaceContainerHighest,
        ),
        codeblockPadding: const EdgeInsets.all(10),
        codeblockDecoration: BoxDecoration(
          color: colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        blockquote: bodyStyle?.copyWith(color: colors.onSurfaceVariant),
        blockquotePadding: const EdgeInsets.fromLTRB(12, 8, 10, 8),
        blockquoteDecoration: BoxDecoration(
          color: colors.surfaceContainerLow,
          border: Border(left: BorderSide(color: colors.primary, width: 3)),
          borderRadius: BorderRadius.circular(6),
        ),
        blockSpacing: 8,
        listIndent: 22,
        tableBorder: TableBorder.all(color: colors.outlineVariant),
        tableCellsPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 6,
        ),
      ),
      imageBuilder: (uri, title, alt) => Text(
        alt == null || alt.trim().isEmpty ? '🖼 外部图片已阻止' : '🖼 图片“$alt”已阻止',
        style: bodyStyle?.copyWith(
          color: colors.onSurfaceVariant,
          fontStyle: FontStyle.italic,
        ),
      ),
      onTapLink: (linkText, href, title) {
        unawaited(_openMarkdownLink(context, href));
      },
    ));
  }
}

bool aiMarkdownLinkIsAllowed(Uri uri) {
  return uri.scheme == 'https' || uri.scheme == 'http';
}

Future<void> _openMarkdownLink(BuildContext context, String? href) async {
  final uri = href == null ? null : Uri.tryParse(href);
  if (uri == null || !aiMarkdownLinkIsAllowed(uri)) {
    _showLinkMessage(context, '仅支持打开 HTTP 或 HTTPS 链接');
    return;
  }
  try {
    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!opened && context.mounted) {
      _showLinkMessage(context, '无法打开这个链接');
    }
  } on Object {
    if (context.mounted) _showLinkMessage(context, '无法打开这个链接');
  }
}

void _showLinkMessage(BuildContext context, String message) {
  ScaffoldMessenger.maybeOf(
    context,
  )?.showSnackBar(SnackBar(content: Text(message)));
}
