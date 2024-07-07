import 'package:flutter/cupertino.dart';
import '../../datasource/hangar.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../funcs/validation.dart';



WoltModalSheetPage getReclaimPage(BuildContext modalSheetContext, HangarItem hangarItem) {

  String inputString = "";

  return WoltModalSheetPage(
    navBarHeight: 60,
      pageTitle: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('回收物品: ${hangarItem.chineseName!}', style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
            ))
          ],
        )
      ),
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
          onPressed: WoltModalSheet.of(modalSheetContext).showPrevious,
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
          onPressed: Navigator.of(modalSheetContext).pop,
        ),
      ),
    stickyActionBar: Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: 20
      ),
      child: SizedBox(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(modalSheetContext).primaryColor,
          ),
          onPressed: () {

            authenticateWithBiometrics(reason: "请验证以回收物品").then((value) {
              if (value == false) {
                return;
              } else {
                Navigator.of(modalSheetContext).pop();
              }
            });
          },
          child: const Text('确认回收', style: TextStyle(
            fontSize: 16,
          )),
        ),
      ),
    ),
    child: Container(
      height: 400,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: 20
      ),
      child: Column(
        children: [
          const Text('点击确认回收按钮后当前物品将会转化为信用点并永久消失！注意这是不可逆的！', style: TextStyle(
              fontSize: 14,
              color: Colors.grey
          )),
          const SizedBox(height: 20),
          // SfSlider(
          //   min: 0.0,
          //   max: hangarItem.idList.length,
          //   interval: 1,
          //   showTicks: true,
          //   showLabels: true,
          //   value: sliderValue,
          //   onChanged: (dynamic value) {
          //     setState(() {
          //       sliderValue = value;
          //     });
          //   },
          // )
          TextField(
            onChanged: (value) {
              inputString = value;
            },
            decoration: InputDecoration(
              labelText: '可回收数量: ${hangarItem.number}',
              hintText: '请输入回收数量',
              border: OutlineInputBorder()
            ),
          ),
        ],
      ),
    )
  );
}

