import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../user_info/user_login_bottomsheet.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';
import 'upgrade_shop/upgrade_ship_widget.dart';

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
              const Text('商店', style: TextStyle(fontSize: 24)),
              const Spacer(),
              IconButton(onPressed: () async { await onPressUpgrade(context); }, icon: Icon(Icons.keyboard_double_arrow_up_outlined)),
              IconButton(onPressed: () async { await onPressCart(context); }, icon: Icon(Icons.shopping_cart_outlined)),
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
