import 'package:flutter/foundation.dart';
import 'package:refuge_next/src/widgets/hangar/ccu_optimizor/ccu_optimizor_page.dart';
import 'package:refuge_next/src/widgets/hangar/upgrade_from_choose_bottomsheet.dart';

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
  // 添加两个RefreshKey
  final List<GlobalKey<RefreshIndicatorState>> _refreshKeys = [
    GlobalKey<RefreshIndicatorState>(), // 机库页面的RefreshKey
    GlobalKey<RefreshIndicatorState>(), // 回购页面的RefreshKey
  ];

  final ScrollController _hangarScrollController = ScrollController();
  VoidCallback? _buybackScrollToTop;

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
  void dispose() {
    _hangarScrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    if (_hangarScrollController.hasClients) {
      _hangarScrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleScrollToTop() {
    final activePageIndex = Provider.of<MainDataModel>(context, listen: false).activePageIndex;
    switch (activePageIndex) {
      case 0: // 机库页面
        _scrollToTop();
        break;
      case 1: // 回购页面
        _buybackScrollToTop?.call();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {

    final items = Provider.of<MainDataModel>(context).hangarItems;

    return  Column(
      children: [
        HangarTopBar(refreshKeys: _refreshKeys, onScrollToTop: _handleScrollToTop),
        HangarBuybackPage(titles: getTitles(), children: [
          Container(
            child: RefreshIndicator(
                key: _refreshKeys[0],
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
                                const Center(
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
                                      child: const Text('取消',
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
                      child: ListView.builder(
                          controller: _hangarScrollController,
                          padding: const EdgeInsets.all(0),
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: items.isEmpty ? 1 : items.length,
                          itemBuilder: (context, index) {

                            if (items.isEmpty) {
                              return const Padding(
                                padding: EdgeInsets.all(10),
                                child: Center(
                                  child: Text('下拉刷新机库数据~',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              );
                            }

                            return HangarItemWidget(
                              hangarItem: items[index],
                              onTap: onTap,
                            );
                          }
                      ),
                    ),
                  ],
                )
            ),
          ),
          BuybackPage(
            refreshKey: _refreshKeys[1],
            onScrollControllerReady: (callback) {
              _buybackScrollToTop = callback;
            },
          ),
          if (!(Provider.of<MainDataModel>(context).currentUser!.email == '934869815@qq.com'))
          ProductUpgradeWidget(),
        ]),
      ],
    );
  }
  List<String> getTitles() {
    if (!(Provider.of<MainDataModel>(context).currentUser!.email == '934869815@qq.com'))
      return ["机库", "回购", "升级"];
    else
      return ["机库", "回购"];
  }
}
