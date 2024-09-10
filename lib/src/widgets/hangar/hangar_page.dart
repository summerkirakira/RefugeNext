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
import '../hangar_buyback/hangar_buyback_page.dart';
import '../buyback/buyback_page.dart';
import './ship_gift_modal.dart';
import './ship_recall_modal.dart';


class HangarPage extends StatefulWidget {
  @override
  _HangarPageState createState() => _HangarPageState();
}

class _HangarPageState extends State<HangarPage> {


  void onTap(HangarItem hangarItem, BuildContext context){


    WoltModalSheet.show<void>(
      context: context,
      pageListBuilder: (modalSheetContext) {
        return [
          getHangarItemDetailSheet(modalSheetContext, hangarItem),
          getReclaimPage(modalSheetContext, context,  hangarItem),
          getGiftPage(modalSheetContext, context,  hangarItem),
          getRecallPage(modalSheetContext, context, hangarItem)
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
    // Provider.of<MainDataModel>(context, listen: false).readHangarItems();
  }

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        HangarTopBar(),
        HangarBuybackPage(children: [
          Container(
            child: RefreshIndicator(
                onRefresh: () async {
                  await Provider.of<MainDataModel>(context, listen: false).updateHangarItems();
                },
                child: Column(
                  children: [
                    if (Provider.of<MainDataModel>(context).isSearched)
                      SizedBox(
                        height: 25,
                        width: double.infinity,
                        child: Container(
                          width: double.infinity,
                          color: Colors.red,
                          child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    '机库筛选中',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: 5,
                                    top: 3,
                                    child: GestureDetector(
                                      onTap: () {
                                        Provider.of<MainDataModel>(context, listen: false).clearSearch();
                                      },
                                      child: Text('取消',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    )
                                ),
                              ]
                          ),
                        ),
                      ),
                    Expanded(
                      child:ListView.builder(
                          padding: const EdgeInsets.all(0),
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: Provider.of<MainDataModel>(context).hangarItems.length,
                          itemBuilder: (context, index) {
                            return HangarItemWidget(
                              hangarItem: Provider.of<MainDataModel>(context).hangarItems[index],
                              onTap: onTap,
                            );
                          }
                      ),
                    ),
                  ],
                )
            ),
          ),
          BuybackPage(),
        ], titles: ["机库", "回购"]),
      ],
    );
  }
}
