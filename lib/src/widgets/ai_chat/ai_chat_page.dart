import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../datasource/ai_chat_model.dart';
import '../../datasource/data_model.dart';
import '../../datasource/models/ai/ai_message.dart';
import '../../datasource/models/hangar.dart';
import '../../datasource/models/buyback.dart';
import '../hangar/hangar_item_widget.dart';
import '../hangar/hangar_item_detail_widget.dart';
import '../hangar/ship_reclaim_modal.dart';
import '../hangar/ship_gift_modal.dart';
import '../hangar/ship_recall_modal.dart';
import '../buyback/buyback_item.dart';
import '../../network/wiki/wiki_api.dart' show GameVehicle;
import '../../repo/game_vehicle.dart';
import '../ship_info_neo/vehicle_info_card.dart';

/// 解析 assistant 消息里指定工具调用的 id 列表（show_hangar_cards / show_buyback_cards）。
List<int> _cardIdsOf(AiMessage m, String toolName) {
  if (m.role != 'assistant') return const [];
  final calls = m.toolCalls;
  if (calls == null) return const [];
  for (final c in calls) {
    if (c.name == toolName) {
      final raw = c.arguments['ids'];
      if (raw is List) {
        return raw
            .map((e) => e is int ? e : int.tryParse('$e') ?? -1)
            .where((x) => x >= 0)
            .toList();
      }
    }
  }
  return const [];
}

/// 机库卡片 id 列表（show_hangar_cards）。
List<int> hangarCardIdsOf(AiMessage m) => _cardIdsOf(m, 'show_hangar_cards');

/// 回购卡片 id 列表（show_buyback_cards）。
List<int> buybackCardIdsOf(AiMessage m) => _cardIdsOf(m, 'show_buyback_cards');

/// 物品卡片 uuid 列表（show_item_card）。uuid 为字符串,与 id 类工具不同。
List<String> itemCardUuidsOf(AiMessage m) {
  if (m.role != 'assistant') return const [];
  final calls = m.toolCalls;
  if (calls == null) return const [];
  for (final c in calls) {
    if (c.name == 'show_item_card') {
      final raw = c.arguments['uuids'];
      if (raw is List) {
        return raw.map((e) => '$e').where((s) => s.isNotEmpty).toList();
      }
    }
  }
  return const [];
}

/// 把一组内联卡片裹成单块悬浮面板（仅限 AI 聊天界面，不影响机库/回购原卡片）：
/// 统一 cardColor 背景 + 圆角 + 单层阴影，整组一起悬浮。
Widget _cardListPanel(BuildContext context, List<Widget> cards) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.12),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cards,
        ),
      ),
    ),
  );
}

/// 卡片面板最大宽度：宽屏沿用 0.78 留白对齐气泡；窄屏（0.78 撑不到舒适宽度）放开到全宽。
double _cardPanelMaxWidth(BuildContext context) {
  final w = MediaQuery.of(context).size.width;
  const minComfortable = 330.0; // 卡片舒适最小宽度
  final preferred = w * 0.78;
  return preferred >= minComfortable ? preferred : double.infinity;
}

/// 圆形填充图标按钮（Telegram 风格发送键）：自带 Material 圆形表面，
/// 使墨水波纹画在按钮自身之上并裁剪成圆形，避免在 M2 下波纹沉到输入栏背景下层。
Widget _filledRoundIconButton(
  BuildContext context, {
  required IconData icon,
  required VoidCallback onPressed,
  required String tooltip,
}) {
  final cs = Theme.of(context).colorScheme;
  return Material(
    color: cs.primary,
    shape: const CircleBorder(),
    clipBehavior: Clip.antiAlias,
    child: IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: 22,
      color: cs.onPrimary,
      tooltip: tooltip,
      padding: const EdgeInsets.all(4),
      constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
      visualDensity: VisualDensity.compact,
    ),
  );
}

