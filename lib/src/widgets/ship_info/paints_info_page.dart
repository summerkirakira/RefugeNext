import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/models/ship_info/ship.dart';
import 'package:refuge_next/src/repo/ship_info.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../datasource/data_model.dart';

class PaintInfoPage extends StatefulWidget {
  const PaintInfoPage({Key? key}) : super(key: key);

  @override
  _PaintInfoPageState createState() => _PaintInfoPageState();
}

class _PaintInfoPageState extends State<PaintInfoPage> {
  late Ship ship;

  Widget _buildPaintInfoBlock(List<Skin> paints) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 根据屏幕宽度决定每行显示的数量
        int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

        return GridView.builder(
          // 禁用GridView的滚动，因为外层已经有SingleChildScrollView
          physics: const NeverScrollableScrollPhysics(),
          // 根据内容自动计算高度
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.75, // 控制每个项目的宽高比
            crossAxisSpacing: 12, // 水平间距
            mainAxisSpacing: 12, // 垂直间距
          ),
          itemCount: paints.length,
          itemBuilder: (context, index) {
            final paint = paints[index];
            return _buildPaintItem(paint);
          },
        );
      },
    );
  }

  void _showPaintDetails(BuildContext context, Skin paint) {

    final shipInfoRepo = ShipInfoRepo();
    final manufacturer = shipInfoRepo.getManufacturerByReferenceSync(paint.manufacturer!);
    final imageUrl = manufacturer != null ? "https://image.biaoju.site/starcitizen/refuge_next/ship_info/manufacturers/${manufacturer.logo.logo}" : "";

    WoltModalSheet.show<void>(
      context: context,
      pageListBuilder: (context) {
        return [
          WoltModalSheetPage(
            hasSabGradient: true,
            isTopBarLayerAlwaysVisible: true,
            navBarHeight: 50,
            topBarTitle: Text(
              paint.chineseName ?? paint.name,
              style: const TextStyle(
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 大图展示
                  AspectRatio(
                    aspectRatio: 9 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(
                            Icons.error_outline,
                            size: 32,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 名称信息
                  if (paint.name != paint.chineseName && paint.name != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "英文名：${paint.name}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                  // 描述信息
                  if (paint.chineseDescription != null && paint.chineseDescription!.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "简介",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          paint.chineseDescription!,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),

                  // 如果有原文描述且与中文描述不同
                  if (paint.description != null &&
                      paint.description != paint.chineseDescription &&
                      paint.description!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "英文简介",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            paint.description!,
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),

                  // 其他可能的信息（如获取方式、稀有度等）
                  const SizedBox(height: 16),
                  // ... 添加其他你想展示的信息
                ],
              ),
            ),
          ),
        ];
      },
    );
  }

  Widget _buildPaintItem(Skin paint) {
    final shipInfoRepo = ShipInfoRepo();
    final manufacturer = shipInfoRepo.getManufacturerByReferenceSync(paint.manufacturer!);
    final imageUrl = manufacturer != null ? "https://image.biaoju.site/starcitizen/refuge_next/ship_info/manufacturers/${manufacturer.logo.logo}" : "";
    return InkWell(
      onTap: () {
        _showPaintDetails(context, paint);
      },
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias, // 确保子组件不会超出Card的圆角
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 32,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    paint.chineseName ?? paint.name, // 假设Skin类中有name属性
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (paint.chineseDescription != null && paint.chineseDescription!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        paint.chineseDescription!, // 假设Skin类中有description属性
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ship = Provider.of<MainDataModel>(context).currentShipInfo!;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                '涂装列表',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (ship.paints.isNotEmpty)
              _buildPaintInfoBlock(ship.paints)
            else
              const Center(
                child: Text('暂无涂装信息'),
              ),
          ],
        ),
      ),
    );
  }
}
