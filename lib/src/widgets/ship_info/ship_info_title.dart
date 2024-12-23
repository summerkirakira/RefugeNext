import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/repo/ship_info.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../datasource/models/ship_info/ship.dart';


class ShipPriceDisplay extends StatelessWidget {
  final int? usdPrice; // 以分为单位
  final int? auecPrice;

  const ShipPriceDisplay({
    super.key,
    this.usdPrice,
    this.auecPrice,
  });

  String _formatAuecPrice(int price) {
    if (price >= 1000000) {
      return '${(price / 1000000).toStringAsFixed(1)}M';
    } else if (price >= 1000) {
      return '${(price / 1000).toStringAsFixed(1)}K';
    }
    return price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end, // 改为底边对齐
      children: [
        if (usdPrice != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end, // 改为底边对齐
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4), // 添加底部间距使标签对齐更美观
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'USD',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange.shade700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '\$',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.orange.shade700,
                ),
              ),
              Text(
                '${(usdPrice! / 100).toInt()}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange.shade700,
                  height: 1,
                ),
              ),
            ],
          ),

        if (usdPrice != null && auecPrice != null)
          const SizedBox(width: 16),

        if (auecPrice != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end, // 改为底边对齐
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4), // 添加底部间距使标签对齐更美观
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'aUEC',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                _formatAuecPrice(auecPrice!),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                  height: 1,
                ),
              ),
            ],
          ),
      ],
    );
  }
}









void showShipSelector(BuildContext context) {
  final shipInfoRepo = ShipInfoRepo();
  final dataModel = Provider.of<MainDataModel>(context, listen: false);
  final allShips = shipInfoRepo.getShipsSync();

  // 创建一个 ValueNotifier 来管理过滤后的列表
  final filteredShipsNotifier = ValueNotifier<List<Ship>>(allShips);

  WoltModalSheet.show<void>(
    context: context,
    pageListBuilder: (context) {
      return [
        WoltModalSheetPage(
          hasSabGradient: true,
          isTopBarLayerAlwaysVisible: true,
          navBarHeight: 50,
          topBarTitle: const Text(
            '选择舰船',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 搜索框
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '搜索舰船...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    onChanged: (value) {
                      final searchLower = value.toLowerCase();
                      filteredShipsNotifier.value = allShips.where((ship) {
                        return (ship.chineseName?.toLowerCase() ?? '').contains(searchLower) ||
                            (ship.name.toLowerCase()).contains(searchLower);
                      }).toList();
                    },
                  ),
                ),

                // 舰船列表
                ValueListenableBuilder<List<Ship>>(
                  valueListenable: filteredShipsNotifier,
                  builder: (context, filteredShips, _) {
                    return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      physics: const ClampingScrollPhysics(),
                      itemCount: filteredShips.length,
                      itemBuilder: (context, index) {
                        final ship = filteredShips[index];
                        final isSelected = ship.ref == dataModel.currentShipInfo?.ref;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: InkWell(
                            onTap: () {
                              dataModel.setCurrentShipInfo(ship);
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.blue.withOpacity(0.1) : null,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isSelected ? Colors.blue : Colors.grey[300]!,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: SizedBox(
                                        width: 120,
                                        height: 60,
                                        child: CachedNetworkImage(
                                          imageUrl: "https://image.biaoju.site/refuge/data/ship_render/${ship.shipNameBinding?.shipPicName}.thumb.png",
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => Container(
                                            color: Colors.grey[200],
                                            child: const Center(
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) => Container(
                                            color: Colors.grey[200],
                                            child: const Icon(
                                              Icons.image_not_supported,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ship.chineseName ?? ship.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          if (ship.name != ship.chineseName && ship.name != null)
                                            Padding(
                                              padding: const EdgeInsets.only(top: 4),
                                              child: Text(
                                                ship.name,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),

                                    if (isSelected)
                                      const Icon(
                                        Icons.check_circle,
                                        color: Colors.blue,
                                        size: 24,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ];
    },
  );
}

class ShipInfoTitle extends StatefulWidget {

  const ShipInfoTitle({Key? key}) : super(key: key);

  @override
  _ShipInfoTitleState createState() => _ShipInfoTitleState();
}

class _ShipInfoTitleState extends State<ShipInfoTitle> {
  @override
  Widget build(BuildContext context) {
    final currentShipInfo = Provider.of<MainDataModel>(context).currentShipInfo!;
    final chineseName = currentShipInfo.chineseName ?? currentShipInfo.name;
    final englishName = currentShipInfo.name;
    final shipThumbnail = currentShipInfo.shipNameBinding?.shipPicName;

    final shipPicUrl ="https://image.biaoju.site/refuge/data/ship_render/$shipThumbnail.thumb.png";

    List<Sku>? shipSkus = currentShipInfo.shipAlias?.skus;

    // get highest sku
    Sku? highestSku;
    if (shipSkus != null) {
      highestSku = shipSkus.reduce((curr, next) => curr.price > next.price ? curr : next);
    }

    int? highestAuecPrice;
    if (currentShipInfo != null && currentShipInfo.shopInfo.isNotEmpty) {
      highestAuecPrice = currentShipInfo.shopInfo.reduce((curr, next) => curr.price > next.price ? curr : next).price;
    }

    return Container(
      padding: EdgeInsets.all(16),
      child: Stack(
        children: [
          Row(
            children: [
              Spacer(),
              CachedNetworkImage(
                imageUrl: shipPicUrl,
                width: 220,
                height: 110,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 200,
                    ),
                    child: Text(chineseName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    children: [
                      Text(englishName, style: TextStyle(fontSize: 16, color: Colors.grey)),
                      IconButton(
                        icon: const Icon(Icons.swap_horiz),
                        onPressed: () => showShipSelector(context),
                      )
                    ],
                  ),


                  // Spacer(),
                  if (highestSku != null || highestAuecPrice != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: ShipPriceDisplay(
                        usdPrice: highestSku?.price,
                        auecPrice: highestAuecPrice,
                      ),
                    ),
                ],
              ),
              // Text('船舶信息', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}