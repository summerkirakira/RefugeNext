import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../user_info/user_login_bottomsheet.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';

class ShopTopBar extends StatefulWidget {
  const ShopTopBar({Key? key}) : super(key: key);

  @override
  _ShopTopBarState createState() => _ShopTopBarState();
}

class _ShopTopBarState extends State<ShopTopBar> {
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
              AdvancedAvatar(
                  name: 'Shop',
                  size: 40,
                  image: CachedNetworkImageProvider(
                      Provider.of<MainDataModel>(context)
                          .currentUser!
                          .profileImage),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  )),
              const Text('舰船商店', style: TextStyle(fontSize: 24)),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    WoltModalSheet.show<void>(
                        context: context,
                        pageListBuilder: (modalSheetContext) {
                          return [

                          ];
                        });
                  },
                  icon: const Icon(Icons.search)),
            ],
          ),
        ));
  }
}
