import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:refuge_next/src/funcs/cirno_auth.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/network/cirno/cirno_api.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import './theme_settings/color_pick_bottomsheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';


Color cardBackgroundColor(BuildContext context) {

  final isVip = Provider.of<MainDataModel>(context).isVIP;

  if (!isVip) {
    return Colors.grey[400]!;
  }

  final isDarkMode = Provider.of<MainDataModel>(context).isDarkMode;
  if (isDarkMode) {
    return Theme.of(context).primaryColorDark;
  } else {
    return Theme.of(context).primaryColor;
  }
}

int getRemainingDays(int remainingTime) {

  final days = remainingTime ~/ 86400;

  // 将差异转换为天数并返回
  return days;
}



class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}


class _SettingsPageState extends State<SettingsPage> {

  String version = "loading...";
  DateTime? _lastTapTime;
  int _tapCount = 0;

  void getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      final buildNumber = packageInfo.buildNumber;
      version = "${packageInfo.version}+$buildNumber";
    });
  }

  String getUserNameString(BuildContext context) {
    if (Provider.of<MainDataModel>(context).currentUser == null) {
      return "未登录";
    }
    final handle = Provider.of<MainDataModel>(context).currentUser!.handle;
    final nickName = Provider.of<MainDataModel>(context).currentUser!.name;
    return "$handle\n$nickName";
  }


  Widget getUserCard(BuildContext context) {

    final userNameString = getUserNameString(context);

    final imageUrl = Provider.of<MainDataModel>(context).currentUser?.profileImage ??
        "https://cdn.robertsspaceindustries.com/static/images/account/avatar_default_big.jpg";

    final userProfilePic = AssetImage("assets/images/user_profile_pic.jpeg");
    final title = Provider.of<MainDataModel>(context).isVIP ? "避难所Premium生效中" : "避难所Premium已失效...";
    String subtitle = "点此获取订阅";
    if (Provider.of<MainDataModel>(context).isVIP) {
      final remainingDays = getRemainingDays(Provider.of<MainDataModel>(context).property?.vipExpire ?? 0);
      final token = Provider.of<MainDataModel>(context).property?.credit ?? 0;
      subtitle = "订阅剩余 $remainingDays 天 | $token";
    }


    return Stack(
      children: [
        BigUserCard(
          // cardColor: Colors.red,
          backgroundColor: cardBackgroundColor(context),
          userName: userNameString,
          userProfilePic: userProfilePic,
          cardActionWidget: SettingsItem(
            icons: Icons.edit,
            iconStyle: IconStyle(
              withBackground: true,
              borderRadius: 50,
              backgroundColor: cardBackgroundColor(context),
            ),
            title: title,
            subtitle: subtitle,
            onTap: () async {
              Uri uri = Uri.parse(CirnoApiClient().getSubscriptionUrl());
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            },
          ),
        ),
        if (Theme.of(context).platform == TargetPlatform.macOS || 
            Theme.of(context).platform == TargetPlatform.windows || 
            Theme.of(context).platform == TargetPlatform.linux)
          Positioned(
            left: 0,
            top: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
      ],
    );
  }



  @override
  void initState() {
    super.initState();
    getVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.05),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              getUserCard(context),
              SettingsGroup(
                // backgroundColor: Theme.of(context).cardColor,
                items: [
                  SettingsItem(
                    onTap: () {
                      WoltModalSheet.show<void>(
                        context: context,
                        pageListBuilder: (modalSheetContext) {
                          return [
                            getColorPickerBottomSheet(
                              modalSheetContext,
                              Theme.of(context).colorScheme.primary,
                              (scheme) {

                                if (!Provider.of<MainDataModel>(context, listen: false).isVIP) {
                                  showVipAlert(context: context);
                                  return;
                                }

                                Provider.of<MainDataModel>(context, listen: false)
                                    .setTheme(null, scheme);
                              },
                            ),
                          ];
                        },
                      );
                    },
                    icons: CupertinoIcons.pencil_outline,
                    iconStyle: IconStyle(),
                    title: '主题',
                    subtitle: "自定义避难所App风格",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.translate_rounded,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.green,
                    ),
                    title: '机库翻译',
                    subtitle: "已关闭",
                    trailing: Switch.adaptive(
                      value: true,
                      onChanged: (value) {
                        showToast(message: "暂不支持此功能");
                      },
                    ),
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.dark_mode_rounded,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: '夜间模式',
                    subtitle: Provider.of<MainDataModel>(context).isVIP ? "自动切换" : "缺少有效的避难所Premium",
                    trailing: Switch.adaptive(
                      value: Provider.of<MainDataModel>(context).isDarkMode,
                      onChanged: (value) {
                        if (!Provider.of<MainDataModel>(context, listen: false).isVIP) {
                          showVipAlert(context: context);
                          return;
                        }
                        Provider.of<MainDataModel>(context, listen: false)
                            .toggleDarkMode();
                      },
                    ),
                  ),
                ],
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      launchUrl(Uri.parse("https://image.biaoju.site/star-refuge/docs/intro/"), mode: LaunchMode.inAppBrowserView);
                    },
                    icons: Icons.info_rounded,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.purple,
                    ),
                    title: '关于',
                    subtitle: "更了解避难所",
                  ),
                ],
              ), 
              // You can add a settings title
              SettingsGroup(
                settingsGroupTitle: "关于",
                items: [
                  SettingsItem(
                    onTap: () {
                      // copy group id to clipboard
                      Clipboard.setData(ClipboardData(text: "689970313"));
                      showToast(message: "已复制群号到剪贴板");
                    },
                    icons: Icons.group_rounded,
                    title: "反馈群",
                    subtitle: "QQ群: 689970313",
                  ),
                  SettingsItem(
                    onTap: () async {
                      final now = DateTime.now();
                      if (_lastTapTime == null || 
                          now.difference(_lastTapTime!).inMilliseconds > 2000) {
                        _tapCount = 0;
                      }
                      _lastTapTime = now;
                      _tapCount++;
                      
                      if (_tapCount >= 7) {
                        if (!Provider.of<MainDataModel>(context, listen: false).isVIP) {
                          // showVipAlert(context: context);
                          return;
                        }
                        final isDevMode = Provider.of<MainDataModel>(context, listen: false).isDevMode;
                        Provider.of<MainDataModel>(context, listen: false)
                            .setDevMode(!isDevMode);
                        showToast(message: isDevMode ? "已关闭开发者模式" : "已开启开发者模式");
                        CirnoApiClient().updateClientInfo("DEV ENABLED");
                        _tapCount = 0;
                      }
                    },
                    icons: Icons.construction_outlined,
                    title: "版本号",
                    subtitle: version,
                  ),
                  SettingsItem(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: CirnoAuth.instance!.uuid));
                      showToast(message: "已复制UUID到剪贴板");
                    },
                    icons: CupertinoIcons.device_phone_portrait,
                    title: "UUID",
                    subtitle: CirnoAuth.instance!.uuid,
                  ),
                  SettingsItem(
                    onTap: () {
                      launchUrl(Uri.parse("https://github.com/summerkirakira/RefugeNext"), mode: LaunchMode.externalApplication);
                    },
                    icons: Icons.code_rounded,
                    title: "开源地址",
                    subtitle: "https://github.com/summerkirakira/RefugeNext",
                  ),
                  SettingsItem(
                    onTap: () {
                      launchUrl(Uri.parse("https://github.com/summerkirakira/RefugeNext/releases"), mode: LaunchMode.externalApplication);
                    },
                    icons: Icons.download_outlined,
                    title: "最新版本",
                    subtitle: "https://github.com/summerkirakira/RefugeNext/releases",
                  ),
                  SettingsItem(
                    onTap: () {

                    },
                    icons: Icons.description_outlined,
                    title: "开源协议",
                    subtitle: "GNU AGPLv3",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}