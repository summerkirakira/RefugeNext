import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/network/cirno/property/property.dart';
import 'package:refuge_next/src/repo/ship_alias.dart';
import 'package:refuge_next/src/repo/ship_info.dart';
import 'package:refuge_next/src/repo/translation.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_log/hangar_log_bottomsheet.dart';
import 'package:refuge_next/src/widgets/webview/rsi_webpage.dart';
import '../../datasource/data_model.dart';
import '../../datasource/models/hangar.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../widgets/general/screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import '../../funcs/images.dart';
import '../ship_info/ship_full_page.dart';
import 'ccu_optimizor/hangar_util.dart';


String priceString(int price) {
  if (price % 100 == 0) {
    return (price ~/ 100).toString();
  } else {
    return (price / 100).toStringAsFixed(2);
  }
}

Future<void> jumpToShipInfoPage(BuildContext context, ShipAlias ship) async {
  ShipInfoRepo shipInfoRepo = ShipInfoRepo();

  final shipInfo = await shipInfoRepo.getShipByAliasId(ship.id);

  if (shipInfo == null) {
    return;
  }
  Provider.of<MainDataModel>(context, listen: false).setCurrentShipInfo(shipInfo);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ShipFullPage()),
  );
}


Widget getUpgradeFromWiget(BuildContext context, ShipAlias? ship, bool isFromShip) {
  String title = isFromShip ? '从 ' : '到 ';

  if (ship == null) {
    return Row(
      children: [
        Text(title, style: const TextStyle(
            fontSize: 14,
        )),
        const Text("未知舰船", style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
        )),
        const SizedBox(width: 10)
      ],
    );
  }

  String shipName = ship.chineseName == null ? ship.name : ship.chineseName!;

  return Row(
    children: [
      Text(title, style: const TextStyle(
          fontSize: 14,
      )),
      GestureDetector(
        onTap: () async {
          await jumpToShipInfoPage(context, ship);
        },
        child: Text(shipName, style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
        )),
      ),
      const SizedBox(width: 10),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text("\$${ship.getHighestSku() ~/ 100}", style: const TextStyle(
          fontSize: 12,
          color: Colors.green,
          fontWeight: FontWeight.w600,
        )),
      ),
    ],
  );
}


Widget getUpgradeSubHangarItemWidget(BuildContext context, HangarItem hangarItem) {

  if (hangarItem.items.isEmpty) {
    return Container();
  }

  final item = hangarItem.items.first;

  return Row(
    children: [
      Container(
        height: 80,
        width: 120,
        child: CachedNetworkImage(
            imageUrl: item.image,
            placeholder: (context, url) => LoadingAnimationWidget.fourRotatingDots(color: Theme.of(context).indicatorColor, size: 30),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
            )
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
          child: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getUpgradeFromWiget(context, hangarItem.fromShip, true),
                const SizedBox(height: 12),
                getUpgradeFromWiget(context, hangarItem.toShip, false),
              ],
            ),
          )
      ),
    ],
  );
}


Widget SubHangarItemWidget(BuildContext context, HangarSubItem item) {

  final ship = ShipAliasRepo().getShipAliasSync(item.title);

  return GestureDetector(
    child: Row(
      children: [
        Container(
          height: 80,
          width: 120,
          child: CachedNetworkImage(
              imageUrl: item.image,
              placeholder: (context, url) => LoadingAnimationWidget.fourRotatingDots(color: Theme.of(context).indicatorColor, size: 30),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
              )
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: Container(
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.chineseTitle!, style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  )),
                  const SizedBox(height: 5),
                  Text(item.chineseSubtitle!, style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey
                  )),
                  const SizedBox(height: 5),
                  if (ship != null)
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Text("价格: ", style: const TextStyle(
                          //     fontSize: 16
                          // )),
                          Text("\$${ship.getHighestSku() ~/ 100}", style: const TextStyle(
                              color: Colors.green,
                              fontSize: 16
                          ))
                        ]
                    )
                ],
              ),
            )
        ),
      ],
    ),
    onTap: () async {
      if (ship != null) {
        await jumpToShipInfoPage(context, ship);
      }
    },
  );
}


Widget getPriceInfoWidget(BuildContext context, HangarItem hangarItem) {

  final price = hangarItem.price;
  final currentPrice = hangarItem.currentPrice;

  return Padding(
    padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 50,
        right: 50
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text('${priceString(price)}', style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
            )),
            const SizedBox(height: 5),
            const Text("可融(\$)", style: const TextStyle(
                fontSize: 14,
                color: Colors.grey
            ))
          ],
        ),
        const VerticalDivider(),
        Column(
          children: [
            Text('${priceString(currentPrice)}', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
            )),
            const SizedBox(height: 5),
            const Text("当前(\$)", style: TextStyle(
                fontSize: 14,
                color: Colors.grey
            ))
          ],
        ),
        const VerticalDivider(),
        Column(
          children: [
            Text('${priceString(currentPrice - price)}', style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.green
            )),
            const SizedBox(height: 5),
            const Text("节约(\$)", style: TextStyle(
                fontSize: 14,
                color: Colors.grey
            ))
          ],
        ),
      ],
    ),
  );
}

