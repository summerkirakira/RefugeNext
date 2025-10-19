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
import '../../datasource/models/cirno/account.dart';
import '../../funcs/launch_at_startup_service.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}


class _SettingsPageState extends State<SettingsPage> {

  String version = "loading...";
  DateTime? _lastTapTime;
  int _tapCount = 0;
  AccountInfoResponse? _refugeAccountInfo;
  bool _isLoadingRefugeAccount = true;
  bool _isRefreshing = false;

  void getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      final buildNumber = packageInfo.buildNumber;
      version = "${packageInfo.version}+$buildNumber";
    });
  }

  void _loadRefugeAccountInfo() async {
    final isLoggedIn = await RefugeAccountRepo().isLoggedIn();
    if (isLoggedIn) {
      try {
        final accountInfo = await CirnoApiClient().getAccountInfo();
        if (mounted) {
          setState(() {
            _refugeAccountInfo = accountInfo;
            _isLoadingRefugeAccount = false;
          });
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _isLoadingRefugeAccount = false;
          });
        }
      }
    } else {
      if (mounted) {
        setState(() {
          _isLoadingRefugeAccount = false;
        });
      }
    }
  }

  /// 刷新VIP订阅状态和账户信息
  Future<void> _refreshVipAndAccount() async {
    if (_isRefreshing) return;

    setState(() {
      _isRefreshing = true;
    });

    try {
      // 刷新VIP订阅状态
      if (!mounted) return;
      await Provider.of<MainDataModel>(context, listen: false).refreshVipStatus();

      // 刷新避难所账户信息
      final isLoggedIn = await RefugeAccountRepo().isLoggedIn();
      if (isLoggedIn) {
        final accountInfo = await CirnoApiClient().getAccountInfo();
        if (mounted) {
          setState(() {
            _refugeAccountInfo = accountInfo;
          });
        }
      }

      showToast(message: "订阅状态已刷新");
  } catch (e) {
      showToast(message: "刷新失败: ${e.toString()}");
    } finally {
      if (mounted) {
        setState(() {
          _isRefreshing = false;
        });
      }
    }
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
    // 使用全局订阅状态判断背景色（不依赖避难所账号登录）
    final isVip = Provider.of<MainDataModel>(context).isVIP;

    // 根据登录状态显示不同的用户名
    String userName;
    String cardTitle;
    String cardSubtitle;
    VoidCallback? cardOnTap;

    if (_refugeAccountInfo == null) {
      // 未登录避难所账号
      userName = "未登录QAQ";
      cardTitle = isVip ? "避难所Premium生效中" : "避难所Premium已失效...";
      cardSubtitle = "点此登录或获取订阅";
      cardOnTap = () async {
        Uri uri = Uri.parse(CirnoApiClient().getSubscriptionUrl());
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      };
    } else {
      // 已登录避难所账号
      userName = _refugeAccountInfo!.username ?? "未设置用户名";
      final vipDays = (_refugeAccountInfo!.totalVipSeconds / 86400).floor();
      final credit = _refugeAccountInfo!.totalCredit;

      cardTitle = isVip ? "避难所Premium生效中" : "避难所Premium已失效...";
      // cardSubtitle = "绑定邮箱: ${_refugeAccountInfo!.email}\n订阅剩余 $vipDays 天 | 积分$credit";
      cardSubtitle = "订阅剩余 $vipDays 天 | $credit";
      cardOnTap = () async {
        Uri uri = Uri.parse(CirnoApiClient().getSubscriptionUrl());
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      };
    }

    // 计算卡片背景色
    Color backgroundColor;
    if (!isVip) {
      backgroundColor = Colors.grey[400]!;
    } else {
      final isDarkMode = Provider.of<MainDataModel>(context).isDarkMode;
      backgroundColor = isDarkMode
          ? Theme.of(context).primaryColorDark
          : Theme.of(context).primaryColor;
    }

    // 根据是否有头像选择显示方式
    ImageProvider userProfilePic;
    if (_refugeAccountInfo?.avatar != null && _refugeAccountInfo!.avatar!.isNotEmpty) {
      userProfilePic = CachedNetworkImageProvider(
        _refugeAccountInfo!.avatar!,
        scale: 0.5,
      );
    } else {
      userProfilePic = const AssetImage("assets/images/cirno_avatar.jpeg");
    }

    return Stack(
      children: [
        BigUserCard(
          backgroundColor: backgroundColor,
          userName: userName,
          userMoreInfo: GestureDetector(
            onTap: () async {
              final isLoggedIn = await RefugeAccountRepo().isLoggedIn();
              if (isLoggedIn) {
                // 已登录，跳转到账号详情页
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RefugeAccountDetailPage(),
                  ),
                );
              } else {
                // 未登录，显示登录页
                showRefugeAccountModal(
                  context,
                  onLoginSuccess: () {
                    _loadRefugeAccountInfo();
                  },
                );
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _refugeAccountInfo == null
                      ? "点击登录避难所账号"
                      : "管理避难所账号",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          userProfilePic: userProfilePic,
          cardActionWidget: SettingsItem(
            icons: Icons.edit,
            iconStyle: IconStyle(
              withBackground: true,
              borderRadius: 50,
              backgroundColor: backgroundColor,
            ),
            title: cardTitle,
            subtitle: cardSubtitle,
            onTap: cardOnTap,
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
        // 刷新按钮
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            icon: _isRefreshing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.refresh, color: Colors.white),
            tooltip: "刷新订阅状态",
            onPressed: _isRefreshing ? null : _refreshVipAndAccount,
          ),
        ),
      ],
    );
  }



  @override
  void initState() {
    super.initState();
    getVersion();
    _loadRefugeAccountInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.05),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
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
                    subtitle: Provider.of<MainDataModel>(context).enableHangarTranslation ? "已开启" : "已关闭",
                    trailing: Switch.adaptive(
                      value: Provider.of<MainDataModel>(context).enableHangarTranslation,
                      onChanged: (value) {
                        Provider.of<MainDataModel>(context, listen: false)
                            .setEnableHangarTranslation(value);
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
                  // 开机自启动设置（仅桌面平台显示）
                  if (LaunchAtStartupService.isDesktopPlatform())
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.power_settings_new_rounded,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.deepOrange,
                      ),
                      title: '开机自启动',
                      subtitle: Provider.of<MainDataModel>(context).enableLaunchAtStartup
                          ? "应用将在系统启动时自动运行并最小化到托盘"
                          : "关闭开机自启动",
                      trailing: Switch.adaptive(
                        value: Provider.of<MainDataModel>(context).enableLaunchAtStartup,
                        onChanged: (value) async {
                          final launchService = LaunchAtStartupService();
                          bool success = false;

                          if (value) {
                            // 启用开机自启动
                            success = await launchService.enable();
                            if (success) {
                              await Provider.of<MainDataModel>(context, listen: false)
                                  .setEnableLaunchAtStartup(true);
                              showToast(message: "已启用开机自启动");
                            } else {
                              showToast(message: "启用开机自启动失败");
                            }
                          } else {
                            // 禁用开机自启动
                            success = await launchService.disable();
                            if (success) {
                              await Provider.of<MainDataModel>(context, listen: false)
                                  .setEnableLaunchAtStartup(false);
                              showToast(message: "已禁用开机自启动");
                            } else {
                              showToast(message: "禁用开机自启动失败");
                            }
                          }
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
              // 游戏设置
              SettingsGroup(
                settingsGroupTitle: "游戏",
                items: [
                    if (Platform.isWindows)
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
                    if (Platform.isWindows)
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
                    if (Platform.isWindows)
                      SettingsItem(
                        onTap: () {},
                        icons: Icons.sync_rounded,
                        iconStyle: IconStyle(
                          iconsColor: Colors.white,
                          withBackground: true,
                          backgroundColor: Colors.teal,
                        ),
                        title: '实时同步日志',
                        subtitle: "自动同步游戏产生的日志文件，无需手动上传",
                        trailing: Switch.adaptive(
                          value: Provider.of<MainDataModel>(context).enableRealtimeLogSync,
                          onChanged: (value) {
                            if (!Provider.of<MainDataModel>(context, listen: false).isVIP) {
                              showVipAlert(context: context);
                              return;
                            }
                            Provider.of<MainDataModel>(context, listen: false)
                                .setEnableRealtimeLogSync(value);
                          },
                        ),
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
                    if (Platform.isWindows)
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
    ),
  ),
);
  }
}