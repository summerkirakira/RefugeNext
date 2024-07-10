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


class HangarPage extends StatefulWidget {




  @override
  _HangarPageState createState() => _HangarPageState();
}

class _HangarPageState extends State<HangarPage> {


  List<HangarItem> hangarItems = [];


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

    final hangarRepo = HangarRepo();
    hangarRepo.readHangarItems().then((value) {
      setState(() => hangarItems = value);
    });

  }

  @override
  Widget build(BuildContext context) {


    return  Column(
      children: [
        HangarTopBar(),
        Expanded(
          child: ListView.builder(
            itemCount: hangarItems.length,
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              final hangarItem = hangarItems[index];
              return HangarItemWidget(
                hangarItem: hangarItem,
                onTap: onTap,
              );
            },
          ),
        ),
      ],
    );
  }
}