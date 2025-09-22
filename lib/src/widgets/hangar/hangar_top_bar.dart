import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_export_bottomsheet.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_log/hangar_log_bottomsheet.dart';
import '../../funcs/hangar/excel_utils.dart';
import 'hangar_search_bottomsheet.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../user_info/user_login_bottomsheet.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';

class HangarTopBar extends StatefulWidget {
  final List<GlobalKey<RefreshIndicatorState>>? refreshKeys;
  final VoidCallback? onScrollToTop;

  const HangarTopBar({
    Key? key,
    this.refreshKeys,
    this.onScrollToTop,
  }) : super(key: key);

  @override
  _HangarTopBarState createState() => _HangarTopBarState();
}

class _HangarTopBarState extends State<HangarTopBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainDataModel>(
      builder: (context, dataModel, child) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 0),
            height: 60,
            child: dataModel.currentUser == null
                ? IconButton(
                    onPressed: () {
                      WoltModalSheet.show<void>(
                          context: context,
                          pageListBuilder: (modalSheetContext) {
                            return [
                              getLoginBottomSheet(modalSheetContext, context),
                            ];
                          });
                    },
                    icon: const Icon(Icons.search))
                : Row(
                    children: [
                      AdvancedAvatar(
                          name: 'Hangar',
                          size: 40,
                          image: CachedNetworkImageProvider(
                              dataModel.currentUser!.profileImage),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          )),
                      GestureDetector(
                        onDoubleTap: () {
                          widget.onScrollToTop?.call();
                        },
                        child: const Text('我的机库', style: TextStyle(fontSize: 24)),
                      ),
                      const Spacer(),
                      if (widget.refreshKeys != null && dataModel.showRefreshButton)
                        IconButton(
                          onPressed: () {
                            switch (dataModel.activePageIndex) {
                              case 0: // 机库
                                widget.refreshKeys?[0].currentState?.show();
                                break;
                              case 1: // 回购
                                widget.refreshKeys?[1].currentState?.show();
                                break;
                              default:
                                break;
                            }
                          },
                          icon: const Icon(Icons.refresh),
                        ),
                      IconButton(
                        onPressed: () async {
                          WoltModalSheet.show<void>(
                              context: context,
                              pageListBuilder: (modalSheetContext) {
                                return [
                                  getHangarExportPage(
                                      modalSheetContext, context)
                                ];
                              });
                        },
                        icon: const Icon(Icons.file_download_outlined),
                      ),
                      IconButton(onPressed: () {
                        WoltModalSheet.show<void>(
                            context: context,
                            pageListBuilder: (modalSheetContext) {
                              return [
                                getHangarLogBottomSheet(context, null)
                              ];
                            });
                      }, icon: const Icon(Icons.description_outlined)),
                      IconButton(
                          onPressed: () {
                            WoltModalSheet.show<void>(
                                context: context,
                                pageListBuilder: (modalSheetContext) {
                                  return [
                                    getSearchBottomSheet(context)
                                  ];
                                });
                          },
                          icon: const Icon(Icons.search)),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
