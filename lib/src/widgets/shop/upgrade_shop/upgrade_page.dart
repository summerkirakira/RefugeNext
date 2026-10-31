import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../datasource/models/shop/cart_snapshot.dart' show cartMoney;
import '../../../datasource/models/shop/upgrade_ship_info.dart';
import '../../hangar/ccu_optimizor/ccu_planner_components.dart';
import '../cart/cart.dart';
import 'ship_select_bottomsheet.dart';
import 'upgrade_checkout_bottomsheet.dart';
import 'upgrade_controller.dart';

class UpgradePage extends StatefulWidget {
  const UpgradePage(
      {super.key, this.controller, this.developerMode = false, this.openCart});
  final UpgradeController? controller;
  final bool developerMode;

  /// Completes once the cart is presented, without waiting for its dismissal.
  final Future<void> Function(BuildContext)? openCart;
  @override
  State<UpgradePage> createState() => _UpgradePageState();
}

class _UpgradePageState extends State<UpgradePage> {
  late final _controller =
      widget.controller ?? UpgradeController(RsiUpgradeGateway());
  final _fromPicker = ShipPickerState()..ascending = false;
  final _toPicker = ShipPickerState();
  bool _openingCart = false;
  String? _cartError;

  @override
  void initState() {
    super.initState();
    if (_controller.options == null) _controller.load();
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  Future<void> _select(bool source) async {
    final c = _controller;
    final options = c.options;
    if (!c.canEdit || options == null) return;
    final ship = await selectUpgradeShip(context,
        ships: source ? options.from : options.to,
        source: source,
        currency: options.currency,
        state: source ? _fromPicker : _toPicker,
        selectedId: source ? c.from?.id : c.to?.id);
    if (!mounted || ship == null) return;
    setState(() => _cartError = null);
    if (source) {
      await c.selectFrom(ship);
    } else {
      await c.selectTo(ship, preferWarbond: _toPicker.restricted);
    }
  }

  Future<void> _openCart() async {
    if (_openingCart) return;
    final navigator = Navigator.of(context);
    final route = ModalRoute.of(context);
    setState(() {
      _openingCart = true;
      _cartError = null;
    });
    try {
      await (widget.openCart ?? showCartBottomSheet)(context);
      if (mounted && route != null && route.isActive && !route.isFirst) {
        // The cart is now above this route; remove only the upgrade page.
        navigator.removeRoute(route);
      }
    } catch (_) {
      if (mounted) setState(() => _cartError = '购物车暂时无法加载，请再打开一次');
    } finally {
      if (mounted) setState(() => _openingCart = false);
    }
  }

  Widget _ships() => LayoutBuilder(builder: (context, constraints) {
        final compact = constraints.maxWidth < 600;
        Widget selector(bool source) {
          final c = _controller;
          final ship = source ? c.from : c.to;
          String? image(String? url) => url == null || url.isEmpty
              ? null
              : Uri.parse('https://robertsspaceindustries.com/')
                  .resolve(url)
                  .toString();
          return CcuShipSelector(
            key: ValueKey(source ? 'upgrade-from' : 'upgrade-to'),
            label: source ? '起始舰船' : '目标舰船',
            compact: compact,
            isTarget: !source,
            ship: ship == null
                ? null
                : CcuShipView(
                    name: upgradeShipName(ship),
                    englishName: ship.name ?? '',
                    imageUrl: image(ship.medias?.productThumbMediumAndSmall),
                    heroUrl: image(ship.medias?.slideShow)),
            priceText: ship?.msrp != null
                ? '价格 ${cartMoney(ship!.msrp!, c.options!.currency)}'
                : null,
            onTap: c.canEdit ? () => _select(source) : null,
          );
        }

        return compact
            ? Column(children: [
                selector(true),
                const SizedBox(height: 10),
                selector(false)
              ])
            : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(child: selector(true)),
                const SizedBox(width: 16),
                Expanded(child: selector(false)),
              ]);
      });

  Widget _versions() {
    final c = _controller;
    final versions = c.to?.skus ?? <Skus>[];
    if (versions.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text('升级版本',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(width: 10),
            Text(c.from == null ? '目标船价' : '升级差价',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: colors.onSurfaceVariant)),
          ]),
          const SizedBox(height: 12),
          LayoutBuilder(builder: (context, constraints) {
            final columns = constraints.maxWidth < 330 ||
                    MediaQuery.textScalerOf(context).scale(1) > 1.3
                ? 1
                : 2;
            final width = (constraints.maxWidth - (columns - 1) * 12) / columns;
            return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: versions.map((sku) {
                  final price = c.from == null ? sku.price : sku.upgradePrice;
                  final selected = sku.id == c.sku?.id;
                  return SizedBox(
                      width: width,
                      child: Semantics(
                          selected: selected,
                          button: true,
                          child: Material(
                              color: selected
                                  ? colors.primary.withValues(alpha: .07)
                                  : colors.surface,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                      color: selected
                                          ? colors.primary
                                              .withValues(alpha: .65)
                                          : colors.outlineVariant
                                              .withValues(alpha: .55))),
                              clipBehavior: Clip.antiAlias,
                              child: InkWell(
                                  onTap: c.canEdit && sku.canPurchase
                                      ? () => c.selectSku(sku)
                                      : null,
                                  child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Expanded(
                                                  child: Text(sku.versionName,
                                                      style: theme
                                                          .textTheme.labelLarge
                                                          ?.copyWith(
                                                              color: sku
                                                                      .canPurchase
                                                                  ? colors
                                                                      .onSurface
                                                                  : theme
                                                                      .disabledColor))),
                                              const SizedBox(width: 8),
                                              Icon(
                                                  selected
                                                      ? Icons.check_circle
                                                      : Icons
                                                          .radio_button_unchecked,
                                                  size: 18,
                                                  color: selected
                                                      ? colors.primary
                                                      : colors.outline),
                                            ]),
                                            const SizedBox(height: 12),
                                            Text(
                                                !sku.canPurchase
                                                    ? '暂不可售'
                                                    : price == null
                                                        ? '报价待确认'
                                                        : cartMoney(
                                                            price,
                                                            c.options!
                                                                .currency),
                                                style: theme
                                                    .textTheme.titleLarge
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: selected
                                                            ? colors.primary
                                                            : colors.onSurface,
                                                        fontFeatures: const [
                                                      FontFeature
                                                          .tabularFigures()
                                                    ])),
                                            const SizedBox(height: 6),
                                            Text(
                                                sku.isWarbond
                                                    ? '现金支付'
                                                    : '信用点支付',
                                                style: theme.textTheme.bodySmall
                                                    ?.copyWith(
                                                        color: colors
                                                            .onSurfaceVariant)),
                                          ]))))));
                }).toList());
          }),
        ]));
  }

  Widget _message(String message, {bool error = false, Widget? action}) =>
      Padding(
          padding: const EdgeInsets.only(top: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CcuNotice(message: message, error: error),
            if (action != null) action,
          ]));

  Widget _bottomBar() {
    final c = _controller;
    final busy = c.busy || _openingCart;
    final complete = c.added || c.needsCartReview;
    final hasQuote =
        c.hasCurrentQuote && c.from != null && c.sku?.upgradePrice != null;
    final hint = c.from == null
        ? '请选择起始舰船'
        : c.to == null
            ? '请选择目标舰船'
            : c.hasCurrentQuote
                ? '报价待确认'
                : '请刷新升级报价';
    return DecoratedBox(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(
                top: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .outlineVariant
                        .withValues(alpha: .4)))),
        child: SafeArea(
            top: false,
            child: Center(
                heightFactor: 1,
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 960),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                        child: LayoutBuilder(builder: (context, constraints) {
                          final price = Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('价格',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                const SizedBox(height: 4),
                                Text(
                                    c.hasCurrentQuote &&
                                            c.from != null &&
                                            c.sku?.upgradePrice != null
                                        ? cartMoney(c.sku!.upgradePrice!,
                                            c.options!.currency)
                                        : hint,
                                    key: const ValueKey('upgrade-price'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                            color: hasQuote
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .onSurfaceVariant,
                                            fontSize: hasQuote ? 26 : 14,
                                            fontFeatures: const [
                                              FontFeature.tabularFigures()
                                            ],
                                            fontWeight: FontWeight.w700)),
                              ]);
                          final button = FilledButton.icon(
                            key: const ValueKey('upgrade-add'),
                            style: FilledButton.styleFrom(
                                minimumSize: const Size(0, 48),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: busy || (!complete && !c.canAdd)
                                ? null
                                : () async {
                                    if (complete) {
                                      await _openCart();
                                      return;
                                    }
                                    if (await c.add() && mounted) {
                                      await _openCart();
                                    }
                                  },
                            icon: busy
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2))
                                : Icon(complete
                                    ? Icons.shopping_cart_outlined
                                    : Icons.add_shopping_cart),
                            label: Text(_openingCart
                                ? '正在打开购物车'
                                : c.busy
                                    ? '正在处理'
                                    : c.needsCartReview
                                        ? '检查购物车'
                                        : c.added
                                            ? '打开购物车'
                                            : '加入购物车'),
                          );
                          if (constraints.maxWidth < 300 ||
                              MediaQuery.textScalerOf(context).scale(1) > 1.3) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  price,
                                  const SizedBox(height: 12),
                                  button
                                ]);
                          }
                          return Row(children: [
                            Expanded(child: price),
                            const SizedBox(width: 16),
                            button
                          ]);
                        }))))));
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        final c = _controller;
        return PopScope(
            canPop: !c.submitting && !_openingCart,
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  iconTheme: IconThemeData(
                      color: Theme.of(context).colorScheme.onSurface),
                  actionsIconTheme: IconThemeData(
                      color: Theme.of(context).colorScheme.onSurface),
                  systemOverlayStyle: (Theme.of(context).brightness ==
                              Brightness.dark
                          ? SystemUiOverlayStyle.light
                          : SystemUiOverlayStyle.dark)
                      .copyWith(
                          statusBarColor: Colors.transparent,
                          systemNavigationBarColor:
                              Theme.of(context).colorScheme.surface,
                          systemNavigationBarIconBrightness:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Brightness.light
                                  : Brightness.dark),
                  surfaceTintColor: Colors.transparent,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  title: Text('舰船升级',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w700)),
                  actions: [
                    if (c.added || c.needsCartReview)
                      TextButton(
                          onPressed: c.busy || _openingCart
                              ? null
                              : () {
                                  _cartError = null;
                                  c.load();
                                },
                          child: const Text('新建升级'))
                    else
                      IconButton(
                          tooltip: '刷新报价',
                          onPressed: c.busy
                              ? null
                              : () => c.options == null
                                  ? c.load()
                                  : c.refreshQuote(),
                          icon: const Icon(Icons.refresh)),
                    if (c.options != null && c.canEdit)
                      PopupMenuButton<String>(
                        tooltip: '升级更多操作',
                        onSelected: (value) {
                          if (value == 'clearFrom') {
                            c.selectFrom(null);
                            return;
                          }
                          if (value == 'clearTo') {
                            c.selectTo(null);
                            return;
                          }
                          WoltModalSheet.show<void>(
                              context: context,
                              pageListBuilder: (modalContext) => [
                                    getUpgradeCheckoutBottomSheet(modalContext,
                                        c.from!, c.to!, c.sku!, context)
                                  ]);
                        },
                        itemBuilder: (_) => [
                          PopupMenuItem(
                              value: 'clearFrom',
                              enabled: c.from != null,
                              child: const Text('清除起始舰船')),
                          PopupMenuItem(
                              value: 'clearTo',
                              enabled: c.to != null,
                              child: const Text('清除目标舰船')),
                          if (widget.developerMode && c.canAdd)
                            const PopupMenuItem(
                                value: 'batch', child: Text('批量购买（开发者）')),
                        ],
                      ),
                  ]),
              body: c.options == null
                  ? Center(
                      child: c.busy
                          ? const CircularProgressIndicator()
                          : Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(c.error ?? '暂无升级信息',
                                        textAlign: TextAlign.center),
                                    const SizedBox(height: 12),
                                    FilledButton(
                                        onPressed: c.load,
                                        child: const Text('重新加载')),
                                  ])))
                  : Align(
                      alignment: Alignment.topCenter,
                      child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 960),
                          child: ListView(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 12, 16, 24),
                              children: [
                                _ships(),
                                _versions(),
                                if (c.added) _message('升级包已加入购物车'),
                                if (c.notice != null) _message(c.notice!),
                                if (c.error != null)
                                  _message(c.error!,
                                      error: true,
                                      action: c.needsCartReview
                                          ? null
                                          : TextButton(
                                              onPressed: c.busy
                                                  ? null
                                                  : c.refreshQuote,
                                              child: const Text('刷新报价'))),
                                if (_cartError != null)
                                  _message(_cartError!, error: true),
                              ]))),
              bottomNavigationBar: c.options == null ? null : _bottomBar(),
            ));
      });
}
