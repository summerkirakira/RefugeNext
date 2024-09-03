import 'package:flutter/cupertino.dart';
import '../../datasource/models/hangar.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../widgets/general/screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:image/image.dart' as img;
import '../../funcs/images.dart';


String priceString(int price) {
  if (price % 100 == 0) {
    return (price ~/ 100).toString();
  } else {
    return (price / 100).toStringAsFixed(2);
  }
}


Widget SubHangarItemWidget(BuildContext context, HangarSubItem item) {
  return Row(
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
                Text(item.title, style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                )),
                const SizedBox(height: 5),
                Text(item.subtitle, style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey
                )),
              ],
            ),
          )
      ),
    ],
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
      children: [
        Column(
          children: [
            Text('可融价值', style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            )),
            const SizedBox(height: 5),
            Text("\$${priceString(price)}", style: const TextStyle(
              fontSize: 16,
              color: Colors.grey
            ))
          ],
        ),
        Spacer(),
        Column(
          children: [
            Text('当前价值', style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            )),
            const SizedBox(height: 5),
            Text("\$${priceString(currentPrice)}", style: const TextStyle(
                fontSize: 16,
                color: Colors.grey
            ))
          ],
        ),
      ],
    ),
  );
}


Widget getActionIconList({ required BuildContext context, required HangarItem hangarItem, required Function onShare}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 0,
      bottom: 10,
      left: 30,
      right: 30
    ),
    child: Row(
      children: [
        Column(
          children: [
            IconButton(
              icon: const Icon(Icons.recycling),
              onPressed: () {
                WoltModalSheet.of(context).showAtIndex(1);
              },
            ),
            const Text('回收')
          ],
        ),
        Spacer(),
        Column(
          children: [
            IconButton(
              icon: const Icon(Icons.card_giftcard_outlined),
              onPressed: () {
              },
            ),
            const Text('礼物')
          ],
        ),
        Spacer(),
        Column(
          children: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
              },
            ),
            const Text('收藏')
          ],
        ),
        Spacer(),
        Column(
          children: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                onShare();
              },
            ),
            const Text('分享')
          ],
        ),
        Spacer(),
        Column(
          children: [
            IconButton(
              icon: const Icon(Icons.description_outlined),
              onPressed: () {
              },
            ),
            const Text('日志')
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
              Padding(
                padding: const EdgeInsets.only(
                    top: 10
                ),
                child: SubHangarItemWidget(context, subItem),
              ),
          const Divider(),
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
          const SizedBox(height: 100),
        ],
      ),
    ),
  );
}




WoltModalSheetPage getHangarItemDetailSheet(BuildContext modalSheetContext, HangarItem hangarItem) {

  ScreenshotController screenshotController = ScreenshotController();

  final detailPage = WoltModalSheetPage(
    navBarHeight: 10,
    topBarTitle: const Text('机库详情', style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold
    )),
    // isTopBarLayerAlwaysVisible: true,
    // trailingNavBarWidget: Container(
    //   height: 38,
    //   decoration: BoxDecoration(
    //     color: Colors.grey.withOpacity(0.2), // 设置背景颜色
    //     shape: BoxShape.circle, // 设置形状为圆形
    //   ),
    //   child: IconButton(
    //     padding: const EdgeInsets.all(5),
    //     icon: const Icon(Icons.close, size: 22),
    //     onPressed: Navigator.of(modalSheetContext).pop,
    //   ),
    // ),

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
