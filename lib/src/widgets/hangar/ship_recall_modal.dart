import 'package:flutter/cupertino.dart';
import '../../datasource/models/hangar.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter/material.dart';
import '../../funcs/validation.dart';
import '../../funcs/toast.dart';
import '../../network/api_service.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';



WoltModalSheetPage getRecallPage(BuildContext modalSheetContext, BuildContext mainContext, HangarItem hangarItem) {


  return WoltModalSheetPage(
      navBarHeight: 60,
      pageTitle: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('撤回礼物: ${hangarItem.chineseName!}', style: const TextStyle(
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
          onPressed: () => WoltModalSheet.of(modalSheetContext).showAtIndex(0),
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
            onPressed: () async {

              final result = await authenticateWithBiometrics(reason: "请验证以撤回物品");
              if (result == false) {
                showToast(message: "验证失败");
                return;
              }

              final password = Provider.of<MainDataModel>(mainContext, listen: false).currentUser!.password;

              RsiApiClient apiClient = RsiApiClient();

              const number = 1;

              for (int i = 0; i < number; i++) {
                final result = await apiClient.recallGift(pledge: hangarItem.idList[i].toString());
                if (result.success == 1) {
                  continue;
                }
                showToast(message: result.msg);
                return;
              }

              showToast(message: "撤回礼物成功");

              Provider.of<MainDataModel>(mainContext, listen: false).updateHangarItems();

              Navigator.of(modalSheetContext).pop();

            },
            child: const Text('确认撤回礼物', style: TextStyle(
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
        child: const Column(
          children: [
            Text('点击确认撤回礼物按钮后原礼物链接将会失效！注意这是不可逆的！', style: TextStyle(
                fontSize: 14,
                color: Colors.grey
            )),
            SizedBox(height: 20),
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
          ],
        ),
      )
  );
}

