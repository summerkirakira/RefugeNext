import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/funcs/shop/cart.dart' show addCatalogToCart;
import '../../../funcs/shop/catalog_price.dart';
import 'catalog_price_widgets.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../cart/cart.dart' show prepareCartBottomSheet;
import 'catalog_purchase_controller.dart';
import '../../../network/graphql/shop/catalog_purchase_availability.dart';

Future<void> showCatalogItemDetail(BuildContext context, CatalogProperty item,
    {CatalogPurchaseController? purchase}) async {
  BuildContext? sheetContext;
  await WoltModalSheet.show<void>(
    context: context,
    showDragHandle: false,
    onModalDismissedWithBarrierTap: () {
      if (sheetContext?.mounted == true) Navigator.of(sheetContext!).maybePop();
    },
    pageListBuilder: (modalContext) {
      sheetContext = modalContext;
      return [
        getCatalogItemDetailSheet(modalContext, item, context,
            purchase: purchase)
      ];
    },
  );
}

WoltModalSheetPage getCatalogItemDetailSheet(BuildContext modelSheetContext,
    CatalogProperty catalogProperty, BuildContext context,
    {CatalogPurchaseController? purchase}) {
  final controller = purchase ??
      CatalogPurchaseController(
        add: (quantity) => addCatalogToCart(catalogProperty, quantity),
        prepareCart: () => prepareCartBottomSheet(context),
        loadAvailability: () =>
            CatalogPurchaseAvailabilityQuery().execute(catalogProperty.id),
      );
  return WoltModalSheetPage(
    navBarHeight: 64,
    hasTopBarLayer: false,
    heroImageHeight: 160,
    heroImage: _CatalogHero(item: catalogProperty),
    enableDrag: false,
    trailingNavBarWidget: ListenableBuilder(
      listenable: controller,
      builder: (context, _) => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: SizedBox(
          width: 48,
          height: 48,
          child: IconButton(
            tooltip: '关闭商品详情',
            padding: const EdgeInsets.all(4),
            onPressed:
                controller.busy ? null : () => Navigator.of(context).maybePop(),
            icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withValues(alpha: .38),
              ),
              child: Icon(Icons.close,
                  size: 24,
                  color: controller.busy ? Colors.white54 : Colors.white),
            ),
          ),
        ),
      ),
    ),
    child: CatalogPurchaseContent(item: catalogProperty, purchase: controller),
    stickyActionBar: ListenableBuilder(
      listenable: controller,
      builder: (context, _) => _PurchaseFooter(
        item: catalogProperty,
        purchase: controller,
        close: () => Navigator.of(modelSheetContext).pop(),
      ),
    ),
  );
}

class _CatalogHero extends StatelessWidget {
  const _CatalogHero({required this.item});
  final CatalogProperty item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final rawImage = item.media.thumbnail.slideshow.isNotEmpty
        ? item.media.thumbnail.slideshow
        : item.media.thumbnail.storeSmall;
    final url = rawImage.startsWith('/')
        ? 'https://robertsspaceindustries.com$rawImage'
        : rawImage;
    Widget placeholder() => ColoredBox(
          color: colors.surfaceContainerHighest,
          child: Center(
              child: Icon(Icons.image_outlined,
                  color: colors.onSurfaceVariant, size: 36)),
        );
    return SizedBox.expand(
      child: url.isEmpty
          ? placeholder()
          : CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (_, __) => placeholder(),
              errorWidget: (_, __, ___) => placeholder(),
            ),
    );
  }
}

class CatalogPurchaseContent extends StatefulWidget {
  const CatalogPurchaseContent(
      {super.key, required this.item, required this.purchase});
  final CatalogProperty item;
  final CatalogPurchaseController purchase;

  @override
  State<CatalogPurchaseContent> createState() => _CatalogPurchaseContentState();
}

class _CatalogPurchaseContentState extends State<CatalogPurchaseContent> {
  @override
  void initState() {
    super.initState();
    widget.purchase.initialize();
  }

