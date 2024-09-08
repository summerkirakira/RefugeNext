import 'package:provider/provider.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter/material.dart';
import '../../../datasource/models/shop/upgrade_ship_info.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:refuge_next/src/network/graphql/shop/step1query.dart';
import 'package:refuge_next/src/datasource/models/shop/store_model.dart'
    show LineItem, StoreData;
import 'package:refuge_next/src/network/graphql/shop/credit_query.dart';
import 'package:refuge_next/src/datasource/models/shop/credit_query_property.dart'
    show CreditQueryProperty;
import 'package:refuge_next/src/funcs/shop/cart.dart';

Future<void> refreshPage(BuildContext context) async {
  final step1query = await Step1Query().execute();
  final creditQuery = await CreditQuery().execute();
  final newPage = getCartBottomSheet(context, step1query, creditQuery);
  WoltModalSheet.of(context).replaceCurrentPage(newPage);
}

Widget getQuantityWidget(BuildContext context, LineItem item) {
  return Row(
    children: [
      if (item.qty == item.sku.minQty)
        IconButton(
            onPressed: () {}, icon: Icon(Icons.remove, color: Colors.grey))
      else
        IconButton(
            onPressed: () async {
              await updateCartNumber(item, item.qty - 1);
              await refreshPage(context);
            },
            icon: Icon(Icons.remove)),
      Text(item.qty.toString()),
      if (item.qty == item.sku.maxQty)
        IconButton(onPressed: () {}, icon: Icon(Icons.add, color: Colors.grey))
      else
        IconButton(
            onPressed: () async {
              await updateCartNumber(item, item.qty + 1);
              await refreshPage(context);
            },
            icon: Icon(Icons.add)),
    ],
  );
}

Widget getUpgradeCartWidget(BuildContext context, LineItem item) {
  return Card(
    elevation: 0,
    child: Stack(children: [
      Container(
          // height: 150,
          child: Column(children: [
        Container(
          height: 80,
          child: Row(children: [
            Container(
              width: 120,
              height: 80,
              child: CachedNetworkImage(
                  imageUrl: item.upgrade!.thumbnail.replaceAll("\\", ""),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            )),
                      )),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    item.upgrade!.name,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.sku.subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ])),
          ]),
        ),
        Row(
          children: [
            getQuantityWidget(context, item),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("\$${item.unitPriceWithTax.amount / 100}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right),
            )
          ],
        )
      ])),
      Positioned(
          right: 0,
          top: 10,
          child: IconButton(
              onPressed: () async {
                await removeCartItem(item);
                await refreshPage(context);
              },
              icon: const Icon(Icons.close_rounded, color: Colors.black)))
    ]),
  );
}

Widget getCatalogCartWidget(BuildContext context, LineItem item) {
  String? urlString = item.sku.media.thumbnail?.storeSmall;
  if (urlString != null) {
    if (urlString.startsWith("/")) {
      urlString = "https://www.robertsspaceindustries.com$urlString";
    }
  }
  return Card(
      elevation: 0,
      child: Stack(children: [
        Container(
            // height: 150,
            child: Column(children: [
          Container(
            height: 80,
            child: Row(children: [
              Container(
                width: 120,
                height: 80,
                child: CachedNetworkImage(
                    imageUrl: urlString.toString(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              )),
                        )),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      item.sku.title,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item.sku.subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ])),
              // const Spacer(),
            ]),
          ),
          Row(
            children: [
              getQuantityWidget(context, item),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("\$${item.unitPriceWithTax.amount / 100}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right),
              )
            ],
          )
        ])),
        Positioned(
            right: 0,
            top: 10,
            child: IconButton(
                onPressed: () async {
                  await removeCartItem(item);
                  await refreshPage(context);
                },
                icon: Icon(Icons.close_rounded, color: Colors.black)))
      ]));
}

Widget getListItem(BuildContext context, LineItem item) {
  if (item.upgrade != null) {
    return getUpgradeCartWidget(context, item);
  } else {
    return getCatalogCartWidget(context, item);
  }
}

int getCartTotalPrice(StoreData step1query, CreditQueryProperty credit) {
  int total = 0;
  for (var item in step1query.store.cart.lineItems) {
    total += item.unitPriceWithTax.amount * item.qty;
  }
  total -= credit.store.cart.totals.credits.amount;
  return total;
}

int getMaxApplicable(StoreData step1query, CreditQueryProperty credit) {
  if (credit.store.cart.totals.credits.maxApplicable > credit.customer.ledger.amount.value) {
    return credit.customer.ledger.amount.value;
  }
  return credit.store.cart.totals.credits.maxApplicable;
}

Widget getTotalWidget(BuildContext context, StoreData step1query, CreditQueryProperty credit) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
            child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '信用点',
              hintText: '已添加: \$${credit.store.cart.totals.credits.amount / 100} / 可用: \$${getMaxApplicable(step1query, credit) / 100}'),
              onSubmitted: (value) async {
                final number = double.tryParse(value);

                if (number == null) {
                  showToast(message: "请输入有效的数字");
                  return;
                }

                if (number * 100 > credit.store.cart.totals.credits.maxApplicable) {
                  showToast(message: "信用点不能大于总可用信用点");
                  return;
                }
                if (number * 100 > credit.customer.ledger.amount.value) {
                  showToast(message: "剩余信用点不足");
                  return;
                }
                try {
                  await updateCredit(number);
                } catch (e) {
                  showToast(message: "添加信用点失败");
                }

                await refreshPage(context);
              },
        )),
        SizedBox(width: 40),
        const Text('总计: '),
        Text('\$${getCartTotalPrice(step1query, credit) / 100}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
      ],
    ),
  );
}

Future<void> showCartBottomSheet(BuildContext context) async {
  final step1query = await Step1Query().execute();
  final creditQuery = await CreditQuery().execute();

  WoltModalSheet.show<void>(
      context: context,
      pageListBuilder: (modalSheetContext) {
        return [getCartBottomSheet(modalSheetContext, step1query, creditQuery)];
      });
}

WoltModalSheetPage getCartBottomSheet(BuildContext context,
    StoreData step1query, CreditQueryProperty creditQuery) {
  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('购物车',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ],
        )),
    trailingNavBarWidget: Container(
      height: 38,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2), // 设置背景颜色
        shape: BoxShape.circle, // 设置形状为圆形
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: const Icon(Icons.close, size: 22),
        onPressed: Navigator.of(context).pop,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        for (var item in step1query.store.cart.lineItems)
          getListItem(context, item),
        const Divider(),
        getTotalWidget(
            context, step1query, creditQuery),
        SizedBox(height: 90)
      ]),
    ),
    stickyActionBar: Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: SizedBox(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
          child: const Text('确认购买',
              style: TextStyle(
                fontSize: 16,
              )),
        ),
      ),
    ),
  );
}
