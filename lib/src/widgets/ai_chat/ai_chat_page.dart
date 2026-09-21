import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../datasource/ai_chat_model.dart';
import '../../datasource/data_model.dart';
import '../../datasource/models/ai/ai_message.dart';
import '../../datasource/models/ai/ai_usage.dart';
import '../../datasource/models/ai/server_tools.dart';
import '../../datasource/models/buyback.dart';
import '../../datasource/models/hangar.dart';
import '../../repo/cooler.dart';
import '../../repo/game_vehicle.dart';
import '../../repo/personal_weapon.dart';
import '../../repo/power_plant.dart';
import '../../repo/quantum_drive.dart';
import '../../repo/shield.dart';
import '../../repo/vehicle_weapon.dart';
import '../../repo/weapon_attachment.dart';
import '../buyback/buyback_item.dart';
import '../hangar/hangar_item_detail_widget.dart';
import '../hangar/hangar_item_widget.dart';
import '../hangar/ship_gift_modal.dart';
import '../hangar/ship_recall_modal.dart';
import '../hangar/ship_reclaim_modal.dart';
import '../ship_info_neo/cooler_info_card.dart';
import '../ship_info_neo/personal_weapon_info_card.dart';
import '../ship_info_neo/power_plant_info_card.dart';
import '../ship_info_neo/quantum_drive_info_card.dart';
import '../ship_info_neo/shield_info_card.dart';
import '../ship_info_neo/vehicle_info_card.dart';
import '../ship_info_neo/vehicle_weapon_info_card.dart';
import '../ship_info_neo/weapon_attachment_info_card.dart';
import 'ai_chat_components.dart';
import 'ai_chat_presentation.dart';

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

