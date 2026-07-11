import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../datasource/ai_chat_model.dart';
import '../../datasource/data_model.dart';
import '../../datasource/models/ai/ai_message.dart';
import '../../datasource/models/ai/ai_usage.dart';
import '../../datasource/models/ai/server_tools.dart';
import '../../datasource/models/hangar.dart';
import '../../datasource/models/buyback.dart';
import '../hangar/hangar_item_widget.dart';
import '../hangar/hangar_item_detail_widget.dart';
import '../hangar/ship_reclaim_modal.dart';
import '../hangar/ship_gift_modal.dart';
import '../hangar/ship_recall_modal.dart';
import '../buyback/buyback_item.dart';
import '../../repo/game_vehicle.dart';
import '../../repo/vehicle_weapon.dart';
import '../../repo/personal_weapon.dart';
import '../../repo/shield.dart';
import '../../repo/cooler.dart';
import '../../repo/power_plant.dart';
import '../../repo/quantum_drive.dart';
import '../../repo/weapon_attachment.dart';
import '../ship_info_neo/vehicle_info_card.dart';
import '../ship_info_neo/vehicle_weapon_info_card.dart';
import '../ship_info_neo/personal_weapon_info_card.dart';
import '../ship_info_neo/shield_info_card.dart';
import '../ship_info_neo/cooler_info_card.dart';
import '../ship_info_neo/power_plant_info_card.dart';
import '../ship_info_neo/quantum_drive_info_card.dart';
import '../ship_info_neo/weapon_attachment_info_card.dart';

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

/// assistant 消息里命中的服务端工具调用（retrieve_docs 等），返回展示文案列表。
/// 服务端工具在服务端内联执行、结果随 inline_messages 回传，这里只把"调用动作"展示给用户。
List<String> serverToolLabelsOf(AiMessage m) {
  if (m.role != 'assistant') return const [];
  final calls = m.toolCalls;
  if (calls == null) return const [];
  final out = <String>[];
  for (final c in calls) {
    final q = c.arguments['query'];
    final label = serverToolLabel(c.name, query: q is String ? q : null);
    if (label != null) out.add(label);
  }
  return out;
}

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
  void initState() {
    super.initState();
    // 进入 AI 页自动拉取一次当日用量。
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<AiChatModel>().refreshUsage();
    });
  }

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
        final serverTools = serverToolLabelsOf(m);
        if (serverTools.isNotEmpty) items.add(_ServerToolChips(labels: serverTools));
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
            onMenuPressed: () {
              // 打开会话抽屉前刷新一次用量，保证顶部用量卡是最新的。
              context.read<AiChatModel>().refreshUsage();
              _scaffoldKey.currentState?.openEndDrawer();
            },
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

/// 服务端工具调用 chip 块：展示"小九调用了服务端工具"（如「检索资料：货运船」）。
/// 服务端工具在服务端内联执行、结果不在客户端渲染，这里只把调用动作可视化。非交互。
class _ServerToolChips extends StatelessWidget {
  final List<String> labels;

  const _ServerToolChips({required this.labels});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final label in labels)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search, size: 14, color: cs.onSurfaceVariant),
                        const SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            label,
                            style: TextStyle(color: cs.onSurfaceVariant, fontSize: 13),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
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
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 24),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 测试功能标识：小九仍在 Beta 阶段。
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.12),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Beta',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
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

/// 内联物品卡片块（show_item_card）：把 uuids 跨全部仓库解析,渲染对应类别卡片
/// (舰船 / 载具武器 / 个人武器 / 护盾 / 冷却器 / 发电机 / 量子引擎 / 武器配件;点击跳详情页)。
/// 模型只传 uuid,本地按命中的仓库决定卡片类型;未命中的 uuid 静默跳过(已在工具结果里报给模型)。
class _ItemCards extends StatelessWidget {
  final List<String> uuids;

  const _ItemCards({required this.uuids});

