import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import '../../datasource/data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../user_info/user_switch_bottomsheet.dart';
import 'package:refuge_next/src/network/parsers/user_parser.dart' show parseNewUser;
import 'package:refuge_next/src/network/api_service.dart';
import 'package:refuge_next/src/widgets/settings/settings_page.dart';
import 'package:refuge_next/src/widgets/user_info/referral_list_modal.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        Provider.of<MainDataModel>(context).currentUser!.handle,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text(Provider.of<MainDataModel>(context).currentUser!.name,
                        style: const TextStyle(fontSize: 18)),

                    GestureDetector(
                      onTap: () {

                        Provider.of<MainDataModel>(context, listen: false).userRepo.readUsers().then((users) {
                          WoltModalSheet.show<void>(
                            context: context,
                            pageListBuilder: (modalSheetContext) {
                              return [
                                getUserSwitchBottomSheet(modalSheetContext, context, users),
                              ];
                            });
                        });
                      },
                      child: Row(
                          children: [
                            Icon(Icons.edit_outlined, size: 15, color: Colors.grey.withOpacity(0.7),),
                            Text(
                                "切换/退出账号",
                                style: TextStyle(fontSize: 15, color: Colors.grey.withOpacity(0.7))),
                          ]
                      ),
                    )

                  ],
                ),
                Spacer(),
                Stack(
                  children: [
                    AdvancedAvatar(
                        name: 'Hangar',
                        size: 80,
                        image: CachedNetworkImageProvider(
                            Provider.of<MainDataModel>(context)
                                .currentUser!
                                .profileImage),
                        margin: const EdgeInsets.only(),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ]
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserSimpleInfo extends StatefulWidget {
  const UserSimpleInfo({Key? key}) : super(key: key);

  @override
  _UserSimpleInfoState createState() => _UserSimpleInfoState();
}

String _formatPrice(int number) {
  String numberString = (number ~/ 100).toString();
  return numberString;
}

String _formatRec(int number) {
  String numberString = number.toString();
  return numberString;
}

String _formatTime(DateTime time) {
  final formatter = DateFormat('yyyy-MM-dd', 'zh_CN');
  return formatter.format(time);
}

class _UserSimpleInfoState extends State<UserSimpleInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
          child: Container(
            height: 85,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          _formatPrice(Provider.of<MainDataModel>(context)
                              .currentUser!
                              .totalSpent),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text('消费额',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.withOpacity(0.7))),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          _formatPrice(Provider.of<MainDataModel>(context)
                              .currentUser!
                              .hangarValue),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text('机库价值',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.withOpacity(0.7))),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          _formatPrice(Provider.of<MainDataModel>(context)
                              .currentUser!
                              .usd),
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text('信用点',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.withOpacity(0.7))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class DetailInfoItem extends StatelessWidget {
  final String title;
  final String value;
  final Widget leading;
  final VoidCallback? onTap;

  const DetailInfoItem(
      {Key? key,
      required this.leading,
      required this.title,
      required this.value,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        children: [
          leading,
          SizedBox(width: 10),
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Spacer(),
          Text(value, style: TextStyle(fontSize: 16)),
        ],
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: content,
      );
    }

    return content;
  }
}

class OrganizationInfo extends StatefulWidget {
  const OrganizationInfo({Key? key}) : super(key: key);

  @override
  _OrganizationInfoState createState() => _OrganizationInfoState();
}

class _OrganizationInfoState extends State<OrganizationInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Container(
              child: Row(children: [
            AdvancedAvatar(
                name: 'Hangar',
                size: 85,
                image: CachedNetworkImageProvider(
                    Provider.of<MainDataModel>(context)
                        .currentUser!
                        .organizationImage!),
                margin: EdgeInsets.only(),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                )),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    Provider.of<MainDataModel>(context)
                        .currentUser!
                        .organizationName!,
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Row(
                  children: List.generate(
                    5,
                    (index) => Provider.of<MainDataModel>(context)
                                .currentUser!
                                .orgLevel >=
                            5 - index
                        ? Icon(Icons.star)
                        : Icon(Icons.star_outline),
                  ),
                ),
                SizedBox(height: 5),
                Text(Provider.of<MainDataModel>(context).currentUser!.orgRank!,
                    style: TextStyle(fontSize: 14)),
              ],
            ),
          ])))
    ]);
  }
}

class UserDetailInfo extends StatefulWidget {
  const UserDetailInfo({Key? key}) : super(key: key);

  @override
  _UserDetailInfoState createState() => _UserDetailInfoState();
}

