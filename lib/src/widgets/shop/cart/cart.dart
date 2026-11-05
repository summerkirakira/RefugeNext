import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../../datasource/models/shop/cart_snapshot.dart';
import '../../../datasource/models/shop/store_model.dart' show LineItem;
import '../../../funcs/shop/catalog_price.dart';
import '../../../funcs/toast.dart';
import '../../../funcs/validation.dart';
import '../../../funcs/rsi_web_session.dart';
import '../../../services/rsi_web_session.dart';
import '../../../repo/translation.dart';
import '../../webview/rsi_webpage.dart';
import 'cart_controller.dart';
import 'package:refuge_next/src/widgets/common/hover_gesture_detector.dart';

Future<void> showCartBottomSheet(BuildContext context,
    {bool isBuyback = false}) async {
  final open = await prepareCartBottomSheet(context, isBuyback: isBuyback);
  open();
}

/// Keep loading separate so the product dialog can retry without adding again.
Future<VoidCallback> prepareCartBottomSheet(BuildContext context,
    {bool isBuyback = false}) async {
  // Restore anonymous sessions before capturing the cart's account generation.
  await rsiWebSession.ensure(RsiWebSessionAttempt());
  final gateway = RsiCartGateway();
  final initial = await gateway.load();
  return () {
    if (context.mounted) {
      showCartSheet(
          context,
          CartController(
              gateway: gateway, initial: initial, isBuyback: isBuyback));
    }
  };
}

/// Owns the controller until the sheet content unmounts.
/// Also accepts a mock gateway for UI verification.
Future<void> showCartSheet(BuildContext context, CartController controller,
    {Future<bool> Function()? authenticate,
    Future<void> Function(BuildContext)? openWeb}) async {
  BuildContext? sheetContext;
  await WoltModalSheet.show<void>(
    context: context,
    showDragHandle: false,
    onModalDismissedWithBarrierTap: () {
      if (sheetContext?.mounted == true && controller.busy == null) {
        Navigator.of(sheetContext!).maybePop();
      }
    },
    pageListBuilder: (modalContext) {
      sheetContext = modalContext;
      return [
        WoltModalSheetPage(
          enableDrag: false,
          navBarHeight: 64,
          hasTopBarLayer: true,
          isTopBarLayerAlwaysVisible: true,
          leadingNavBarWidget: ListenableBuilder(
            listenable: controller,
            builder: (context, _) => Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const Text('购物车',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                Text('${controller.snapshot.count} 件',
                    style: Theme.of(context).textTheme.bodySmall),
              ]),
            ),
          ),
          trailingNavBarWidget: ListenableBuilder(
            listenable: controller,
            builder: (context, _) =>
                Row(mainAxisSize: MainAxisSize.min, children: [
              PopupMenuButton<String>(
                tooltip: '购物车更多操作',
                enabled: controller.busy == null,
                onSelected: (value) async {
                  if (value == 'refresh') {
                    await controller.refresh();
                    return;
                  }
                  final confirmed = await showDialog<bool>(
                      context: modalContext,
                      builder: (context) => AlertDialog(
                            title: const Text('清空购物车？'),
                            content: Text(
                                '将移除购物车中的 ${controller.snapshot.count} 件商品。'),
                            actions: [
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: const Text('取消')),
                              TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: const Text('清空')),
                            ],
                          ));
                  if (confirmed == true) await controller.clear();
                },
                itemBuilder: (_) => [
                  const PopupMenuItem(value: 'refresh', child: Text('刷新购物车')),
                  PopupMenuItem(
                      value: 'clear',
                      enabled: controller.canEdit &&
                          controller.snapshot.items.isNotEmpty,
                      child: const Text('清空购物车')),
                ],
              ),
              IconButton(
                  tooltip: '关闭购物车',
                  onPressed: controller.busy != null
                      ? null
                      : () => Navigator.pop(modalContext),
                  icon: const Icon(Icons.close)),
              const SizedBox(width: 8),
            ]),
          ),
          child: CartContent(controller: controller),
          stickyActionBar: _CartFooter(
            controller: controller,
            close: () => Navigator.of(modalContext).pop(),
            checkout: () => controller.checkout(
              authenticate: authenticate ??
                  () => authenticateWithBiometrics(reason: '请验证以购买物品'),
              openWeb: () async {
                if (!modalContext.mounted) return;
                if (openWeb != null) {
                  await openWeb(modalContext);
                } else {
                  await openRsiCartWebview(
                      context: modalContext, replace: true);
                }
              },
              completed: () {
                showToast(message: '购买成功！');
                if (modalContext.mounted) Navigator.of(modalContext).pop();
              },
            ),
          ),
        )
      ];
    },
  );
}