Widget getReclaimButton(BuildContext context, HangarItem hangarItem) {
  if (hangarItem.canReclaim) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            WoltModalSheet.of(context).showAtIndex(1);
          },
          child: const Column(
            children: [
              Icon(Icons.recycling),
              Text('回收')
            ]
          ),
        ),
      ],
    );
  } else {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // WoltModalSheet.of(context).showAtIndex(1);
          },
          child: const Column(
              children: [
                Icon(Icons.recycling, color: Colors.grey),
                Text('回收', style: TextStyle(color: Colors.grey))
              ]
          ),
        ),
      ],
    );
  }
}


Widget getGiftButton(BuildContext context, HangarItem hangarItem) {

  if (hangarItem.status == "Gifted") {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            WoltModalSheet.of(context).showAtIndex(3);
          },
          child: const Column(
              children: [
                Icon(Icons.undo_outlined),
                Text('撤回')
              ]
          ),
        ),
      ],
    );
  }

  if (hangarItem.canGit) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            WoltModalSheet.of(context).showAtIndex(2);
          },
          child: const Column(
              children: [
                Icon(Icons.card_giftcard_outlined),
                Text('礼物')
              ]
          ),
        ),
      ],
    );
  } else {
    return Column(
      children: [
        GestureDetector(
          onTap: () {

          },
          child: const Column(
              children: [
                Icon(Icons.card_giftcard_outlined, color: Colors.grey),
                Text('礼物', style: TextStyle(color: Colors.grey))
              ]
          ),
        )
      ],
    );
  }
}


Widget getActionIconList({ required BuildContext context, required HangarItem hangarItem, required Function onShare}) {

  int lastPage = 3;

  return Padding(
    padding: const EdgeInsets.only(
      top: 0,
      bottom: 10,
      left: 30,
      right: 30
    ),
    child: Row(
      children: [
        getReclaimButton(context, hangarItem),
        Spacer(),
        getGiftButton(context, hangarItem),
        Spacer(),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                openRsiHangarWebview(context: context, page: hangarItem.page);
              },
              child: const Column(
                  children: [
                    Icon(Icons.arrow_outward_outlined),
                    Text('跳转')
                  ]
              ),
            )
          ],
        ),
        Spacer(),
        if(hangarItem.isUpgrade)
          Column(
            children: [
              GestureDetector(
                onTap: () async {
                  final upgradePage = await getChooseTargetBottomSheet(context, hangarItem);
                  if (upgradePage == null) {
                    return;
                  }
                  WoltModalSheet.of(context).addPage(upgradePage);
                  lastPage += 1;
                  WoltModalSheet.of(context).showAtIndex(lastPage);
                },
                child: const Column(
                    children: [
                      Icon(Icons.keyboard_double_arrow_up_outlined),
                      Text('升级')
                    ]
                ),
              ),
            ],
          ),
        if(!hangarItem.isUpgrade)
          Column(
            children: [
              GestureDetector(
                onTap: () async {
                },
                child: const Column(
                    children: [
                      Icon(Icons.keyboard_double_arrow_up_outlined, color: Colors.grey),
                      Text('升级', style: TextStyle(color: Colors.grey))
                    ]
                ),
              ),
            ],
          ),
        Spacer(),
        // Column(
        //   children: [
        //     GestureDetector(
        //       onTap: () {
        //         onShare();
        //       },
        //       child: const Column(
        //           children: [
        //             Icon(Icons.share_outlined),
        //             Text('分享')
        //           ]
        //       ),
        //     ),
        //   ],
        // ),
        // Spacer(),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                final hangarLogPage = getHangarLogBottomSheet(context, hangarItem.id);
                WoltModalSheet.of(context).addPage(hangarLogPage);
                lastPage += 1;
                WoltModalSheet.of(context).showAtIndex(lastPage);
              },
              child: const Column(
                  children: [
                    Icon(Icons.description_outlined),
                    Text('日志', style: TextStyle())
                  ]
              ),
            )
          ],
        )
      ],
    ),
  );
}

class CustomScreenshot extends StatefulWidget {
  final Widget? child;
  final ScreenshotController controller;