  /// uuid → 对应类别卡片;跨所有仓库检索,未命中返回 null。
  Widget? _cardForUuid(String uuid) {
    final v = GameVehicleRepo().getByUuidSync(uuid);
    if (v != null) return VehicleInfoCard(vehicle: v);

    final vw = VehicleWeaponRepo().getByUuidSync(uuid);
    if (vw != null) return VehicleWeaponInfoCard(item: vw);
    final pw = PersonalWeaponRepo().getByUuidSync(uuid);
    if (pw != null) return PersonalWeaponInfoCard(item: pw);
    final sh = ShieldRepo().getByUuidSync(uuid);
    if (sh != null) return ShieldInfoCard(item: sh);
    final co = CoolerRepo().getByUuidSync(uuid);
    if (co != null) return CoolerInfoCard(item: co);
    final pp = PowerPlantRepo().getByUuidSync(uuid);
    if (pp != null) return PowerPlantInfoCard(item: pp);
    final qd = QuantumDriveRepo().getByUuidSync(uuid);
    if (qd != null) return QuantumDriveInfoCard(item: qd);
    final wa = WeaponAttachmentRepo().getByUuidSync(uuid);
    if (wa != null) return WeaponAttachmentInfoCard(item: wa);

    return null;
  }

  Future<List<Widget>> _resolve() async {
    await Future.wait([
      GameVehicleRepo().getVehicles(),
      VehicleWeaponRepo().getVehicleWeapons(),
      PersonalWeaponRepo().getPersonalWeapons(),
      ShieldRepo().getShields(),
      CoolerRepo().getCoolers(),
      PowerPlantRepo().getPowerPlants(),
      QuantumDriveRepo().getQuantumDrives(),
      WeaponAttachmentRepo().getWeaponAttachments(),
    ]);
    return uuids.map(_cardForUuid).whereType<Widget>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Widget>>(
      future: _resolve(),
      builder: (context, snapshot) {
        final cards = snapshot.data ?? const <Widget>[];
        if (cards.isEmpty) return const SizedBox.shrink();
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
                  child: _cardListPanel(context, cards),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// 会话抽屉顶部的「今日用量」卡。usage 为 null（未拉到）时不显示。
class _UsageCard extends StatelessWidget {
  final AiUsage? usage;

  const _UsageCard({required this.usage});

  /// token 数简写：≥1000 显示 x.xk。
  static String _fmt(int n) =>
      n >= 1000 ? '${(n / 1000).toStringAsFixed(1)}k' : '$n';

  /// 重置倒计时：Xh Ym / Ym / <1m。
  static String _resetIn(int seconds) {
    if (seconds <= 60) return '不到 1 分钟';
    final h = seconds ~/ 3600;
    final m = (seconds % 3600) ~/ 60;
    if (h > 0) return '$h 小时 $m 分';
    return '$m 分钟';
  }

  @override
  Widget build(BuildContext context) {
    final u = usage;
    if (u == null) return const SizedBox.shrink();
    final cs = Theme.of(context).colorScheme;
    final theme = Theme.of(context);

    final Widget body;
    if (u.unlimited) {
      body = Row(
        children: [
          Icon(Icons.all_inclusive, size: 18, color: cs.primary),
          const SizedBox(width: 6),
          Text('会员 · 无限额度',
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600)),
        ],
      );
    } else {
      final remaining = u.remainingTokens ?? 0;
      final budget = u.dailyBudget;
      final ratio = budget > 0 ? (remaining / budget).clamp(0.0, 1.0) : 0.0;
      body = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('今日剩余',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
              Text('${_fmt(remaining)} / ${_fmt(budget)}',
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: cs.onSurfaceVariant)),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 6,
              backgroundColor: cs.surfaceContainerHighest,
              color: ratio < 0.15 ? cs.error : cs.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text('${_resetIn(u.resetInSeconds)}后重置',
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: cs.onSurfaceVariant)),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cs.primary.withOpacity(0.06),
          borderRadius: BorderRadius.circular(10),
        ),
        child: body,
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
            _UsageCard(usage: model.usage),
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
