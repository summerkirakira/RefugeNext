import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/widgets/shop/upgrade_shop/upgrade_checkout_bottomsheet.dart';
import 'package:refuge_next/src/widgets/webview/rsi_webpage.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../funcs/validation.dart';
import '../user_info/user_login_bottomsheet.dart';
import 'shop_search_bottomsheet.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';
import 'upgrade_shop/upgrade_ship_widget.dart';
import 'package:badges/badges.dart' as badges;
import '../common/status_avatar.dart';

class ShopTopBar extends StatefulWidget {
  final List<GlobalKey<RefreshIndicatorState>>? refreshKeys;
  
  const ShopTopBar({
    Key? key,
    this.refreshKeys,
  }) : super(key: key);

  @override
  _ShopTopBarState createState() => _ShopTopBarState();
}

class _ShopTopBarState extends State<ShopTopBar> {
  @override
  Widget build(BuildContext context) {
    final isDevMode = Provider.of<MainDataModel>(context, listen: false).isDevMode;
    return SafeArea(
        bottom: false,
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
              const Text('商店', style: TextStyle(fontSize: 24)),
              const Spacer(),
              if (isDevMode)
              IconButton(
                  onPressed: () async {
                    final result = await authenticateWithBiometrics(reason: "请验证以重放购买操作");
                    if (result == false) {
                      showToast(message: "验证失败");
                      return;
                    }
                    if (lastBuyProcess == null) {
                      showToast(message: "没有上一次购买记录");
                    } else {
                      await lastBuyProcess!();
                      openRsiCartWebview(context: context);
                    }
                  },
                  icon: const Icon(Icons.replay_5),
                  tooltip: "重放购买操作",
                ),
                SizedBox(width: 5,),
              if (widget.refreshKeys != null && Provider.of<MainDataModel>(context).showRefreshButton)
                IconButton(
                  onPressed: () {
                    final activePageIndex = context.read<MainDataModel>().activePageIndex;
                    if (activePageIndex >= 100 && activePageIndex < 110) {
                      final index = activePageIndex - 100;
                      widget.refreshKeys?[index].currentState?.show();
                    }
                  },
                  icon: const Icon(Icons.refresh),
                ),
              GestureDetector(
                onTap: () async {
                  await onPressUpgrade(context);
                },
                child: badges.Badge(
                  showBadge: Provider.of<MainDataModel>(context).upgradeWbNumber > 0,
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Colors.orange,
                  ),
                  badgeContent: Text(Provider.of<MainDataModel>(context).upgradeWbNumber.toString(), style: TextStyle(color: Colors.white),),
                  child: Icon(Icons.keyboard_double_arrow_up_outlined, size: 30,),
                ),
              ),
              SizedBox(width: 5,),
              IconButton(onPressed: () async { await onPressCart(context); }, icon: Icon(Icons.shopping_cart_outlined)),
              IconButton(
                  onPressed: () {
                    WoltModalSheet.show<void>(
                        context: context,
                        pageListBuilder: (modalSheetContext) {
                          return [
                            getShopSearchBottomSheet(context)
                          ];
                        });
                  },
                  icon: const Icon(Icons.search)),
            ],
          ),
        ));
  }
}
