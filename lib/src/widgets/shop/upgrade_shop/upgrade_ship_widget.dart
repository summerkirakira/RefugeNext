import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../datasource/data_model.dart';
import 'package:provider/provider.dart';
import '../../../datasource/models/shop/upgrade_ship_info.dart';
import './ship_select_bottomsheet.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import './upgrade_checkout_bottomsheet.dart';
import './upgrade_select_sku.dart';
import '../cart/cart.dart';
import 'package:refuge_next/src/network/api_service.dart';


Future<void> onPressUpgrade(BuildContext context) async {
  context.loaderOverlay.show();
  try {
    final rsiApiClient = RsiApiClient();
    await rsiApiClient.setAuthToken();
    await rsiApiClient.setContextToken();
    await Provider.of<MainDataModel>(context, listen: false).filterShipUpgrade(null, null);
  } catch (e) {
    showToast(message: "获取升级信息失败");
    context.loaderOverlay.hide();
    return;
  }

  context.loaderOverlay.hide();

  WoltModalSheet.show<void>(
      context: context,
      pageListBuilder: (modalSheetContext) {
        return [
          getShipSelectBottomSheet(modalSheetContext, Provider.of<MainDataModel>(context).upgradeToShip, (UpgradeShipInfo ship) async {

            if (ship.skus == null) {
              showToast(message: "未找到可升级的版本~");
              Navigator.of(modalSheetContext).pop();
              return;
            }

            if (ship.skus!.length == 1) {
              context.loaderOverlay.show();
              await Provider.of<MainDataModel>(context, listen: false).filterShipUpgrade(null, ship.skus![0].id);
              context.loaderOverlay.hide();
              final fromShips = Provider.of<MainDataModel>(context, listen: false).upgradeFromShip;

              if(fromShips.isEmpty){
                showToast(message: "未找到可升级舰船");
                Navigator.of(modalSheetContext).pop();
                return;
              }
              Provider.of<MainDataModel>(context, listen: false).setToSku(ship.skus![0]);

              WoltModalSheet.of(modalSheetContext).addPage(
                  getShipSelectBottomSheet(modalSheetContext, fromShips, (UpgradeShipInfo fromShip) async {

                    Provider.of<MainDataModel>(context, listen: false).setFromShip(fromShip);
                    WoltModalSheet.of(modalSheetContext).showNext();

                    final page = getUpgradeCheckoutBottomSheet(modalSheetContext, fromShip, ship, ship.skus![0], context);
                    WoltModalSheet.of(modalSheetContext).addPage(page);
                    WoltModalSheet.of(modalSheetContext).showNext();


                  }, true)
              );
              Provider.of<MainDataModel>(context, listen: false).setFromShip(ship);
              WoltModalSheet.of(modalSheetContext).showNext();
            } else {
              final skuSelectPage = getSelectSkuBottomSheet(modalSheetContext, ship, (Skus sku) async {
                context.loaderOverlay.show();
                Provider.of<MainDataModel>(context, listen: false).filterShipUpgrade(null, sku.id);
                context.loaderOverlay.hide();
                Provider.of<MainDataModel>(context, listen: false).setToSku(sku);


                context.loaderOverlay.show();
                await Provider.of<MainDataModel>(context, listen: false).filterShipUpgrade(null, sku.id);
                context.loaderOverlay.hide();
                final fromShips = Provider.of<MainDataModel>(context, listen: false).upgradeFromShip;

                if(fromShips.isEmpty){
                  showToast(message: "未找到可升级舰船");
                  Navigator.of(modalSheetContext).pop();
                  return;
                }
                Provider.of<MainDataModel>(context, listen: false).setToSku(sku);

                WoltModalSheet.of(modalSheetContext).addPage(
                    getShipSelectBottomSheet(modalSheetContext, fromShips, (UpgradeShipInfo fromShip) async {

                      Provider.of<MainDataModel>(context, listen: false).setFromShip(fromShip);
                      WoltModalSheet.of(modalSheetContext).showNext();

                      final page = getUpgradeCheckoutBottomSheet(modalSheetContext, fromShip, ship, sku, context);
                      WoltModalSheet.of(modalSheetContext).addPage(page);
                      WoltModalSheet.of(modalSheetContext).showNext();


                    }, true)
                );
                Provider.of<MainDataModel>(context, listen: false).setFromShip(ship);
                WoltModalSheet.of(modalSheetContext).showNext();

              });
              WoltModalSheet.of(modalSheetContext).addPage(skuSelectPage);
              WoltModalSheet.of(modalSheetContext).showNext();
            }

          }, false)
        ];
      }
  );
}

Future<void> onPressCart(BuildContext context) async {
  await showCartBottomSheet(context);
}