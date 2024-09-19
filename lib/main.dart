import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/widgets/utility/utility_page.dart';
import 'package:refuge_next/src/widgets/webview/full_screen_webview.dart';
import 'package:refuge_next/src/widgets/webview/rsi_webpage.dart';
import 'src/datasource/data_model.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await mustStartup();

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
      return MaterialApp(
        title: '星河避难所',
        theme: dataModel.getTheme(context),
        // theme: FlexColorScheme.light(scheme: FlexScheme.aquaBlue).toTheme,
        home: LoaderOverlay(
          child: MyHomePage(),
        ),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
            // ElevatedButton(onPressed: () => {
            //   openRsiCartWebview(context: context)
            // }, child: Text('test')),
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
      return Scaffold(
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUpdate();
    });
  }

}
