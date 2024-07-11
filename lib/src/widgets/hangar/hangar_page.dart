import 'package:flutter/foundation.dart';

import '../../datasource/models/hangar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../repo/hangar.dart';
import 'hangar_item_widget.dart';
import 'hangar_top_bar.dart';

import 'hangar_item_detail_widget.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'ship_reclaim_modal.dart';
import '../../datasource/data_model.dart';


class HangarPage extends StatefulWidget {




  @override
  _HangarPageState createState() => _HangarPageState();
}

class _HangarPageState extends State<HangarPage> {


  void onTap(HangarItem hangarItem) {


    WoltModalSheet.show<void>(
      context: context,
      pageListBuilder: (modalSheetContext) {
        return [
          getHangarItemDetailSheet(modalSheetContext, hangarItem),
          getReclaimPage(modalSheetContext, hangarItem)
        ];
      }
    );


    if (kDebugMode) {
      print('HangarItem tapped: ${hangarItem.name}');
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<MainDataModel>(context, listen: false).readHangarItems();
  }

  @override
  Widget build(BuildContext context) {


    return  Column(
      children: [
        HangarTopBar(),
        Expanded(
          child: Provider.of<MainDataModel>(context).hangarItems.isEmpty
              ? const Expanded(child: Text("空空如也~", style: TextStyle(fontSize: 30), textAlign: TextAlign.center))
              : RefreshIndicator(
              onRefresh: () async {

              },
              child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: Provider.of<MainDataModel>(context).hangarItems.length,
                  itemBuilder: (context, index) {
                    return HangarItemWidget(
                      hangarItem: Provider.of<MainDataModel>(context).hangarItems[index],
                      onTap: onTap,
                    );
                  }
              )),
        ),
      ],
    );
  }
}
