import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/widgets/webview/rsi_webpage.dart';
import '../../datasource/data_model.dart';
import '../../datasource/models/buyback.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


import 'package:intl/intl.dart';

import '../../funcs/shop/buyback.dart';
import '../shop/cart/cart.dart';

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

  /// iOS 暂不支持批量回购，保留原有单个回购流程。
  void _showSingleBuybackDialog(BuildContext context) {
    final dialog = AlertDialog(
      title: Text('回购确认'),
      content: Text('确认回购 ${buybackItem.chinesName} 吗？'),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
          },
          child: const Text('关闭'),
        ),
        TextButton(
          onPressed: () async {
            try {
              if (buybackItem.isUpgrade) {
                await addUpgradeBuybackItemToCart(buybackItem);
              } else {
                await addBuybackPledgeToCart(buybackItem);
              }
            } catch (e) {
              showAlert(message: "回购失败: $e");
              Navigator.of(context).pop();
              return;
            }
            Navigator.of(context).pop();
            showToast(message: '成功添加回购到购物车');
            showCartBottomSheet(context);
          },
          child: const Text('确认'),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => dialog);
  }


  void _showBatchBuybackDialog(BuildContext context) {
    final controller = TextEditingController(text: '1');
    final maxNumber = buybackItem.number;
    final dialog = AlertDialog(
      title: const Text('回购确认'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('确认回购 ${buybackItem.chinesName} 吗？'),
          const SizedBox(height: 12),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: '回购数量（1~$maxNumber）',
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('关闭'),
        ),
        TextButton(
          onPressed: () {
            final quantity = int.tryParse(controller.text.trim());
            if (quantity == null || quantity < 1 || quantity > maxNumber) {
              showToast(message: '请输入 1~$maxNumber 之间的数量');
              return;
            }
            Navigator.of(context).pop();
            performBatchBuyback(context, buybackItem, quantity);
          },
          child: const Text('确认'),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Platform.isIOS) {
          _showSingleBuybackDialog(context);
        } else {
          _showBatchBuybackDialog(context);
        }
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
                          children: [

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