class CartContent extends StatefulWidget {
  const CartContent({super.key, required this.controller});
  final CartController controller;

  @override
  State<CartContent> createState() => _CartContentState();
}

class _CartContentState extends State<CartContent> {
  CartController get controller => widget.controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          final cart = controller.snapshot;
          final roomyFooter = MediaQuery.sizeOf(context).width < 360 ||
              MediaQuery.textScalerOf(context).scale(14) > 18;
          return PopScope(
            canPop: controller.busy == null,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  16,
                  8,
                  16,
                  (roomyFooter ? 240 : 130) +
                      (controller.errorTarget == 'checkout' &&
                              controller.error != null
                          ? 120
                          : 0)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (controller.busy == 'refresh' ||
                        controller.busy == 'clear')
                      const LinearProgressIndicator(),
                    if (controller.error != null &&
                        (controller.errorTarget == null ||
                            controller.errorTarget == 'clear'))
                      _CartError(controller: controller),
                    if (cart.items.isEmpty)
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: Column(children: [
                            Icon(Icons.shopping_cart_outlined, size: 52),
                            SizedBox(height: 16),
                            Text('购物车为空',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                            SizedBox(height: 6),
                            Text('去商店挑选喜欢的商品'),
                          ]))
                    else ...[
                      for (final item in cart.items)
                        Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child:
                                _CartItem(item: item, controller: controller)),
                      _CreditPanel(controller: controller),
                      const SizedBox(height: 16),
                      _CartTotals(cart: cart),
                    ],
                  ]),
            ),
          );
        },
      );
}

class _CartItem extends StatelessWidget {
  const _CartItem({required this.item, required this.controller});
  final LineItem item;
  final CartController controller;

