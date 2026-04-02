import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../user_info/user_login_bottomsheet.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';
import '../common/status_avatar.dart';

class UtilityTopBar extends StatefulWidget {
  const UtilityTopBar({Key? key}) : super(key: key);

  @override
  _ShopTopBarState createState() => _ShopTopBarState();
}

class _ShopTopBarState extends State<UtilityTopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          // color: Colors.black,
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 0),
          height: 60,
          child: Provider.of<MainDataModel>(context).currentUser == null
              ? IconButton(
              onPressed: () {
                WoltModalSheet.show<void>(
                    context: context,
                    pageListBuilder: (modalSheetContext) {
                      return [
                        // getSearchBottomSheet(context)
                        getLoginBottomSheet(modalSheetContext, context),
                        // getCaptchaInputBottomSheet(modalSheetContext),
                        // getEmailInputBottomSheet(modalSheetContext)
                      ];
                    });
              },
              icon: const Icon(Icons.search))
              : Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: StatusAvatar(
                      avatarUrl: Provider.of<MainDataModel>(context)
                          .currentUser!
                          .profileImage,
                      size: 40)),
              const Text('实用工具', style: TextStyle(fontSize: 24)),
            ],
          ),
        ));
  }
}
