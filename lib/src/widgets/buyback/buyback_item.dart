import 'package:flutter/material.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/widgets/webview/rsi_webpage.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../datasource/models/buyback.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


import 'package:intl/intl.dart';

import '../../funcs/shop/buyback.dart';
import '../hangar/hangar_item_detail_widget.dart' show priceString;
import 'buyback_item_detail_widget.dart';

String formatTimestamp(int timestamp, {String format = 'yyyy年MM月dd日'}) {
  // 创建 DateTime 对象
  final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

  // 创建 DateFormat 对象
  final DateFormat formatter = DateFormat(format);

  // 格式化日期
  return formatter.format(dateTime);
}



class BuybackItemImageWidget extends StatelessWidget {
  final BuybackItem buybackItem;

  const BuybackItemImageWidget({Key? key, required this.buybackItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        child: Stack(
          children: [
            CachedNetworkImage(
                imageUrl: buybackItem.image,
                placeholder: (context, url) => Container(
                  padding: EdgeInsets.all(40),
                  child: LoadingAnimationWidget.threeArchedCircle(
                    color: Theme.of(context).indicatorColor, 
                    size: 30
                  )
                ),
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
                      )
                  ),
                )
            ),

            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                  ),
                ),
                child: Text(
                  "x${buybackItem.number}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}


Future<void> performBatchBuyback(BuildContext context, BuybackItem item, int quantity) async {
  final ids = [...item.idList]..sort();
  final selected = ids.take(quantity).toList();
  for (int i = 0; i < selected.length; i++) {
    try {
      await addBuybackToCartById(item, selected[i]);
    } catch (e) {
      showAlert(message: "回购失败: $e");
      return;
    }
    showToast(message: '已添加第 ${i + 1}/${selected.length} 个到购物车');
    if (!context.mounted) return;
    await openRsiCartWebview(context: context, replace: false);
    if (i < selected.length - 1) {
      if (!context.mounted) return;
      final goOn = await _askContinueBatch(context, remaining: selected.length - i - 1);
      if (goOn != true) {
        showToast(message: '已退出批量回购');
        return;
      }
    }
  }
  showToast(message: '批量回购完成');
}


Future<bool?> _askContinueBatch(BuildContext context, {required int remaining}) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('继续批量回购？'),
      content: Text('还剩 $remaining 个待回购。'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('退出批量回购'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('继续购买'),
        ),
      ],
    ),
  );
}

class BuybackItemWidget extends StatelessWidget {
  final BuybackItem buybackItem;

  const BuybackItemWidget({Key? key, required this.buybackItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WoltModalSheet.show<void>(
          context: context,
          pageListBuilder: (modalSheetContext) =>
              [getBuybackItemDetailSheet(modalSheetContext, context, buybackItem)],
        );
      },
      child: Container(
        height: 108,
        child: Card(
          elevation: 0,
          color: Theme.of(context).cardColor,
          child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: BuybackItemImageWidget(buybackItem: buybackItem),
                ),
                Expanded(child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 2,
                      bottom: 0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(buybackItem.chinesName!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (buybackItem.isUpgrade && buybackItem.price > 0)
                              Row(
                                children: [
                                  Text('\$', style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor)),
                                  Text(
                                    priceString(buybackItem.price),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            const Spacer(),
                            Text(formatTimestamp(buybackItem.date)),
                          ],
                        )

                      ],
                    )
                ))
              ]
          ),
        ),
      )
    );
  }
}