class _UserDetailInfoState extends State<UserDetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              if (Provider.of<MainDataModel>(context)
                      .currentUser!
                      .organization !=
                  null)
                OrganizationInfo(),
              DetailInfoItem(
                leading: Icon(Icons.schedule_outlined),
                title: '注册时间',
                value: _formatTime(Provider.of<MainDataModel>(context)
                    .currentUser!
                    .registerTime),
              ),
              SizedBox(height: 10),
              DetailInfoItem(
                leading: Icon(Icons.donut_large_outlined, color: Theme.of(context).iconTheme.color),
                title: 'UEC',
                value: _formatRec(
                    Provider.of<MainDataModel>(context).currentUser!.uec),
              ),
              SizedBox(height: 10),
              DetailInfoItem(
                leading: Icon(Icons.my_location_outlined, color: Theme.of(context).iconTheme.color),
                title: 'REC',
                value: _formatRec(
                    Provider.of<MainDataModel>(context).currentUser!.rec),
              ),
              SizedBox(height: 10),
              DetailInfoItem(
                leading: Icon(Icons.paid_outlined, color: Theme.of(context).iconTheme.color),
                title: '当前机库价值',
                value: _formatPrice(
                    Provider.of<MainDataModel>(context).currentUser!.currentHangarValue),
              ),
              SizedBox(height: 10),
              if (Provider.of<MainDataModel>(context)
                  .currentUser!
                  .hasGamePackage) ...[
                DetailInfoItem(
                  leading: Icon(Icons.check_circle_outline, color: Theme.of(context).iconTheme.color),
                  title: '拥有游戏资格',
                  value: '是',
                ),
                SizedBox(height: 10),
              ] else ...[
                DetailInfoItem(
                  leading: Icon(Icons.cancel_outlined, color: Theme.of(context).iconTheme.color),
                  title: '拥有游戏资格',
                  value: '否',
                ),
                SizedBox(height: 10),
              ],
              DetailInfoItem(
                leading: Icon(Icons.groups, color: Theme.of(context).iconTheme.color),
                title: '总邀请人数',
                value: Provider.of<MainDataModel>(context)
                    .currentUser!
                    .referralCount
                    .toString(),
              ),
              SizedBox(height: 10),
              DetailInfoItem(
                leading: Icon(Icons.group_outlined, color: Theme.of(context).iconTheme.color),
                title: '新版邀请人数',
                value: Provider.of<MainDataModel>(context)
                    .currentUser!
                    .newReferralsCount
                    .toString(),
                onTap: () {
                  WoltModalSheet.show<void>(
                    context: context,
                    pageListBuilder: (modalSheetContext) {
                      return [
                        getReferralListPage(modalSheetContext, context),
                      ];
                    },
                  );
                },
              ),
              SizedBox(height: 10),
              DetailInfoItem(
                leading: Icon(Icons.person_add_disabled_outlined, color: Theme.of(context).iconTheme.color),
                title: '未购买资格包人数',
                value: Provider.of<MainDataModel>(context)
                    .currentUser!
                    .referralProspectCount
                    .toString(),
              ),
              SizedBox(height: 10),
              DetailInfoItem(
                leading: Icon(Icons.card_giftcard_outlined, color: Theme.of(context).iconTheme.color),
                title: '邀请码',
                value: Provider.of<MainDataModel>(context)
                    .currentUser!
                    .referralCode,
                onTap: () {
                  Clipboard.setData(ClipboardData(text: Provider.of<MainDataModel>(context, listen: false)
                      .currentUser!
                      .referralCode));
                  showToast(message: "邀请码已复制");
                },
              ),
              if (Provider.of<MainDataModel>(context)
                  .currentUser!
                  .referrerReferralCode
                  .isNotEmpty) ...[
                SizedBox(height: 10),
                DetailInfoItem(
                  leading: Icon(Icons.how_to_reg_outlined, color: Theme.of(context).iconTheme.color),
                  title: '推荐人邀请码',
                  value: Provider.of<MainDataModel>(context)
                      .currentUser!
                      .referrerReferralCode,
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: Provider.of<MainDataModel>(context, listen: false)
                        .currentUser!
                        .referrerReferralCode));
                    showToast(message: "推荐人邀请码已复制");
                  },
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}


class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Padding(
            padding: const EdgeInsets.only(left: 30, top: 0, bottom: 0),
            child: Row(
              children: [
                Icon(Icons.settings_outlined, color: Theme.of(context).iconTheme.color,),
                SizedBox(width: 10),
                Text('设置',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SettingsPage()));
          },
        )
      ],
    );
  }
}

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainDataModel>(
      builder: (context, model, child) {
        return model.currentUser == null
            ? const Center(child: Text('No user data'))
            : RefreshIndicator(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TopBar(),
                      UserSimpleInfo(),
                      UserDetailInfo(),
                      Divider(),
                      if (!(model.currentUser!.email == "934869815@qq.com"))
                        SettingsWidget()
                    ],
                  ),
                ),
              );
            },
          ),
          onRefresh: () async {
            final currentUserHangarValue = model.currentUser!.hangarValue;
            final currentValue = model.currentUser!.currentHangarValue;
            final newUser = await parseNewUser(
                model.currentUser!.email,
                model.currentUser!.password,
                RsiApiClient().rsiDevice,
                model.currentUser!.rsiToken
            );
            if (newUser == null) {
              showToast(message: "用户信息刷新失败");
              return;
            }
            model.updateCurrentUser(newUser.copyWith(
                hangarValue: currentUserHangarValue,
                currentHangarValue: currentValue
            ));
          },
        );
      },
    );
  }
}