  Future<void> _editQuantity(BuildContext context) async {
    final value = await showDialog<int>(
        context: context, builder: (_) => _QuantityDialog(item: item));
    if (value != null) await controller.changeQuantity(item, value);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final price = CatalogPrice(
        original: item.unitPriceWithTax.amount,
        discounted: item.unitPriceWithTax.discounted);
    final cart = controller.snapshot;
    final title = TranslationRepo()
        .getTranslationSync(item.upgrade?.name ?? item.sku.title);
    var image =
        (item.upgrade?.thumbnail ?? item.sku.media.thumbnail?.storeSmall ?? '')
            .replaceAll('\\', '');
    if (image.startsWith('/')) {
      image = 'https://robertsspaceindustries.com$image';
    }
    final tags = <String, Color>{
      if (item.sku.isWarbond == true) '战争债券': Colors.orange.shade800,
      if (price.savingsPercent case final percent?)
        '省 $percent%': colors.primary,
      if (item.upgrade != null) '升级': colors.primary,
      if (item.sku.subtitle.isNotEmpty)
        TranslationRepo().getTranslationSync(item.sku.subtitle): colors.primary,
    };
    final quantity = Row(mainAxisSize: MainAxisSize.min, children: [
      IconButton(
          key: ValueKey('decrease-${item.id}'),
          tooltip: '减少数量',
          onPressed: controller.canEdit && item.qty > item.sku.minQty
              ? () => controller.changeQuantity(item, item.qty - 1)
              : null,
          icon: const Icon(Icons.remove, size: 20)),
      TextButton(
          key: ValueKey('quantity-${item.id}'),
          style: TextButton.styleFrom(
              minimumSize: const Size(40, 44),
              disabledForegroundColor: colors.onSurface,
              padding: const EdgeInsets.symmetric(horizontal: 4)),
          onPressed: controller.canEdit && item.sku.maxQty > item.sku.minQty
              ? () => _editQuantity(context)
              : null,
          child: Text('${item.qty}',
              semanticsLabel: item.sku.maxQty > item.sku.minQty
                  ? '数量 ${item.qty}，点击修改'
                  : '数量 ${item.qty}，本单限购 ${item.sku.maxQty} 件')),
      IconButton(
          key: ValueKey('increase-${item.id}'),
          tooltip: '增加数量',
          onPressed: controller.canEdit && item.qty < item.sku.maxQty
              ? () => controller.changeQuantity(item, item.qty + 1)
              : null,
          icon: const Icon(Icons.add, size: 20)),
    ]);
    final subtotal =
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Wrap(spacing: 5, alignment: WrapAlignment.end, children: [
        Text('单价 ${cartMoney(price.current, cart.currency)}',
            style: Theme.of(context).textTheme.bodySmall),
        if (price.hasDiscount)
          Text(cartMoney(price.original, cart.currency),
              style: TextStyle(
                  fontSize: 12,
                  color: colors.onSurface.withValues(alpha: .5),
                  decoration: TextDecoration.lineThrough)),
      ]),
      Text('小计 ${cartMoney(cart.lineTotals[item.id]!, cart.currency)}',
          key: ValueKey('line-total-${item.id}'),
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: colors.primary)),
    ]);
    return _Panel(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
                width: 76,
                height: 64,
                child: image.isEmpty
                    ? const _ImagePlaceholder()
                    : CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => const _ImagePlaceholder(),
                        errorWidget: (_, __, ___) =>
                            const _ImagePlaceholder()))),
        const SizedBox(width: 10),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Wrap(spacing: 5, runSpacing: 4, children: [
            for (final tag in tags.entries)
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                      color: tag.value.withValues(alpha: .09),
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(tag.key,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      strutStyle: const StrutStyle(
                          fontSize: 11, height: 1.2, forceStrutHeight: true),
                      style: TextStyle(
                          fontSize: 11, height: 1.2, color: tag.value))),
          ]),
        ])),
        IconButton(
            key: ValueKey('remove-${item.id}'),
            tooltip: '删除商品',
            constraints: const BoxConstraints(minWidth: 40, minHeight: 44),
            padding: const EdgeInsets.all(8),
            onPressed:
                controller.canEdit ? () => controller.remove(item) : null,
            icon: Icon(Icons.delete_outline,
                size: 20, color: colors.onSurface.withValues(alpha: .6))),
      ]),
      const SizedBox(height: 8),
      LayoutBuilder(
          builder: (context, constraints) => constraints.maxWidth < 280 ||
                  MediaQuery.textScalerOf(context).scale(14) > 18
              ? Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Align(alignment: Alignment.centerLeft, child: quantity),
                  subtotal
                ])
              : Row(children: [
                  quantity,
                  const SizedBox(width: 8),
                  Expanded(child: subtotal)
                ])),
      if (controller.busy == item.id) const LinearProgressIndicator(),
      if (controller.error != null && controller.errorTarget == item.id)
        _CartError(controller: controller),
    ]));
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();
  @override
  Widget build(BuildContext context) => ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Center(child: Icon(Icons.image_outlined)));
}

class _Panel extends StatelessWidget {
  const _Panel({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: .12)),
          borderRadius: BorderRadius.circular(12)),
      child: child);
}

