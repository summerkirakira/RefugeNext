import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';
import '../user_info/user_login_bottomsheet.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';


class FriendsTopBar extends StatefulWidget {
  const FriendsTopBar({super.key});

  @override
  _FriendsTopBarState createState() => _FriendsTopBarState();
}

class _FriendsTopBarState extends State<FriendsTopBar> {
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
                    icon: const Icon(Icons.person)) // Use a relevant icon for login prompt
                : Row(
                    children: [
                      AdvancedAvatar(
                          name: 'Friends',
                          size: 40,
                          image: CachedNetworkImageProvider(
                              dataModel.currentUser!.profileImage),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          )),
                      const Text('好友', style: TextStyle(fontSize: 24)),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          // TODO: Implement refresh friend status
                        },
                        icon: const Icon(Icons.refresh),
                      ),
                      IconButton(
                        onPressed: () {
                          // TODO: Implement search for friends
                        },
                        icon: const Icon(Icons.search),
                      ),
                      IconButton(
                        onPressed: () {
                          // TODO: Implement add friend functionality
                        },
                        icon: const Icon(Icons.person_add),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}