import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';
import '../user_info/user_login_bottomsheet.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'widgets/add_friend_modal.dart';
import 'widgets/friend_request_modal.dart';
import '../common/status_avatar.dart';
import 'package:badges/badges.dart' as badges;


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
                      Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: StatusAvatar(
                              avatarUrl: dataModel.currentUser!.profileImage,
                              size: 40)),
                      const Text('好友', style: TextStyle(fontSize: 24)),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          context.read<MainDataModel>().updateFriends();
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
                          WoltModalSheet.show<void>(
                            context: context,
                            pageListBuilder: (modalSheetContext) {
                              return [
                                getFriendRequestBottomSheet(context),
                              ];
                            },
                          );
                        },
                        icon: badges.Badge(
                          showBadge: (dataModel.friendRequests?.length ?? 0) > 0,
                          badgeContent: Text(
                            (dataModel.friendRequests?.length ?? 0).toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          badgeStyle: const badges.BadgeStyle(
                            badgeColor: Colors.red,
                            padding: EdgeInsets.all(4),
                          ),
                          child: const Icon(Icons.person_pin),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          WoltModalSheet.show<void>(
                            context: context,
                            pageListBuilder: (modalSheetContext) {
                              return [
                                getAddFriendBottomSheet(context),
                              ];
                            },
                          );
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