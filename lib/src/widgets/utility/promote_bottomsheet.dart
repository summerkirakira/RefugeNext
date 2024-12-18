// modal_sheet_util.dart
import 'package:flutter/material.dart';
import 'package:refuge_next/src/datasource/models/cirno/promote_property.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/network/cirno/cirno_api.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../network/graphql/promote.dart';

class UseCaseOption {
  final String title;
  bool isSelected;

  UseCaseOption({
    required this.title,
    this.isSelected = false,
  });
}

class ModalSheetUtil {
  static late List<UseCaseOption> _options;
  static late List<PromotionCode> _promotions;
  // [
  //   UseCaseOption(title: 'Page with forced max height'),
  //   UseCaseOption(title: 'Page with hero image'),
  //   UseCaseOption(title: 'Page with lazy loading list'),
  //   UseCaseOption(title: 'Page with auto-focus text field'),
  //   UseCaseOption(title: 'All the pages in one flow'),
  // ];
  
  

  static Future<List<String>?> showUseCaseSelector(BuildContext context) async {
    
    _promotions = await CirnoApiClient().getAllPromotionCodes();
    _options = _promotions.map((promotion) => UseCaseOption(title: promotion.chineseTitle)).toList();
    
    return await WoltModalSheet.show<List<String>?>(
      context: context,
      pageListBuilder: (context) {
        return [
          WoltModalSheetPage(
            navBarHeight: 50,
            pageTitle: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('礼物兑换',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    Text('请选择要领取的奖励',
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

            child: StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 24),
                      ..._buildCheckboxList(setState),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: _options.any((option) => option.isSelected)
                            ? () async {
                          final selectedOptions = _options
                              .where((option) => option.isSelected)
                              .map((option) => option.title)
                              .toList();
                          
                          for (var i = 0; i < _options.length; i++) {
                            if (_options[i].isSelected) {
                              final response = await PromoteReq(code: _promotions[i].code, id: _promotions[i].promo).execute();

                              if (response!.data.promotionalCode.validate.isValid) {
                                showToast(message: "奖励: ${_promotions[i].chineseTitle}领取成功~");
                                continue;
                              }
                              showToast(message: response.data.promotionalCode.validate.error);
                            }
                          }
                          Navigator.pop(context, selectedOptions);
                        }
                            : null,
                        child: const Text("点击领取!"),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
            ),
          ),
        ];
      },
    );
  }

  static List<Widget> _buildCheckboxList(StateSetter setState) {
    return List.generate(
      _options.length,
          (index) => Column(
        children: [
          CheckboxListTile(
            title: Text(_options[index].title),
            value: _options[index].isSelected,
            onChanged: (bool? value) {
              setState(() {
                _options[index].isSelected = value ?? false;
              });
            },
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
          ),
          if (index < _options.length - 1) const Divider(),
        ],
      ),
    );
  }
}