  const CustomScreenshot({
    Key? key,
    required this.child,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomScreenshot> createState() {
    return new CustomScreenshotState();
  }
}

class CustomScreenshotState extends State<CustomScreenshot> with TickerProviderStateMixin {
  late ScreenshotController _controller;
  bool isOffstageFromDelayedCheck = true;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    checkVisibilityInitially();
  }

  void checkVisibilityInitially() {
    Future.delayed(const Duration(milliseconds: 50), () {
      if (!mounted) return;

      setState(() {
        isOffstageFromDelayedCheck = context.findAncestorWidgetOfExactType<Offstage>()?.offstage ?? false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isOffstageFromBuildCheck = context.findAncestorWidgetOfExactType<Offstage>()?.offstage ?? true;
    final isOffstage = isOffstageFromDelayedCheck && isOffstageFromBuildCheck;
    return RepaintBoundary(
      key: isOffstage ? null : _controller.containerKey,
      child: widget.child,
    );
  }
}



Widget getMainPage(ScreenshotController controller, BuildContext context, HangarItem hangarItem) {
  final isOffstage =
      context.findAncestorWidgetOfExactType<Offstage>()?.offstage == true;

  return CustomScreenshot(
    key: isOffstage ? null : const ValueKey("value_123"),
    controller: controller,
    child: Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 120,
                width: 120,
                child: CachedNetworkImage(
                    imageUrl: hangarItem.image,
                    placeholder: (context, url) => LoadingAnimationWidget.fourRotatingDots(color: Theme.of(context).indicatorColor, size: 60),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                    )
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Container(
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(hangarItem.chineseName!, style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        )),
                        const SizedBox(height: 5),
                        Text(hangarItem.name, style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey
                        )),
                      ],
                    ),
                  )
              ),
            ],
          ),
          const Divider(),
          getPriceInfoWidget(context, hangarItem),
          const Divider(),
          if (hangarItem.items.isNotEmpty)
            for (final subItem in hangarItem.items)
              if (!hangarItem.isUpgrade)
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10
                  ),
                  child: SubHangarItemWidget(context, subItem),
                ),
              if (hangarItem.isUpgrade)
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10
                  ),
                  child: getUpgradeSubHangarItemWidget(context, hangarItem),
                ),
          const Divider(),
          if (!hangarItem.isUpgrade)
            if (hangarItem.chineseAlsoContains!.isNotEmpty)
              for(final alsoContain in hangarItem.chineseAlsoContains!.split("#"))
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5
                  ),
                  child: Text('${alsoContain.trim()}', style: const TextStyle(
                    fontSize: 15,
                  )),
                ),
          if (hangarItem.isUpgrade)
            const Text('升级包含', style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold
            )),
          if (hangarItem.isUpgrade)
            Padding(
              padding: const EdgeInsets.only(
                  top: 5,
              ),
              child: Text(getUpgradeInfo(hangarItem), style: const TextStyle(
                fontSize: 15,
              )),
              ),
          const SizedBox(height: 100),
        ],
      ),
    ),
  );
}

String getUpgradeInfo(HangarItem hangarItem) {
  final List<String> upgradeInfo = [];
  for (var info in hangarItem.upgradeInfo!.targetItems!) {
    if (info.name != null) {
      upgradeInfo.add(TranslationRepo().getTranslationSync(info.name!));
    }
  }
  return upgradeInfo.join("\n");
}


WoltModalSheetPage getHangarItemDetailSheet(BuildContext modalSheetContext, HangarItem hangarItem) {

  ScreenshotController screenshotController = ScreenshotController();

  final detailPage = WoltModalSheetPage(
    navBarHeight: 1,

    child: getMainPage(screenshotController, modalSheetContext, hangarItem),
    stickyActionBar: getActionIconList(
      context: modalSheetContext,
      hangarItem: hangarItem,
      onShare: () {
        screenshotController.capture().then((image) {
          if (image == null) {
            return;
          }

          // Image jpgImage = Image.memory(img.encodeJpg(img.decodeImage(image)!));

          imageAddWaterMark(image, '@星河避难所Next').then((image) {
            final xFile = XFile.fromData(image, mimeType: 'image/png');
            Share.shareXFiles([xFile], text: '分享 ${hangarItem.name} 详情', subject: '分享 ${hangarItem.name} 详情');
          }).catchError((onError) {
            print(onError);
          });

          // XFile xFile = XFile.fromData(image, mimeType: 'image/png');

          // Convert the file to jpg

          // Image jpgImage = Image.memory(img.encodeJpg(img.decodeImage(image)!));
          //
          // final jpgImageBytes = img.encodeJpg(img.decodeImage(image)!);
          //
          // final xFile = XFile.fromData(jpgImageBytes, mimeType: 'image/jpeg');

          // Share.shareXFiles([xFile], text: '分享 ${hangarItem.name} 详情', subject: '分享 ${hangarItem.name} 详情');

        }).catchError((onError) {
          print(onError);
        });
      },
    )
  );

  return detailPage;
}
