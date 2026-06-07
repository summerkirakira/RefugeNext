import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:provider/provider.dart';

import '../../datasource/ai_chat_model.dart';

/// AI 聊天界面（qa 问答 MVP）。绑定 AiChatModel：
/// 渲染已提交 messages + 一条由 streamingText 构成的在途气泡，token 到达即逐字出现。
class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  void _handleSend() {
    final text = _inputController.text;
    if (text.trim().isEmpty) return;
    _inputController.clear();
    context.read<AiChatModel>().send(text);
  }

  Future<void> _confirmDeleteSession(String id, String title) async {
    final model = context.read<AiChatModel>();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('删除会话'),
        content: Text('确定删除「$title」及其全部消息？'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('取消')),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('删除')),
        ],
      ),
    );
    if (ok == true) await model.deleteSession(id);
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AiChatModel>();
    // 渲染 user，及有正文的 assistant；跳过 role=tool 和「纯工具调用」的空 assistant 轮。
    final rendered = model.messages.where((m) {
      if (m.role == 'user') return true;
      if (m.role == 'assistant') {
        final c = m.content;
        return c is String && c.trim().isNotEmpty;
      }
      return false;
    }).toList();

    // 有新内容时滚到底
    _scrollToBottom();

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: _SessionDrawer(onDeleteSession: _confirmDeleteSession),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(model.currentTitle.isEmpty ? 'AI 助手' : model.currentTitle),
        actions: [
          IconButton(
            tooltip: '会话',
            icon: const Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: (rendered.isEmpty && !model.isGenerating)
                ? const _EmptyState()
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    itemCount: rendered.length + (model.isGenerating ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < rendered.length) {
                        final msg = rendered[index];
                        return _AiBubble(
                          isUser: msg.role == 'user',
                          text: msg.content?.toString() ?? '',
                        );
                      }
                      // 在途气泡
                      return _StreamingBubble(
                        text: model.streamingText,
                        toolLabel: model.toolStatusLabel,
                      );
                    },
                  ),
          ),
          if (model.errorMessage != null)
            _ErrorBar(
              message: model.errorMessage!,
              retryable: model.lastErrorRetryable,
              onRetry: () => context.read<AiChatModel>().regenerate(),
            ),
          _InputBar(
            controller: _inputController,
            isGenerating: model.isGenerating,
            onSend: _handleSend,
            onStop: () => context.read<AiChatModel>().stop(),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// 气泡
// ---------------------------------------------------------------------------

class _AiBubble extends StatelessWidget {
  final bool isUser;
  final String text;

  const _AiBubble({required this.isUser, required this.text});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final bg = isUser ? cs.primary : cs.surfaceContainerHighest;
    final fg = isUser ? cs.onPrimary : cs.onSurface;
    final maxWidth = MediaQuery.of(context).size.width * 0.78;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: Radius.circular(isUser ? 12 : 4),
                    bottomRight: Radius.circular(isUser ? 4 : 12),
                  ),
                ),
                // 用户消息纯文本可选中；助手消息走 Markdown
                child: isUser
                    ? SelectableText(text, style: TextStyle(color: fg, fontSize: 15))
                    : GptMarkdown(text, style: TextStyle(color: fg, fontSize: 15)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 在途助手气泡：流式文本 + 光标；空内容时显示工具状态或「思考中」。
class _StreamingBubble extends StatelessWidget {
  final String text;
  final String? toolLabel;

  const _StreamingBubble({required this.text, required this.toolLabel});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final maxWidth = MediaQuery.of(context).size.width * 0.78;

    Widget content;
    if (text.isNotEmpty) {
      content = GptMarkdown('$text▌', style: TextStyle(color: cs.onSurface, fontSize: 15));
    } else {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(strokeWidth: 2, color: cs.onSurfaceVariant),
          ),
          const SizedBox(width: 8),
          Text(
            toolLabel ?? '思考中…',
            style: TextStyle(color: cs.onSurfaceVariant, fontSize: 14),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerHighest,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: content,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// 错误条 / 输入栏 / 空状态
// ---------------------------------------------------------------------------

class _ErrorBar extends StatelessWidget {
  final String message;
  final bool retryable;
  final VoidCallback onRetry;

  const _ErrorBar({required this.message, required this.retryable, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      color: cs.errorContainer,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(Icons.error_outline, size: 18, color: cs.onErrorContainer),
          const SizedBox(width: 8),
          Expanded(
            child: Text(message, style: TextStyle(color: cs.onErrorContainer, fontSize: 13)),
          ),
          if (retryable)
            TextButton(onPressed: onRetry, child: const Text('重试')),
        ],
      ),
    );
  }
}

class _InputBar extends StatelessWidget {
  final TextEditingController controller;
  final bool isGenerating;
  final VoidCallback onSend;
  final VoidCallback onStop;

  const _InputBar({
    required this.controller,
    required this.isGenerating,
    required this.onSend,
    required this.onStop,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      color: cs.surfaceContainerLow,
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 8,
        bottom: MediaQuery.of(context).padding.bottom + 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              minLines: 1,
              maxLines: 5,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => isGenerating ? null : onSend(),
              decoration: InputDecoration(
                hintText: '问我点什么…',
                filled: true,
                fillColor: cs.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                isDense: true,
              ),
            ),
          ),
          const SizedBox(width: 8),
          isGenerating
              ? IconButton.filled(
                  onPressed: onStop,
                  icon: const Icon(Icons.stop),
                  tooltip: '停止',
                )
              : IconButton.filled(
                  onPressed: onSend,
                  icon: const Icon(Icons.send),
                  tooltip: '发送',
                ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const Image(
              image: AssetImage('assets/images/cirno_avatar.jpeg'),
              width: 88,
              height: 88,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '问我点什么吧～',
            style: TextStyle(color: cs.onSurfaceVariant, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

/// 右侧会话抽屉：新建 + 会话列表（切换/删除）。
class _SessionDrawer extends StatelessWidget {
  final Future<void> Function(String id, String title) onDeleteSession;

  const _SessionDrawer({required this.onDeleteSession});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final model = context.watch<AiChatModel>();
    final sessions = model.sessions;
    final disabled = model.isGenerating;

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text('会话', style: Theme.of(context).textTheme.titleMedium),
            ),
            ListTile(
              leading: const Icon(Icons.add_comment_outlined),
              title: const Text('新建对话'),
              enabled: !disabled,
              onTap: () {
                Navigator.pop(context);
                context.read<AiChatModel>().newSession();
              },
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                itemCount: sessions.length,
                itemBuilder: (context, index) {
                  final s = sessions[index];
                  final selected = s.id == model.currentSessionId;
                  return ListTile(
                    selected: selected,
                    selectedTileColor: cs.primary.withOpacity(0.10),
                    leading: Icon(
                      Icons.chat_bubble_outline,
                      color: selected ? cs.primary : null,
                    ),
                    title: Text(
                      s.title.isEmpty ? '新对话' : s.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, size: 20),
                      tooltip: '删除',
                      onPressed: disabled ? null : () => onDeleteSession(s.id, s.title),
                    ),
                    onTap: disabled
                        ? null
                        : () {
                            Navigator.pop(context);
                            context.read<AiChatModel>().switchSession(s.id);
                          },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
