import 'package:flutter/cupertino.dart';
import '../../datasource/models/hangar.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter/material.dart';
import '../../funcs/validation.dart';
import '../../funcs/toast.dart';
import '../../network/api_service.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';



WoltModalSheetPage getGiftPage(BuildContext modalSheetContext, BuildContext mainContext, HangarItem hangarItem) {

  String inputString = "";
  String emailString = "";
  String targetName = "避难所用户";

  return WoltModalSheetPage(
      navBarHeight: 60,
      pageTitle: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('礼物物品: ${hangarItem.chineseName!}', style: const TextStyle(
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
              int number = int.tryParse(inputString) ?? 0;
              if (number > hangarItem.number) {
                showToast(message: "礼物数量不能大于物品数量");
                return;
              }
              if (number <= 0) {
                showToast(message: "请输入正确的礼物数量");
                return;
              }

              final result = await authenticateWithBiometrics(reason: "请验证以礼物物品");
              if (result == false) {
                showToast(message: "验证失败");
                return;
              }

              final password = Provider.of<MainDataModel>(mainContext, listen: false).currentUser!.password;

              RsiApiClient apiClient = RsiApiClient();

              for (int i = 0; i < number; i++) {
                final result = await apiClient.giftItem(pledge: hangarItem.idList[i].toString(), password: password, email: emailString, name: targetName);
                if (result.success == 1) {
                  continue;
                }
                showToast(message: result.msg);
                return;
              }

              showToast(message: "礼物成功");

              Provider.of<MainDataModel>(mainContext, listen: false).updateHangarItems();
              Navigator.of(modalSheetContext).pop();

            },
            child: const Text('确认礼物', style: TextStyle(
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
            const Text('点击确认礼物按钮后当前物品将会被发送到目标邮箱！若对方接收后将无法撤回！', style: TextStyle(
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
                targetName = value;
              },
              decoration: const InputDecoration(
                  labelText: '目标称呼', 
                  hintText: '避难所用户',
                  border: OutlineInputBorder()
              ),
              controller: TextEditingController(text: '避难所用户'),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                emailString = value;
              },
              decoration: const InputDecoration(
                  labelText: '目标邮箱',
                  hintText: '请输入目标邮箱',
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                inputString = value;
              },
              decoration: InputDecoration(
                  labelText: '可礼物数量: ${hangarItem.number}',
                  hintText: '请输入礼物数量',
                  border: OutlineInputBorder()
              ),
            ),
          ],
        ),
      )
  );
}

