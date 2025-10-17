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
import 'package:file_picker/file_picker.dart';
import '../../services/game_log_service.dart';
import '../game_logs/game_log_modal.dart';
import '../user_info/refuge_account_modal.dart';
import '../user_info/refuge_account_detail_page.dart';
import '../../repo/refuge_account.dart';


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

  Future<void> selectGameDirectory(BuildContext context) async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath(
      dialogTitle: '选择Star Citizen游戏目录',
    );

    if (selectedDirectory != null) {
      if (!GameLogService.isValidGameDirectory(selectedDirectory)) {
        showToast(message: "无效的游戏目录，请选择Star Citizen根目录");
        return;
      }

      await Provider.of<MainDataModel>(context, listen: false)
          .setGameDirectory(selectedDirectory);
      showToast(message: "游戏目录已设置");
    }
  }

  Future<void> autoFindGameDirectory(BuildContext context) async {
    final gameDir = await GameLogService.findGameDirectory();
    if (gameDir != null) {
      await Provider.of<MainDataModel>(context, listen: false)
          .setGameDirectory(gameDir);
      showToast(message: "已自动找到游戏目录: $gameDir");
    } else {
      showToast(message: "未找到游戏目录，请手动选择");
    }
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
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.refresh_rounded,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.blue,
                    ),
                    title: '显示刷新按钮',
                    subtitle: Provider.of<MainDataModel>(context).showRefreshButton ? "机库和商店页面显示刷新按钮" : "隐藏机库和商店页面的刷新按钮",
                    trailing: Switch.adaptive(
                      value: Provider.of<MainDataModel>(context).showRefreshButton,
                      onChanged: (value) {
                        Provider.of<MainDataModel>(context, listen: false)
                            .setShowRefreshButton(value);
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
              // 游戏设置 - 仅Windows显示
              if (Platform.isWindows)
                SettingsGroup(
                  settingsGroupTitle: "游戏",
                  items: [
                    SettingsItem(
                      onTap: () async {
                        await selectGameDirectory(context);
                      },
                      icons: Icons.folder_rounded,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.orange,
                      ),
                      title: '游戏目录',
                      subtitle: Provider.of<MainDataModel>(context).gameDirectory ?? "未设置",
                    ),
                    // SettingsItem(
                    //   onTap: () async {
                    //     await autoFindGameDirectory(context);
                    //   },
                    //   icons: Icons.search_rounded,
                    //   iconStyle: IconStyle(
                    //     iconsColor: Colors.white,
                    //     withBackground: true,
                    //     backgroundColor: Colors.teal,
                    //   ),
                    //   title: '自动查找游戏目录',
                    //   subtitle: "自动搜索常见安装位置",
                    // ),
                    SettingsItem(
                      onTap: () async {
                        final dataModel = Provider.of<MainDataModel>(context, listen: false);
                        if (dataModel.gameDirectory == null) {
                          showToast(message: "请先设置游戏目录");
                          return;
                        }

                        // 调用合并后的导入方法
                        await dataModel.importAllGameLogs();
                      },
                      icons: Icons.file_download_rounded,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.indigo,
                      ),
                      title: '导入游戏日志',
                      subtitle: "导入当前日志&历史日志",
                    ),
                    SettingsItem(
                      onTap: () {
                        GameLogModal.show(context);
                      },
                      icons: Icons.view_list_rounded,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.green,
                      ),
                      title: '查看日志',
                      subtitle: "浏览和搜索游戏日志",
                    ),
                    // SettingsItem(
                    //   onTap: () async {
                    //     final dataModel = Provider.of<MainDataModel>(context, listen: false);
                    //     final thirtyDaysAgo = DateTime.now().subtract(Duration(days: 30));
                    //     final deletedCount = await dataModel.clearOldGameLogs(thirtyDaysAgo);
                    //     showToast(message: "已清理 $deletedCount 条旧日志");
                    //   },
                    //   icons: Icons.delete_sweep_rounded,
                    //   iconStyle: IconStyle(
                    //     iconsColor: Colors.white,
                    //     withBackground: true,
                    //     backgroundColor: Colors.red,
                    //   ),
                    //   title: '清理旧日志',
                    //   subtitle: "清理30天前的游戏日志",
                    // ),
                    SettingsItem(
                      onTap: () async {
                        final dataModel = Provider.of<MainDataModel>(context, listen: false);
                        final processedCount = await dataModel.gameLogRepo.getProcessedFileCount();

                        if (processedCount == 0) {
                          showToast(message: "当前没有已处理的历史日志记录");
                          return;
                        }

                        await dataModel.gameLogRepo.clearProcessedFiles();
                        showToast(message: "已清空 $processedCount 个历史日志文件的处理记录\n下次导入时将重新处理所有历史日志");
                      },
                      icons: Icons.refresh_rounded,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.deepPurple,
                      ),
                      title: '重置处理记录',
                      subtitle: "清空历史日志处理记录，下次将重新导入所有历史日志",
                    ),
                    // SettingsItem(
                    //   onTap: () async {
                    //     final dataModel = Provider.of<MainDataModel>(context, listen: false);
                    //     final dupCount = await dataModel.getDuplicateLogCount();
                    //     if (dupCount == 0) {
                    //       showToast(message: "没有发现重复日志");
                    //       return;
                    //     }
                    //     final deletedCount = await dataModel.removeDuplicateGameLogs();
                    //     showToast(message: "已清理 $deletedCount 条重复日志");
                    //   },
                    //   icons: Icons.auto_fix_high_rounded,
                    //   iconStyle: IconStyle(
                    //     iconsColor: Colors.white,
                    //     withBackground: true,
                    //     backgroundColor: Colors.deepPurple,
                    //   ),
                    //   title: '清理重复日志',
                    //   subtitle: "删除重复的游戏日志记录",
                    // ),
                  ],
                ),
              // You can add a settings title
              SettingsGroup(
                settingsGroupTitle: "关于",
                items: [
                  SettingsItem(
                    onTap: () async {
                      // 检查是否已登录
                      final isLoggedIn = await RefugeAccountRepo().isLoggedIn();

                      if (isLoggedIn) {
                        // 已登录，导航到账户详情页面
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RefugeAccountDetailPage(),
                          ),
                        );
                      } else {
                        // 未登录，显示登录/注册 Modal
                        showRefugeAccountModal(context);
                      }
                    },
                    icons: Icons.cloud_outlined,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.blueAccent,
                    ),
                    title: "避难所账号",
                    subtitle: "登录/注册避难所账号（测试）",
                  ),
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