import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/funcs/request_star.dart';
import 'package:refuge_next/src/widgets/utility/utility_page.dart';
import 'src/datasource/data_model.dart';
import 'src/widgets/navigation/main_navigation_bar.dart';
import 'src/widgets/navigation/main_navigation_rail.dart';
import 'src/funcs/initial.dart';
import 'src/widgets/hangar/hangar_page.dart';
import 'src/widgets/user_info/user_page.dart';
import 'src/widgets/shop/shop_page.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:refuge_next/src/widgets/empty_page/empty_page.dart' show EmptyPage;
import 'package:refuge_next/src/funcs/cirno_auth.dart';
import 'package:refuge_next/src/funcs/app_update.dart';
import 'package:toastification/toastification.dart';
import 'package:window_manager/window_manager.dart';
import 'package:refuge_next/src/funcs/tray_manager_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await mustStartup();

  // 初始化window manager和tray manager（仅桌面平台）
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1280, 720),
      minimumSize: Size(800, 600),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      title: '星河避难所',
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      // 设置拦截窗口关闭事件
      await windowManager.setPreventClose(true);
    });

    // 初始化系统托盘
    await TrayManagerService().initialize();
  }

  runApp(ChangeNotifierProvider<MainDataModel>(
    create: (context) => MainDataModel(),
    child: RefugeApp(),
  ));

  // runApp(RefugeApp());
  await startup();
}


class RefugeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainDataModel>(
        builder: (context, dataModel, _) {
      return ToastificationWrapper(
        child: MaterialApp(
          title: '星河避难所',
          theme: dataModel.getTheme(context),
          // theme: FlexColorScheme.light(scheme: FlexScheme.aquaBlue).toTheme,
          home: LoaderOverlay(
            child: MyHomePage(),
          ),
        ),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WindowListener {

  @override
  void initState() {
    super.initState();

    // 在桌面平台注册窗口监听器
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      windowManager.addListener(this);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUpdate();
      showStarDialog(context);
    });
  }

  @override
  void dispose() {
    // 移除窗口监听器
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      windowManager.removeListener(this);
    }
    super.dispose();
  }

  @override
  Future<void> onWindowClose() async {
    // 拦截窗口关闭事件，隐藏到托盘而不是退出
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose) {
      await windowManager.hide();
      await windowManager.setSkipTaskbar(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine if the screen is wide enough to show the NavigationRail
    bool isWideScreen = MediaQuery.of(context).size.width >= 600;

    final selectedPage = context.watch<MainDataModel>().selectedPage;

    bool isLogin = context.watch<MainDataModel>().currentUser != null;

    bool isUserInit = context.watch<MainDataModel>().userInitFinished;

    if (!isUserInit) {
      return Scaffold(
        body: Center(
          child: Container(),
        ),
      );
    }

    if (isLogin) {
      return Scaffold(
        body: Row(
          children: [
            if (isWideScreen)
              MainNavigationRail(),
            Expanded(
              child: Center(
                child: _getSelectedPage(selectedPage),
              ),
            ),
          ],
        ),
        bottomNavigationBar: isWideScreen ? null : MainNavigationBar(),
      );
    } else {
      return const Scaffold(
        body: EmptyPage(),
      );
    }

  }

  Widget _getSelectedPage(int _selectedIndex) {
    switch (_selectedIndex) {
      case 0:
        return HangarPage();
      case 1:
        return ShopPage();
      case 2:
        return FeatureSelectionPage();
      case 3:
        return UserInfoPage();
      default:
        return Text('Home Page');
    }
  }

  Future<void> checkUpdate() async {
    final auth = await CirnoAuth.getInstance();
    auth.addAfterInit(() => showUpdateDialog(context, auth.property!));
  }

}
