import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'hangar_search_bottomsheet.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../user_info/user_login_bottomsheet.dart';

class HangarTopBar extends StatefulWidget {
  const HangarTopBar({Key? key}) : super(key: key);

  @override
  _HangarTopBarState createState() => _HangarTopBarState();
}

class _HangarTopBarState extends State<HangarTopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 60,
          child: Row(
            children: [
              const AdvancedAvatar(
                name: 'Hangar',
                size: 40,
                image: CachedNetworkImageProvider("https://robertsspaceindustries.com/media/biprvy081u9lbr/heap_infobox/600px.png"),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                )
              ),
              const Text('我的机库', style: TextStyle(fontSize: 24)),
              Spacer(),
              IconButton(onPressed: () {
                WoltModalSheet.show<void>(
                    context: context,
                    pageListBuilder: (modalSheetContext) {
                      return [
                        // getSearchBottomSheet(context)
                        getLoginBottomSheet(modalSheetContext),
                        getEmailInputBottomSheet(modalSheetContext)
                      ];
                    }
                );
              }, icon: const Icon(Icons.search)),
            ],
          ),
        )
      );
    }
  }