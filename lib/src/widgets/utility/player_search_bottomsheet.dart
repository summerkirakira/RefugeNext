import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../network/parsers/player_info_parser.dart';



class DetailInfoItem extends StatelessWidget {
  final String title;
  final String value;
  final Widget leading;

  const DetailInfoItem(
      {Key? key,
        required this.leading,
        required this.title,
        required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        children: [
          leading,
          SizedBox(width: 10),
          Text(title,
              style: const TextStyle(fontSize: 16)),
          Spacer(),
          Text(value, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

// 输入页面
WoltModalSheetPage inputPage(BuildContext context, TextEditingController controller, Function(String) onSearch) {
  return WoltModalSheetPage(
    hasSabGradient: false,
    navBarHeight: 1,
    isTopBarLayerAlwaysVisible: true,
    pageTitle: const Padding(
        padding: EdgeInsets.only(left: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('玩家搜索', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
            ))
          ],
        )
    ),
    topBarTitle: const Text(''),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: '玩家ID',
              hintText: '请输入玩家Handle',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 250),
        ],
      ),
    ),
    stickyActionBar: Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
          bottom: 20
      ),
      child: ElevatedButton(
        onPressed: () => onSearch(controller.text),
        child: const Text('搜索'),
      ),
    ),
  );
}



class OrganizationInfo extends StatefulWidget {

  final PlayerSearchResult playerInfo;

  const OrganizationInfo({Key? key, required this.playerInfo}) : super(key: key);

  @override
  _OrganizationInfoState createState() => _OrganizationInfoState();
}

class _OrganizationInfoState extends State<OrganizationInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Container(
              child: Row(children: [
                AdvancedAvatar(
                    name: 'Hangar',
                    size: 85,
                    image: CachedNetworkImageProvider(widget.playerInfo.organization!.logo),
                    margin: EdgeInsets.only(),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    )),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        widget.playerInfo.organization!.name,
                        style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Row(
                      children: List.generate(
                        5,
                            (index) => widget.playerInfo.organization!.rank >=
                            5 - index
                            ? Icon(Icons.star)
                            : Icon(Icons.star_outline),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(widget.playerInfo.organization!.rankName,
                        style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ])))
    ]);
  }
}



// 结果页面
WoltModalSheetPage resultPage(BuildContext context, PlayerSearchResult playerInfo) {
  return WoltModalSheetPage(
    hasSabGradient: false,
    navBarHeight: 60,
    isTopBarLayerAlwaysVisible: true,
    topBarTitle: Text(playerInfo.handle),
    leadingNavBarWidget: Container(
      height: 38,
      width: 38,
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2), // 设置背景颜色
        shape: BoxShape.circle, // 设置形状为圆形
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: const Icon(Icons.arrow_back, size: 22),
        onPressed: () {
          WoltModalSheet.of(context).popPage();
          // WoltModalSheet.of(context).showAtIndex(0);
        },
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
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(playerInfo.image),
            ),
          ),
          const SizedBox(height: 16),
          if (playerInfo.organization != null) ...[
            OrganizationInfo(playerInfo: playerInfo)
          ],
          const SizedBox(height: 16),

          DetailInfoItem(
            leading: Icon(Icons.person_outline),
            title: '昵称',
            value: playerInfo.name,
          ),

          DetailInfoItem(
            leading: Icon(Icons.account_box_outlined),
            title: 'Handle',
            value: playerInfo.handle,
          ),

          DetailInfoItem(
            leading: Icon(Icons.schedule_outlined),
            title: '注册时间',
            value: playerInfo.enlisted,
          ),

          DetailInfoItem(
            leading: Icon(Icons.location_on_outlined),
            title: '地点',
            value: playerInfo.location ?? '未知',
          ),

          DetailInfoItem(
            leading: Icon(Icons.language_outlined),
            title: '语言',
            value: playerInfo.fluency,
          ),

          const SizedBox(height: 80),
        ],
      ),
    ),
  );
}

// 使用示例
void showPlayerSearchSheet(BuildContext context) {
  final TextEditingController controller = TextEditingController();
  final ValueNotifier<int> pageIndexNotifier = ValueNotifier(0);
  PlayerSearchResult? playerInfo;

  WoltModalSheet.show<void>(
    context: context,
    pageListBuilder: (BuildContext modalSheetContext) {
      return [
        inputPage(modalSheetContext, controller, (String handle) async {
          final result = await getPlayerSearchResult(handle);
          if (result != null) {
            playerInfo = result;
            final nextPage = resultPage(modalSheetContext, playerInfo!);
            WoltModalSheet.of(modalSheetContext).addPage(nextPage);
            WoltModalSheet.of(modalSheetContext).showAtIndex(1);
          } else {
            showToast(message: "未找到玩家信息");
          }
        }),
      ];
    },
    pageIndexNotifier: pageIndexNotifier,
  );
}