class _CreditPanel extends StatelessWidget {
  const _CreditPanel({required this.controller});
  final CartController controller;
  @override
  Widget build(BuildContext context) {
    final cart = controller.snapshot;
    return _Panel(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('信用点抵扣',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      const SizedBox(height: 6),
      Wrap(spacing: 12, runSpacing: 4, children: [
        Text('余额 ${cartMoney(cart.balance, cart.balanceCurrency)}',
            style: Theme.of(context).textTheme.bodySmall),
        Text('本单可用 ${cartMoney(cart.maxCredit, cart.currency)}',
            style: Theme.of(context).textTheme.bodySmall),
      ]),
      if (cart.maxCredit == 0 && cart.creditApplied == 0) ...[
        const SizedBox(height: 8),
        Text(cart.items.every((i) => i.sku.isWarbond == true)
            ? '战争债券商品不可使用信用点'
            : cart.balance == 0
                ? '暂无可用信用点'
                : '本单暂不可使用信用点'),
      ] else ...[
        const SizedBox(height: 12),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: TextField(
            key: const ValueKey('cart-credit-input'),
            controller: controller.creditInput,
            enabled: controller.canEdit,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.done,
            scrollPadding: const EdgeInsets.only(bottom: 260, top: 20),
            onSubmitted: (_) => controller.applyCredit(),
            decoration: InputDecoration(
                labelText: '抵扣金额（${cart.currency}）',
                isDense: true,
                border: const OutlineInputBorder(),
                errorText: controller.creditError,
                errorMaxLines: 3),
          )),
          const SizedBox(width: 8),
          TextButton(
              onPressed: controller.canEdit &&
                      controller.creditDirty &&
                      controller.creditError == null
                  ? () => controller.applyCredit()
                  : null,
              child: const Text('应用')),
        ]),
        Wrap(spacing: 4, children: [
          TextButton(
              onPressed: controller.canEdit && cart.maxCredit > 0
                  ? () => controller.applyCredit(cart.maxCredit)
                  : null,
              child: const Text('使用最大可用')),
          if (cart.creditApplied > 0)
            TextButton(
                onPressed:
                    controller.canEdit ? () => controller.applyCredit(0) : null,
                child: const Text('取消抵扣')),
          if (controller.creditDirty)
            TextButton(
                onPressed: controller.busy == null
                    ? controller.cancelCreditDraft
                    : null,
                child: const Text('取消修改')),
        ]),
        Text('已抵扣 ${cartMoney(cart.creditApplied, cart.currency)}',
            style: Theme.of(context).textTheme.bodySmall),
      ],
      if (controller.busy == 'credit') const LinearProgressIndicator(),
      if (controller.error != null && controller.errorTarget == 'credit')
        _CartError(controller: controller),
    ]));
  }
}

class _CartTotals extends StatelessWidget {
  const _CartTotals({required this.cart});
  final CartSnapshot cart;
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(children: [
        _row(context, '商品金额', cart.subtotal),
        if (cart.discount != 0) _row(context, '优惠', -cart.discount.abs()),
        if (cart.coupon != 0) _row(context, '优惠码抵扣', -cart.coupon.abs()),
        for (final tax in cart.taxes)
          if (tax.amount != 0) _row(context, tax.name, tax.amount),
        if (cart.shipping != 0) _row(context, '运费', cart.shipping),
        if (cart.creditApplied != 0)
          _row(context, '信用点抵扣', -cart.creditApplied),
      ]));
  Widget _row(BuildContext context, String label, int cents) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium)),
        const SizedBox(width: 12),
        Flexible(
            fit: FlexFit.tight,
            child: Text(cartMoney(cents, cart.currency),
                textAlign: TextAlign.end)),
      ]));
}

class _CartError extends StatelessWidget {
  const _CartError({required this.controller, this.compact = false});
  final CartController controller;
  final bool compact;
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (compact)
          InkWell(
            borderRadius: hoverBorderRadius,
            onTap: () => showDialog<void>(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('操作提示'),
                      content:
                          SingleChildScrollView(child: Text(controller.error!)),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('关闭'))
                      ],
                    )),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(controller.error!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
              const Text('查看详情',
                  style: TextStyle(
                      fontSize: 12, decoration: TextDecoration.underline)),
            ]),
          )
        else
          Text(controller.error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error)),
        if (controller.needsRefresh && !controller.webReviewRequired)
          TextButton(
              onPressed: controller.busy == null ? controller.refresh : null,
              child: const Text('刷新确认')),
      ]));
}