// 外层 AiChatWidth 已按实际窗格限制阅读宽度。
double _cardPanelMaxWidth(BuildContext context) => double.infinity;

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
/// 渲染消息、工具过程与业务卡片，流式回复保持同一阅读布局。
class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<String, bool> _expandedTools = {};
  AiChatModel? _model;
  String? _sessionId;
  int _userCount = 0;
  bool _nearBottom = true;
  bool _preservingPosition = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final model = context.read<AiChatModel>();
    if (identical(model, _model)) return;
    _model?.removeListener(_onModelChanged);
    _model = model;
    model.addListener(_onModelChanged);
    _onModelChanged();
  }

  void _onModelChanged() {
    final model = _model!;
    final userCount = model.messages.where((m) => m.role == 'user').length;
    final changedSession = _sessionId != model.currentSessionId;
    final force = changedSession || userCount > _userCount;
    _sessionId = model.currentSessionId;
    _userCount = userCount;
    if (changedSession) _inputController.clear();
    if (force || _nearBottom) {
      _scrollToBottom();
    } else {
      _preserveReadingPosition();
    }
  }

  // reverse 列表从底部计量偏移；新回复变高时补偿增量，保持正在阅读的内容位置。
  void _preserveReadingPosition() {
    if (_preservingPosition || !_scrollController.hasClients) return;
    _preservingPosition = true;
    final position = _scrollController.position;
    final extent = position.maxScrollExtent;
    final offset = position.pixels;
    final session = _sessionId;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preservingPosition = false;
      if (!mounted ||
          !_scrollController.hasClients ||
          _nearBottom ||
          session != _sessionId ||
          _scrollController.position != position ||
          (position.pixels - offset).abs() > .5) {
        return;
      }
      final delta = position.maxScrollExtent - extent;
      if (delta.abs() > .5) {
        position.jumpTo((offset + delta).clamp(0.0, position.maxScrollExtent));
      }
    });
  }

  void _onScroll() {
    final near =
        !_scrollController.hasClients || _scrollController.offset <= 80;
    if (near != _nearBottom && mounted) setState(() => _nearBottom = near);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // 进入 AI 页自动拉取一次当日用量。
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<AiChatModel>().refreshUsage();
    });
  }

  @override
  void dispose() {
    _model?.removeListener(_onModelChanged);
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });
  }

  void _handleSend() {
    final text = _inputController.text;
    if (text.trim().isEmpty || context.read<AiChatModel>().isGenerating) return;
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
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('取消')),
          TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('删除')),
        ],
      ),
    );
    if (ok == true) await model.deleteSession(id);
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AiChatModel>();
    final entries = buildAiChatEntries(
        sessionId: model.currentSessionId,
        messages: model.messages,
        generating: model.isGenerating,
        streamingText: model.streamingText,
        toolLabel: model.toolStatusLabel);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.surface,
      endDrawer: _SessionDrawer(onDeleteSession: _confirmDeleteSession),
      body: Column(children: [
        _AiTopBar(
          subtitle: model.currentTitle,
          onNewSession: model.isGenerating ? null : () => model.newSession(),
          onMenuPressed: () {
            model.refreshUsage();
            _scaffoldKey.currentState?.openEndDrawer();
          },
        ),
        Expanded(
            child: entries.isEmpty
                ? _EmptyState(onPrompt: (text) => model.send(text))
                : Stack(children: [
                    Positioned.fill(
                        child: ListView.builder(
                      key: PageStorageKey(
                          'ai-timeline:${model.currentSessionId}'),
                      controller: _scrollController,
                      reverse: true,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemCount: entries.length,
                      findChildIndexCallback: (key) {
                        final index = entries
                            .indexWhere((entry) => ValueKey(entry.id) == key);
                        return index < 0 ? null : entries.length - index - 1;
                      },
                      itemBuilder: (context, index) {
                        final entryIndex = entries.length - index - 1;
                        final entry = entries[entryIndex];
                        // 一条用户消息到下一条用户消息之间，只在回复开头显示标题。
                        final startsReply = entry.kind != AiEntryKind.user &&
                            (entryIndex == 0 ||
                                entries[entryIndex - 1].kind ==
                                    AiEntryKind.user);
                        return Padding(
                          key: ValueKey(entry.id),
                          padding: const EdgeInsets.only(bottom: 18),
                          child: AiChatWidth(
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                if (startsReply) ...[
                                  const AiAssistantHeading(),
                                  const SizedBox(height: 8),
                                ],
                                _entry(entry),
                              ])),
                        );
                      },
                    )),
                    if (!_nearBottom)
                      Positioned(
                          right: 20,
                          bottom: 12,
                          child: FloatingActionButton.small(
                            heroTag: null,
                            elevation: 2,
                            tooltip: '回到最新',
                            onPressed: _scrollToBottom,
                            child: const Icon(Icons.arrow_downward_rounded),
                          )),
                  ])),
        if (model.errorMessage != null)
          AiChatWidth(
              child: _ErrorBar(
                  message: model.errorMessage!,
                  retryable: model.lastErrorRetryable,
                  onRetry: () => model.regenerate())),
        AiChatComposer(
          controller: _inputController,
          generating: model.isGenerating,
          onSend: _handleSend,
          onStop: model.stop,
        ),
      ]),
    );
  }

  Widget _entry(AiChatEntry entry) => switch (entry.kind) {
        AiEntryKind.user => AiMessageView(user: true, text: entry.text),
        AiEntryKind.assistant => AiMessageView(user: false, text: entry.text),
        AiEntryKind.activity => AiActivityView(label: entry.text),
        AiEntryKind.tools => AiToolGroup(
            entry: entry,
            expanded: _expandedTools[entry.id] ?? false,
            onExpansionChanged: (value) => _expandedTools[entry.id] = value),
        AiEntryKind.cards =>
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            if (hangarCardIdsOf(entry.message!).isNotEmpty)
              _HangarCards(ids: hangarCardIdsOf(entry.message!)),
            if (buybackCardIdsOf(entry.message!).isNotEmpty)
              _BuybackCards(ids: buybackCardIdsOf(entry.message!)),
            if (itemCardUuidsOf(entry.message!).isNotEmpty)
              _ItemCards(
                  key: ValueKey(entry.id),
                  uuids: itemCardUuidsOf(entry.message!)),
          ]),
      };
}

class _ErrorBar extends StatelessWidget {
  final String message;
  final bool retryable;
  final VoidCallback onRetry;

