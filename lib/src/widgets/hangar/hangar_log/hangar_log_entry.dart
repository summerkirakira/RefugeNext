import 'package:flutter/material.dart';

import '../../../datasource/models/hangar/hangar_log.dart';

/// 只格式化已记录的信息，不从礼包名称推断升级后的舰船。
class HangarLogEntry {
  HangarLogEntry(this.log, {required String Function(String) translate}) {
    name = translate(log.name);
    final reason = log.reason?.trim();
    final source = log.source?.trim();
    switch (log.type) {
      case 'CREATED':
        title = '购买物品';
        icon = Icons.shopping_bag_outlined;
        amountLabel = '购买价值';
      case 'RECLAIMED':
        title = '回收物品';
        icon = Icons.recycling_rounded;
        amountLabel = '回收金额';
      case 'GIFT':
        title = '赠送礼物';
        icon = Icons.card_giftcard_rounded;
        summary = _has(log.operator) ? '赠送给 ${log.operator}' : null;
      case 'GIFT_CLAIMED':
        title = '领取礼物';
        icon = Icons.redeem_rounded;
        summary = _has(log.operator) ? '${log.operator} 领取了礼物' : null;
      case 'GIFT_CANCELLED':
        title = '取消赠送';
        icon = Icons.undo_rounded;
      case 'CONSUMED':
        title = '消耗物品';
        icon = Icons.check_circle_outline_rounded;
        summary = _has(source) ? '用于物品 #$source' : null;
      case 'APPLIED_UPGRADE':
        title = '应用升级';
        icon = Icons.upgrade_rounded;
        amountLabel = '升级后价值';
        summary = _has(reason) ? '使用 ${translate(reason!)}' : null;
      case 'BUYBACK':
        title = '回购物品';
        icon = Icons.shopping_cart_outlined;
      case 'NAME_CHANGE':
        title = '舰船命名';
        icon = Icons.edit_outlined;
        // 解析器 source 保存 Name Reservation 的括号内容，reason 为物品代码。
        summary = _has(source) ? '命名为「$source」' : null;
      case 'NAME_CHANGE_RECLAIMED':
        title = '释放舰船名称';
        icon = Icons.edit_off_outlined;
        summary = _has(source) ? '释放名称「$source」' : null;
      case 'GIVEAWAY':
        title = '获得物品';
        icon = Icons.celebration_outlined;
      default:
        title = '物品记录';
        icon = Icons.history_rounded;
        summary = _has(reason) ? reason : null;
    }
    void add(String label, String? value) {
      if (_has(value)) details.add((label, value!.trim()));
    }

    add('物品名称', name);
    add('物品编号', log.target);
    if (log.type == 'APPLIED_UPGRADE') {
      add('CCU 编号', source);
      add('使用的 CCU', _has(reason) ? translate(reason!) : null);
    } else if (log.type == 'CONSUMED') {
      add('目标物品编号', source);
    } else if (log.type == 'NAME_CHANGE' ||
        log.type == 'NAME_CHANGE_RECLAIMED') {
      add('舰船名称', source);
      add('物品代码', reason);
    } else {
      add('关联编号', source);
      add('原因', reason);
    }
    add(log.type == 'GIFT' ? '接收人' : '操作人', log.operator);
    add('订单号', log.order);
    if (title == '物品记录') add('记录类型', log.type);
  }

  final HangarLog log;
  late final String name;
  String title = '';
  IconData icon = Icons.history_rounded;
  String amountLabel = '物品价值';
  String? summary;
  final details = <(String, String)>[];

  static bool _has(String? value) => value != null && value.trim().isNotEmpty;

  String? get amount {
    final cents = log.price;
    if (cents == null) return null;
    return '\$${cents % 100 == 0 ? cents ~/ 100 : (cents / 100).toStringAsFixed(2)}';
  }
}