class _CartFooter extends StatelessWidget {
  const _CartFooter(
      {required this.controller, required this.close, required this.checkout});
  final CartController controller;
  final VoidCallback close;
  final Future<void> Function() checkout;
  @override
  Widget build(BuildContext context) => ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final colors = Theme.of(context).colorScheme;
        final cart = controller.snapshot;
        final total =
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('应付（${cart.currency}）',
              style: Theme.of(context).textTheme.bodySmall),
          Text(cartMoney(cart.total, cart.currency),
              key: const ValueKey('cart-payable'),
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colors.primary)),
        ]);
        final button = FilledButton(
          key: const ValueKey('cart-checkout'),
          style: FilledButton.styleFrom(
              minimumSize: const Size(0, 48),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: controller.busy != null
              ? null
              : controller.webReviewRequired
                  ? checkout
                  : cart.items.isEmpty
                      ? close
                      : controller.canCheckout
                          ? () {
                              FocusScope.of(context).unfocus();
                              checkout();
                            }
                          : null,
          child: Text(controller.busy == 'checkout'
              ? '正在处理…'
              : controller.webReviewRequired
                  ? '前往官网检查'
                  : cart.items.isEmpty
                      ? '继续逛商店'
                      : '确认购买'),
        );
        return Material(
          color: colors.surface,
          child: SafeArea(
              top: false,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (controller.error != null &&
                            controller.errorTarget == 'checkout')
                          _CartError(controller: controller, compact: true),
                        if (controller.creditDirty && cart.items.isNotEmpty)
                          Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text('信用点修改尚未应用，请应用或取消修改',
                                  style: TextStyle(
                                      fontSize: 12, color: colors.error))),
                        if (controller.needsRefresh &&
                            controller.errorTarget != 'checkout')
                          const Padding(
                              padding: EdgeInsets.only(bottom: 6),
                              child: Text('金额待刷新确认',
                                  style: TextStyle(fontSize: 12))),
                        if (cart.items.isEmpty && !controller.webReviewRequired)
                          button
                        else
                          LayoutBuilder(
                              builder: (context, constraints) =>
                                  constraints.maxWidth < 310 ||
                                          MediaQuery.textScalerOf(context)
                                                  .scale(14) >
                                              18
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                              total,
                                              const SizedBox(height: 8),
                                              button
                                            ])
                                      : Row(children: [
                                          Expanded(child: total),
                                          const SizedBox(width: 12),
                                          Expanded(child: button)
                                        ])),
                      ]))),
        );
      });
}

class _QuantityDialog extends StatefulWidget {
  const _QuantityDialog({required this.item});
  final LineItem item;
  @override
  State<_QuantityDialog> createState() => _QuantityDialogState();
}

class _QuantityDialogState extends State<_QuantityDialog> {
  late final input = TextEditingController(text: '${widget.item.qty}');
  @override
  void dispose() {
    input.dispose();
    super.dispose();
  }

  int? get value => int.tryParse(input.text);
  bool get valid =>
      value != null &&
      value! >= widget.item.sku.minQty &&
      value! <= widget.item.sku.maxQty;
  @override
  Widget build(BuildContext context) => AlertDialog(
          title: const Text('修改数量'),
          content: TextField(
              key: const ValueKey('cart-quantity-input'),
              controller: input,
              autofocus: true,
              keyboardType: TextInputType.number,
              onChanged: (_) => setState(() {}),
              onSubmitted: (_) {
                if (valid) Navigator.pop(context, value);
              },
              decoration: InputDecoration(
                  labelText: '数量',
                  helperText:
                      '可选 ${widget.item.sku.minQty}～${widget.item.sku.maxQty}',
                  errorText: valid ? null : '请输入允许范围内的整数')),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('取消')),
            FilledButton(
                onPressed: valid ? () => Navigator.pop(context, value) : null,
                child: const Text('确定')),
          ]);
}
