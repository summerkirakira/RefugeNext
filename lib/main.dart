import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/datasource/data_model.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'src/widgets/navigation/main_navigation_bar.dart';

void main() {
  // ChangeNotifierProvider(
  //   create: (context) => MainDataModel(),
  //   child: RefugeApp(),
  // );
  runApp(RefugeApp());
}

class RefugeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlexColorScheme.light(scheme: FlexScheme.deepBlue).toTheme,
      home: ChangeNotifierProvider<MainDataModel>(
        create: (context) => MainDataModel(),
        child: MyHomePage(),
      ),
    );
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

    return Scaffold(
      body: Row(
        children: [
          if (isWideScreen)
            NavigationRail(
              selectedIndex: context.watch<MainDataModel>().selectedPage,
              onDestinationSelected: (int index) {
                setState(() {

                });
              },
              labelType: NavigationRailLabelType.selected,
              groupAlignment: 0.0,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  selectedIcon: Icon(Icons.home_filled),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star),
                  selectedIcon: Icon(Icons.star),
                  label: Text('Favorites'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  selectedIcon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
              ],
            ),
          Expanded(
            child: Center(
              child: _getSelectedPage(context.watch<MainDataModel>().selectedPage),
            ),
          ),
        ],
      ),
      bottomNavigationBar: isWideScreen ? null : MainNavigationBar(),
    );
  }

  Widget _getSelectedPage(int _selectedIndex) {
    switch (_selectedIndex) {
      case 0:
        return Text('Home Page');
      case 1:
        return Text('Favorites Page');
      case 2:
        return Text('Settings Page');
      default:
        return Text('Home Page');
    }
  }
}
