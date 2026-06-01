import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../datasource/models/buyback.dart';
import '../../funcs/shop/buyback.dart';
import '../../funcs/toast.dart';
import '../../repo/ship_alias.dart';
import '../hangar/hangar_item_detail_widget.dart' show getUpgradeFromWiget, priceString;
import '../shop/cart/cart.dart';
import 'buyback_item.dart';

/// 回购物品详情头部：图片 + 数量角标 + 中文名/英文名/回购日期
Widget _getBuybackHeader(BuildContext context, BuybackItem item) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 120,
        width: 120,
        child: BuybackItemImageWidget(buybackItem: item),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: SizedBox(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.chinesName ?? item.title, style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              )),
              const SizedBox(height: 5),
              Text(item.title, style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey
              )),
              const Spacer(),
              Text('回购日期: ${formatTimestamp(item.date)}', style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey
              )),
            ],
          ),
        ),
      ),
    ],
  );
}

/// 升级包 from→to 舰船展示（仿机库 getUpgradeSubHangarItemWidget）。
/// 两端舰船均能解析时返回卡片，否则返回 null 由调用方回退到纯文本。
Widget? _getUpgradeShipWidget(BuildContext context, BuybackItem item) {
  final shipAliasRepo = ShipAliasRepo();
  final fromShip = shipAliasRepo.getShipAliasByUpgradeIdSync(item.formShipUpgradeId ?? -1);
  final toShip = shipAliasRepo.getShipAliasByUpgradeIdSync(item.toShipUpgradeId ?? -1);

  if (fromShip == null || toShip == null) {
    return null;
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          SizedBox(
            height: 80,
            width: 120,
            child: CachedNetworkImage(
              imageUrl: item.image,
              placeholder: (context, url) => LoadingAnimationWidget.threeArchedCircle(
                  color: Theme.of(context).indicatorColor, size: 30),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getUpgradeFromWiget(context, fromShip, true),
                  const SizedBox(height: 12),
                  getUpgradeFromWiget(context, toShip, false),
                ],
              ),
            ),
          ),
        ],
      ),
      if (item.price > 0)
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              const Text('升级价 ', style: TextStyle(fontSize: 14)),
              Text('\$${priceString(item.price)}', style: const TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold)),
            ],
          ),
        ),
    ],
  );
}

/// 详情内容区：升级包展示 from→to 舰船（解析失败回退「升级包含」文本），普通回购展示 also-contains 列表
Widget _getBuybackContent(BuildContext context, BuybackItem item) {
  if (item.isUpgrade) {
    final shipWidget = _getUpgradeShipWidget(context, item);
    if (shipWidget != null) {
      return shipWidget;
    }

    final contains = (item.chineseContains?.isNotEmpty ?? false)
        ? item.chineseContains!
        : item.contains;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('升级包含', style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold
        )),
        if (contains.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(contains, style: const TextStyle(fontSize: 15)),
          ),
      ],
    );
  }

  // 普通回购：展示真实「包含」内容（已翻译的 chineseContains，回退原文 contains）。
  final contains = (item.chineseContains?.isNotEmpty ?? false)
      ? item.chineseContains!
      : item.contains;
  final containLines = contains
      .split('\n')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();

  // alsoContains 实际是回购提示语（如「回购此物品将会消耗一次回购机会」）。
  final note = (item.chineseAlsoContains?.isNotEmpty ?? false)
      ? item.chineseAlsoContains!
      : item.alsoContains;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (containLines.isNotEmpty) ...[
        const Text('包含', style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold
        )),
        for (final line in containLines)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(line, style: const TextStyle(fontSize: 15)),
          ),
      ],
      if (note.trim().isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.info_outline, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Expanded(
                child: Text(note.trim(), style: const TextStyle(
                    fontSize: 13, color: Colors.grey)),
              ),
            ],
          ),
        ),
    ],
  );
}

/// 回购确认页：复用现有加购逻辑，按平台分支（iOS 单个 / 安卓批量）。
WoltModalSheetPage getBuybackConfirmSheet(
    BuildContext modalSheetContext, BuildContext rootContext, BuybackItem item) {
  final maxNumber = item.number;
  final controller = TextEditingController(text: '1');
  final isBatch = !Platform.isIOS;

  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text('回购确认',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('确认回购 ${item.chinesName ?? item.title} 吗？',
              style: const TextStyle(fontSize: 16)),
          if (isBatch) ...[
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '回购数量（1~$maxNumber）',
                border: const OutlineInputBorder(),
              ),
            ),
          ],
          const SizedBox(height: 90),
        ],
      ),
    ),
    stickyActionBar: Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(modalSheetContext).primaryColor,
        ),
        onPressed: () async {
          if (isBatch) {
            final quantity = int.tryParse(controller.text.trim());
            if (quantity == null || quantity < 1 || quantity > maxNumber) {
              showToast(message: '请输入 1~$maxNumber 之间的数量');
              return;
            }
            Navigator.of(modalSheetContext).pop();
            await performBatchBuyback(rootContext, item, quantity);
            return;
          }

          // iOS 单个回购
          try {
            if (item.isUpgrade) {
              await addUpgradeBuybackItemToCart(item);
            } else {
              await addBuybackPledgeToCart(item);
            }
          } catch (e) {
            showAlert(message: "回购失败: $e");
            return;
          }
          Navigator.of(modalSheetContext).pop();
          showToast(message: '成功添加回购到购物车');
          showCartBottomSheet(rootContext);
        },
        child: const Text('确认回购', style: TextStyle(fontSize: 16)),
      ),
    ),
  );
}

/// 回购物品详情页（仿商店 getCatalogItemDetailSheet）。
/// [rootContext] 用于在关闭本 sheet 后弹出购物车 / 打开网页等后续操作。
WoltModalSheetPage getBuybackItemDetailSheet(
    BuildContext modalSheetContext, BuildContext rootContext, BuybackItem item) {
  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text('回购详情',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    ),
    trailingNavBarWidget: Container(
      height: 38,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: const Icon(Icons.close, size: 22),
        onPressed: Navigator.of(modalSheetContext).pop,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getBuybackHeader(modalSheetContext, item),
          const Divider(),
          _getBuybackContent(modalSheetContext, item),
          const SizedBox(height: 160),
        ],
      ),
    ),
    stickyActionBar: Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(modalSheetContext).primaryColor,
          ),
          onPressed: () {
            WoltModalSheet.of(modalSheetContext)
                .addPage(getBuybackConfirmSheet(modalSheetContext, rootContext, item));
            WoltModalSheet.of(modalSheetContext).showNext();
          },
          child: const Text('回购', style: TextStyle(fontSize: 16)),
        ),
      ),
    ),
  );
}
