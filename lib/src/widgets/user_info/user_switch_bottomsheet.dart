import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../datasource/models/user.dart';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';
import './user_login_bottomsheet.dart';


WoltModalSheetPage getUserSwitchBottomSheet(BuildContext woltContext, BuildContext context, List<User> users) {
  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('切换用户',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text('请选择一个用户',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
          ],
        )),
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
    child: Container(
      padding: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var user in users)
            ListTile(
              title: Row(
                children: [
                  AdvancedAvatar(
                      name: 'Hangar',
                      size: 60,
                      image: CachedNetworkImageProvider(user.profileImage),
                      margin: EdgeInsets.only(),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                      )),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.handle,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(user.email,
                          style: TextStyle(fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pop();
                Provider.of<MainDataModel>(context, listen: false).updateCurrentUser(user);
              },
            ),
          SizedBox(height: 100),
        ]
      ),
    ),
    stickyActionBar: Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: SizedBox(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            WoltModalSheet.of(woltContext).addPages([getLoginBottomSheet(woltContext, context)]);
            WoltModalSheet.of(woltContext).showNext();
          },
          child: const Text('添加新账号'),
        ),
      ),
    ),
  );
}