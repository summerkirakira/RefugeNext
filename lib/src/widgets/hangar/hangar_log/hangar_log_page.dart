import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';

import '../../../datasource/models/hangar/hangar_log.dart';
import '../../../repo/hangar.dart';
import '../../../repo/translation.dart';


class TimelineItemData {
  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  final String description;
  final String time;
  final int targetItemId;
  final int price;

  TimelineItemData({
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.description,
    required this.time,
    required this.targetItemId,
    this.price = 0,
  });
}

String parseTime(int time) {
  final DateFormat format = DateFormat("yyyy年MM月d日, hh:mm", 'zh_CN');
  return format.format(DateTime.fromMillisecondsSinceEpoch(time));
}

TimelineItemData convertSingleHangarLogToTimelineItemData(HangarLog log) {

  final translationRepo = TranslationRepo();
  final hangarItemRepo = HangarRepo();

  IconData icon = Icons.shopping_cart;
  Color iconBackgroundColor = Colors.blue;
  String title = log.name;
  String description = log.chineseName ?? log.name;
  String time = parseTime(log.time);
  int targetItemId = log.target == null ? 0 : int.parse(log.target!);
  String itemName = translationRepo.getTranslationSync(log.name);
  title = itemName;

  if (log.type == 'CREATED') {
    // title = '购买物品';
    icon = Icons.airplanemode_active_outlined;
    iconBackgroundColor = Colors.deepOrangeAccent;
    description = "购买了 $itemName(#$targetItemId)";
  } else if (log.type == 'RECLAIMED') {
    // title = '回收物品';
    icon = Icons.remove;
    iconBackgroundColor = Colors.green;
    description = "回收了 $itemName(#$targetItemId)";
  } else if (log.type == 'GIFT') {
    // title = '赠送礼物';
    icon = Icons.card_giftcard;
    iconBackgroundColor = Colors.pink;
    description = "赠送了 $itemName(#$targetItemId)";
  } else if (log.type == 'GIFT_CLAIMED') {
    // title = '领取礼物';
    icon = Icons.card_giftcard;
    iconBackgroundColor = Colors.pink;
    description = "${log.operator} 领取了$itemName(#$targetItemId)";
  } else if (log.type == 'GIFT_CANCELLED') {
    // title = '取消赠品';
    icon = Icons.card_giftcard;
    iconBackgroundColor = Colors.pink;
    description = "取消了 $itemName(#$targetItemId)";
  } else if (log.type == 'CONSUMED') {
    // title = '消耗物品';
    icon = Icons.airplanemode_inactive_rounded;
    iconBackgroundColor = Colors.red;
    description = "消耗了 $itemName(#$targetItemId)";
  } else if (log.type == 'APPLIED_UPGRADE') {
    // title = '升级物品';
    icon = Icons.arrow_upward;
    iconBackgroundColor = Colors.orange;

    final upgradeName = translationRepo.getTranslationSync(log.reason!);

    description = "使用 $upgradeName(#${log.source})\n升级了:\n$itemName(#$targetItemId)";
  } else if (log.type == 'BUYBACK') {
    // title = '回购物品';
    icon = Icons.shopping_cart;
    iconBackgroundColor = Colors.blue;
    description = "回购了 $itemName(#$targetItemId)";
  } else if (log.type == 'NAME_CHANGE') {
    // title = '改名';
    icon = Icons.edit;
    iconBackgroundColor = Colors.blue;
    description = "改名为 ${log.reason}";
  } else if (log.type == 'NAME_CHANGE_RECLAIMED') {
    // title = '取消改名';
    icon = Icons.edit;
    iconBackgroundColor = Colors.blue;
    description = "取消改名为 ${log.reason}";
  } else if (log.type == 'GIVEAWAY') {
    icon = Icons.card_giftcard;
    iconBackgroundColor = Colors.pink;
    description = "获得了 $itemName(#$targetItemId)";
  }


  return TimelineItemData(
    icon: icon,
    iconBackgroundColor: iconBackgroundColor,
    title: title,
    description: description,
    time: time,
    targetItemId: targetItemId,
    price: log.price ?? 0,
  );
}

List<TimelineItemData> convertHangarLogsToTimelineItems(List<HangarLog> logs) {
  return logs.map(convertSingleHangarLogToTimelineItemData).toList();
}


class HangarLogPage extends StatefulWidget {
  int? targetItemId;

  HangarLogPage({super.key, this.targetItemId});

  @override
  State<HangarLogPage> createState() => _HangarLogPageState();
}

class _HangarLogPageState extends State<HangarLogPage> {
  late List<TimelineItemData> items;
  int limit = 50;

  @override
  void initState() {
    super.initState();
    _updateItems(limit); // 初始加载50条
  }

  void _updateItems(int limit) {
    List<HangarLog> logs = context.read<MainDataModel>().getHangarLogByTargetId(widget.targetItemId);
    if (limit > 0 && logs.length > limit) {
      logs = logs.sublist(0, limit);
    }
    setState(() {
      items = convertHangarLogsToTimelineItems(logs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return TimelineItem(
              item: item,
              onTap: () {
                // Navigator.of(context).push(...);
              },
            );
          },
        ),
        if (items.length == limit)
          GestureDetector(
            onTap: () {
              limit += 100;
              _updateItems(limit); // 加载全部数据
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              child: const Center(
                child: Text(
                  '查看更多',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        if (items.isEmpty)
          const Center(
            child: Text('暂无数据'),
          ),
        if (items.length < 5)
          SizedBox(height: 400)
      ],
    );
  }
}


class TimelineItem extends StatelessWidget {
  final TimelineItemData item;
  final VoidCallback onTap;

  const TimelineItem({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        // 添加自定义形状使波纹效果更好看
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 左侧图标部分
              SizedBox(
                width: 72,
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: item.iconBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        item.icon,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // 右侧内容部分
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.description,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          item.time,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        if (item.price != 0)
                          Text(
                            '价值 \$${item.price / 100}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.lightGreen,
                            ),
                          ),
                        const SizedBox(
                          width: 8,
                        )
                      ]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
