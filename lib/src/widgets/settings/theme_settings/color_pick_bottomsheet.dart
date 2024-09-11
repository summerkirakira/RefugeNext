import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter/material.dart';
import '../../../datasource/data_model.dart';
import './theme_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';



WoltModalSheetPage getColorPickerBottomSheet(BuildContext context, Color currentColor, Function(FlexScheme) onColorChanged) {
  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('主题选择',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
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
    child: ThemePicker(
      onThemeChanged: (scheme) {
        onColorChanged(scheme);
      },
      currentScheme: FlexScheme.material,
    ),
  );
}