/// 复用机库的点击弹窗（详情/回收/赠送/撤回）。
void _openHangarItemSheet(HangarItem item, BuildContext context) {
  WoltModalSheet.show<void>(
    context: context,
    pageListBuilder: (modalSheetContext) {
      return [
        getHangarItemDetailSheet(modalSheetContext, item),
        getReclaimPage(modalSheetContext, context, item),
        getGiftPage(modalSheetContext, context, item),
        getRecallPage(modalSheetContext, context, item),
      ];
    },
  );
}

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
    // 异构渲染：user/assistant 气泡 + show_hangar_cards 的机库卡片块；跳过 role=tool 与纯工具调用空 assistant。
    final items = <Widget>[];
    for (final m in model.messages) {
      final c = m.content;
      final hasText = c is String && c.trim().isNotEmpty;
      if (m.role == 'user') {
        if (hasText) items.add(_AiBubble(isUser: true, text: c));
      } else if (m.role == 'assistant') {
        if (hasText) items.add(_AiBubble(isUser: false, text: c));
        final hangarIds = hangarCardIdsOf(m);
        if (hangarIds.isNotEmpty) items.add(_HangarCards(ids: hangarIds));
        final buybackIds = buybackCardIdsOf(m);
        if (buybackIds.isNotEmpty) items.add(_BuybackCards(ids: buybackIds));
        final itemUuids = itemCardUuidsOf(m);
        if (itemUuids.isNotEmpty) items.add(_ItemCards(uuids: itemUuids));
      }
    }
    final showEmpty = items.isEmpty && !model.isGenerating;

    // 有新内容时滚到底
    _scrollToBottom();

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: _SessionDrawer(onDeleteSession: _confirmDeleteSession),
      body: Column(
        children: [
          _AiTopBar(
            title: '小九',
            onMenuPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
          ),
          Expanded(
            child: showEmpty
                ? const _EmptyState()
                : ListView(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    children: [
                      ...items,
                      if (model.isGenerating)
                        _StreamingBubble(
                          text: model.streamingText,
                          toolLabel: model.toolStatusLabel,
                        ),
                    ],
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
    final bg = isUser ? cs.primary : cs.surfaceContainer;
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
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
                  color: cs.surfaceContainer,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
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
      color: cs.surfaceContainer,
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
              ? _filledRoundIconButton(context,
                  icon: Icons.stop, onPressed: onStop, tooltip: '停止')
              : _filledRoundIconButton(context,
                  icon: Entypo.paper_plane, onPressed: onSend, tooltip: '发送'),
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

/// AI 页顶栏：与其它主页面一致（头像 + 标题），右侧汉堡打开会话抽屉。
class _AiTopBar extends StatelessWidget {
  final String title;
  final VoidCallback? onMenuPressed;

  const _AiTopBar({required this.title, this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: 60,
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 0),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: ClipOval(
                child: Image(
                  image: AssetImage('assets/images/cirno_ai.jpg'),
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 24),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              tooltip: '会话',
              icon: const Icon(Icons.menu),
              onPressed: onMenuPressed,
            ),
          ],
        ),
      ),
    );
  }
}


class _HangarCards extends StatelessWidget {
  final List<int> ids;

  const _HangarCards({required this.ids});

  @override
  Widget build(BuildContext context) {
    MainDataModel? model;
    try {
      model = context.read<MainDataModel>();
    } catch (_) {
      model = null; // dev/preview 入口无 MainDataModel：不渲染卡片。
    }
    if (model == null) return const SizedBox.shrink();
    final items = ids
        .map((id) => model!.getHangarItemById(id))
        .whereType<HangarItem>()
        .toList();
    if (items.isEmpty) return const SizedBox.shrink();
    // 左对齐;宽屏限到 0.78 屏宽对齐气泡,窄屏放开到全宽。
    final maxWidth = _cardPanelMaxWidth(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: _cardListPanel(
                context,
                [
                  for (final it in items)
                    HangarItemWidget(hangarItem: it, onTap: _openHangarItemSheet),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 内联回购卡片块：把 ids 解析成本地 BuybackItem，复用回购卡片（卡片自带点击弹窗）。
class _BuybackCards extends StatelessWidget {
  final List<int> ids;

  const _BuybackCards({required this.ids});

  @override
  Widget build(BuildContext context) {
    MainDataModel? model;
    try {
      model = context.read<MainDataModel>();
    } catch (_) {
      model = null;
    }
    if (model == null) return const SizedBox.shrink();
    final items = ids
        .map((id) => model!.getBuybackItemById(id))
        .whereType<BuybackItem>()
        .toList();
    if (items.isEmpty) return const SizedBox.shrink();
    // 左对齐;宽屏限到 0.78 屏宽对齐气泡,窄屏放开到全宽。
    final maxWidth = _cardPanelMaxWidth(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: _cardListPanel(
                context,
                [for (final it in items) BuybackItemWidget(buybackItem: it)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 内联物品卡片块（show_item_card）：把 uuids 解析成本地 GameVehicle,
/// 渲染舰船卡片(点击跳详情页)。目前仅检索 GameVehicle,后续扩展其它 repo。
class _ItemCards extends StatelessWidget {
  final List<String> uuids;

  const _ItemCards({required this.uuids});

  Future<List<GameVehicle>> _resolve() async {
    final repo = GameVehicleRepo();
    await repo.getVehicles(); // 确保本地数据已加载
    return uuids
        .map(repo.getByUuidSync)
        .whereType<GameVehicle>()
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GameVehicle>>(
      future: _resolve(),
      builder: (context, snapshot) {
        final vehicles = snapshot.data ?? const <GameVehicle>[];
        if (vehicles.isEmpty) return const SizedBox.shrink();
        // 与 show_hangar_cards 一致:宽度对齐 AI 消息气泡最大宽度
        final maxWidth = _cardPanelMaxWidth(context);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: _cardListPanel(
                    context,
                    [for (final v in vehicles) VehicleInfoCard(vehicle: v)],
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