  const _ErrorBar(
      {required this.message, required this.retryable, required this.onRetry});

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
            child: Text(message,
                style: TextStyle(color: cs.onErrorContainer, fontSize: 13)),
          ),
          if (retryable)
            TextButton(onPressed: onRetry, child: const Text('重试')),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  /// 点击示例提问时把该问题直接发给小九。
  final ValueChanged<String> onPrompt;

  const _EmptyState({required this.onPrompt});

  @override
  Widget build(BuildContext context) {
    return AiChatWidth(
        child: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image(
                image: AssetImage('assets/images/cirno_ai.jpg'),
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                _SuggestionChip(
                    prompt: '帮我规划极光到英仙座的 CCU 升级路径',
                    onPrompt: onPrompt),
                _SuggestionChip(
                    prompt: '看看我的机库', onPrompt: onPrompt),
                _SuggestionChip(
                    prompt: '我的回购里有什么？', onPrompt: onPrompt),
                _SuggestionChip(
                    prompt: '极光MR多少钱？', onPrompt: onPrompt),
                _SuggestionChip(
                    prompt: '锤头鲨有多大？', onPrompt: onPrompt),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

/// 空状态里的示例提问药丸：浅底圆角 + 点击涟漪，点了把 [prompt] 发给小九。
class _SuggestionChip extends StatelessWidget {
  final String prompt;
  final ValueChanged<String> onPrompt;

  const _SuggestionChip({
    required this.prompt,
    required this.onPrompt,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: cs.surfaceContainerLow,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onPrompt(prompt),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          child: Text(
            prompt,
            style: TextStyle(fontSize: 13, color: cs.onSurface),
          ),
        ),
      ),
    );
  }
}

class _AiTopBar extends StatelessWidget {
  const _AiTopBar(
      {required this.subtitle,
      required this.onNewSession,
      required this.onMenuPressed});
  final String subtitle;
  final VoidCallback? onNewSession;
  final VoidCallback onMenuPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 52),
          child: Row(children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: ClipOval(
                  child: Image(
                image: AssetImage('assets/images/cirno_ai.jpg'),
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              )),
            ),
            Expanded(
                child: Row(children: [
              const Text('小九', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 8),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                        color: colors.primary.withValues(alpha: .12),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text('Beta',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: colors.primary)),
                  ),
                  const SizedBox(height: 3),
                  Text(subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: colors.onSurfaceVariant)),
                ],
              )),
            ])),
            IconButton(
                tooltip: '新建对话',
                onPressed: onNewSession,
                icon: const Icon(Icons.add_comment_outlined, size: 21)),
            IconButton(
                tooltip: '会话',
                onPressed: onMenuPressed,
                icon: const Icon(Icons.forum_outlined, size: 21)),
          ]),
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
    // 卡片沿用原有格式，宽度由聊天阅读区域约束。
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
                    HangarItemWidget(
                        hangarItem: it, onTap: _openHangarItemSheet),
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
    // 卡片沿用原有格式，宽度由聊天阅读区域约束。
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
class _ItemCards extends StatefulWidget {
  final List<String> uuids;

  const _ItemCards({super.key, required this.uuids});

  @override
  State<_ItemCards> createState() => _ItemCardsState();
}

class _ItemCardsState extends State<_ItemCards> {
  late Future<List<Widget>> _cards;
  @override
  void initState() {
    super.initState();
    _cards = _resolve();
  }

  @override
  void didUpdateWidget(covariant _ItemCards oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(oldWidget.uuids, widget.uuids)) _cards = _resolve();
  }

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
    return widget.uuids.map(_cardForUuid).whereType<Widget>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Widget>>(
      future: _cards,
      builder: (context, snapshot) {
        final cards = snapshot.data ?? const <Widget>[];
        if (cards.isEmpty) return const SizedBox.shrink();
        // 与助手正文使用同一阅读宽度。
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
      body = Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
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
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 12,
            runSpacing: 4,
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
          color: cs.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cs.outlineVariant.withValues(alpha: .6)),
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
      backgroundColor: cs.surface,
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
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: sessions.length,
                itemBuilder: (context, index) {
                  final s = sessions[index];
                  final selected = s.id == model.currentSessionId;
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        selected: selected,
                        selectedTileColor:
                            cs.primaryContainer.withValues(alpha: .55),
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
                          onPressed: disabled
                              ? null
                              : () => onDeleteSession(s.id, s.title),
                        ),
                        onTap: disabled
                            ? null
                            : () {
                                Navigator.pop(context);
                                context.read<AiChatModel>().switchSession(s.id);
                              },
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
