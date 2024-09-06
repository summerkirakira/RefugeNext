import 'package:flutter/material.dart';
import '../../../datasource/data_model.dart';
import 'package:provider/provider.dart';
import '../../../datasource/models/shop/upgrade_ship_info.dart';
import './ship_select_bottomsheet.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import './upgrade_checkout_bottomsheet.dart';


class UpgradeShipWidget extends StatefulWidget {

  @override
  _UpgradeShipWidgetState createState() => _UpgradeShipWidgetState();
}

class _UpgradeShipWidgetState extends State<UpgradeShipWidget> {


  Future<void> _onPress() async {
    await Provider.of<MainDataModel>(context, listen: false).filterShipUpgrade(null, null);

    WoltModalSheet.show<void>(
        context: context,
        pageListBuilder: (modalSheetContext) {
          return [
            getShipSelectBottomSheet(modalSheetContext, Provider.of<MainDataModel>(context).upgradeToShip, (UpgradeShipInfo ship) async {
              if (ship.skus != null && ship.skus!.length == 1) {
                await Provider.of<MainDataModel>(context, listen: false).filterShipUpgrade(null, ship.skus![0].id);
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

                      final page = getUpgradeCheckoutBottomSheet(modalSheetContext, fromShip, ship, ship.skus![0]);
                      WoltModalSheet.of(modalSheetContext).addPage(page);
                      WoltModalSheet.of(modalSheetContext).showNext();


                    }, false)
                );
                Provider.of<MainDataModel>(context, listen: false).setFromShip(ship);
                WoltModalSheet.of(modalSheetContext).showNext();
              }

              // switch to next page
              // WoltModalSheet.of(modalSheetContext).showAtIndex(1);

            }, false),
            // getShipSelectBottomSheet(modalSheetContext, Provider.of<MainDataModel>(context).upgradeFromShip, (UpgradeShipInfo ship) async {
            //
            // }, true)
          ];
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _onPress,
          child: const Text('Upgrade Ship'),
        ),
      ],
    );
  }
}