  @override
  void dispose() {
    widget.purchase.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final purchase = widget.purchase;
    final colors = Theme.of(context).colorScheme;
    final excerpt = (item.chineseExcerpt?.trim().isNotEmpty ?? false)
        ? item.chineseExcerpt!.trim()
        : (item.excerpt?.trim() ?? '');
    return ListenableBuilder(
      listenable: purchase,
      builder: (context, _) => PopScope(
        canPop: !purchase.busy,
        child: Padding(
          // Reserved for the fixed action bar, including its large-text layout.
          padding: EdgeInsets.fromLTRB(
              20,
              0,
              20,
              MediaQuery.textScalerOf(context).scale(14) > 18 ||
                      MediaQuery.sizeOf(context).width < 360
                  ? 220
                  : 150),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 16),
            Text(item.title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            CatalogBadges(item: item),
            const SizedBox(height: 12),
            CatalogPriceLabel(item: item, large: true),
            const SizedBox(height: 20),
            Row(children: [
              const Expanded(
                  child: Text('数量',
                      style: TextStyle(fontWeight: FontWeight.w600))),
              if (purchase.cartOnly)
                Flexible(
                    flex: 3,
                    child: Text('购物车已有 ${purchase.cartQuantity} 件，已达本单上限',
                        textAlign: TextAlign.end))
              else ...[
                IconButton(
                  tooltip: '减少数量',
                  onPressed: purchase.busy ||
                          purchase.added ||
                          (purchase.quantity ?? purchase.minimumQuantity) <=
                              purchase.minimumQuantity
                      ? null
                      : () => purchase.step(-1),
                  icon: const Icon(Icons.remove),
                ),
                SizedBox(
                    width: 64,
                    child: TextField(
                      key: const ValueKey('catalog-quantity'),
                      controller: purchase.quantityText,
                      scrollPadding:
                          const EdgeInsets.only(bottom: 220, top: 16),
                      enabled:
                          purchase.ready && !purchase.busy && !purchase.added,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: purchase.changeQuantity,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    )),
                IconButton(
                  tooltip: '增加数量',
                  onPressed: purchase.busy ||
                          purchase.added ||
                          (purchase.quantity ?? purchase.minimumQuantity) >=
                              purchase.maximumQuantity
                      ? null
                      : () => purchase.step(1),
                  icon: const Icon(Icons.add),
                ),
              ],
            ]),
            if (purchase.quantityError != null)
              Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(purchase.quantityError!,
                      style: TextStyle(color: colors.error))),
            if (excerpt.isNotEmpty) ...[
              const Divider(height: 32),
              Text('商品介绍', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              Text(excerpt, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ]),
        ),
      ),
    );
  }
}

class _PurchaseFooter extends StatelessWidget {
  const _PurchaseFooter(
      {required this.item, required this.purchase, required this.close});
  final CatalogProperty item;
  final CatalogPurchaseController purchase;
  final VoidCallback close;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final displayedQuantity =
        purchase.cartOnly ? purchase.cartQuantity : purchase.quantity;
    final amount = displayedQuantity == null
        ? '—'
        : catalogMoney(CatalogPrice.forItem(item).current * displayedQuantity);
    final total =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(purchase.cartOnly ? '购物车内商品小计' : '商品小计',
          style: Theme.of(context).textTheme.bodySmall),
      Text(amount,
          key: const ValueKey('catalog-subtotal'),
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: colors.primary, fontWeight: FontWeight.bold)),
    ]);
    final button = FilledButton(
      key: const ValueKey('catalog-add'),
      style: FilledButton.styleFrom(
          minimumSize: const Size(0, 48),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onPressed: !purchase.canSubmit
          ? null
          : () {
              FocusScope.of(context).unfocus();
              purchase.submit(close);
            },
      child: Text(purchase.busy
          ? (!purchase.ready
              ? '正在检查…'
              : purchase.added || purchase.cartOnly
                  ? '正在打开购物车…'
                  : '正在添加…')
          : !purchase.ready
              ? '重试'
              : purchase.cartOnly
                  ? '打开购物车'
                  : purchase.added
                      ? '重新打开购物车'
                      : '加入购物车'),
    );
    return Material(
        color: colors.surface,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (purchase.error != null)
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(purchase.error!,
                            style: TextStyle(color: colors.error))),
                  LayoutBuilder(builder: (context, constraints) {
                    if (constraints.maxWidth < 320 ||
                        MediaQuery.textScalerOf(context).scale(14) > 18) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [total, const SizedBox(height: 8), button]);
                    }
                    return Row(children: [
                      Expanded(child: total),
                      const SizedBox(width: 16),
                      Expanded(child: button)
                    ]);
                  }),
                ]),
          ),
        ));
  }
}
