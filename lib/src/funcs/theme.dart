import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlexSchemeHelper {
  static final Map<String, FlexScheme> _schemeMap = {
    'material': FlexScheme.material,
    'materialHc': FlexScheme.materialHc,
    'blue': FlexScheme.blue,
    'indigo': FlexScheme.indigo,
    'hippieBlue': FlexScheme.hippieBlue,
    'aquaBlue': FlexScheme.aquaBlue,
    'brandBlue': FlexScheme.brandBlue,
    'deepBlue': FlexScheme.deepBlue,
    'sakura': FlexScheme.sakura,
    'mandyRed': FlexScheme.mandyRed,
    'red': FlexScheme.red,
    'redWine': FlexScheme.redWine,
    'purpleBrown': FlexScheme.purpleBrown,
    'green': FlexScheme.green,
    'money': FlexScheme.money,
    'jungle': FlexScheme.jungle,
    'greyLaw': FlexScheme.greyLaw,
    'wasabi': FlexScheme.wasabi,
    'gold': FlexScheme.gold,
    'mango': FlexScheme.mango,
    'amber': FlexScheme.amber,
    'vesuviusBurn': FlexScheme.vesuviusBurn,
    'deepPurple': FlexScheme.deepPurple,
    'ebonyClay': FlexScheme.ebonyClay,
    'barossa': FlexScheme.barossa,
    'shark': FlexScheme.shark,
    'bigStone': FlexScheme.bigStone,
    'damask': FlexScheme.damask,
    'bahamaBlue': FlexScheme.bahamaBlue,
    'mallardGreen': FlexScheme.mallardGreen,
    'espresso': FlexScheme.espresso,
    'outerSpace': FlexScheme.outerSpace,
    'blueWhale': FlexScheme.blueWhale,
    'sanJuanBlue': FlexScheme.sanJuanBlue,
    'rosewood': FlexScheme.rosewood,
    'blumineBlue': FlexScheme.blumineBlue,
    'flutterDash': FlexScheme.flutterDash,
    'materialBaseline': FlexScheme.materialBaseline,
    'verdunHemlock': FlexScheme.verdunHemlock,
    'dellGenoa': FlexScheme.dellGenoa,
    'redM3': FlexScheme.redM3,
    'pinkM3': FlexScheme.pinkM3,
    'purpleM3': FlexScheme.purpleM3,
    'indigoM3': FlexScheme.indigoM3,
    'blueM3': FlexScheme.blueM3,
    'cyanM3': FlexScheme.cyanM3,
    'tealM3': FlexScheme.tealM3,
    'greenM3': FlexScheme.greenM3,
    'limeM3': FlexScheme.limeM3,
    'yellowM3': FlexScheme.yellowM3,
    'orangeM3': FlexScheme.orangeM3,
    'deepOrangeM3': FlexScheme.deepOrangeM3,
  };

  static FlexScheme getSchemeFromString(String schemeName) {
    return _schemeMap[schemeName] ?? FlexScheme.material;
  }

  static List<String> getAllSchemeNames() {
    return _schemeMap.keys.toList();
  }
}

extension FlexSchemeExtension on FlexScheme {
  String get name {
    return FlexSchemeHelper._schemeMap.entries
        .firstWhere((entry) => entry.value == this)
        .key;
  }
}

class ThemeManager extends ChangeNotifier with WidgetsBindingObserver {
  static final ThemeManager _instance = ThemeManager._internal();

  ThemeManager._internal();

  factory ThemeManager() => _instance;

  bool isInitialized = false;
  ThemeMode _themeMode = ThemeMode.light;
  String theme = 'blue';

  ThemeMode get themeMode => _themeMode;

  bool get isDark => switch (_themeMode) {
        ThemeMode.dark => true,
        ThemeMode.light => false,
        ThemeMode.system =>
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark,
      };

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    // 兼容旧版手动开关；未选择过的用户仍默认关闭夜间模式。
    _themeMode = switch (prefs.getString('themeMode')) {
      'system' => ThemeMode.system,
      'dark' => ThemeMode.dark,
      'light' => ThemeMode.light,
      _ =>
        (prefs.getBool('isDark') ?? false) ? ThemeMode.dark : ThemeMode.light,
    };
    theme = prefs.getString('theme') ?? 'blue';

    if (!isInitialized) {
      WidgetsBinding.instance.addObserver(this);
    }
    isInitialized = true;
    _notifyThemeChanged();
  }

  @override
  void didChangePlatformBrightness() {
    if (_themeMode == ThemeMode.system) {
      _notifyThemeChanged();
    }
  }

  void _notifyThemeChanged() {
    changeSystemUIOverlayStyle();
    notifyListeners();
  }

  void changeSystemUIOverlayStyle() {
    if (isDark) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ));
    }
  }

  static ThemeData getTheme(BuildContext context) {
    if (!_instance.isInitialized) {
      return FlexColorScheme.light(
        scheme: FlexScheme.material,
        useMaterial3: false,
        fontFamily: Platform.isWindows ? 'Microsoft YaHei' : null,
      ).toTheme;
    }

    if (_instance.isDark) {
      return FlexColorScheme.dark(
        scheme: FlexSchemeHelper.getSchemeFromString(_instance.theme),
        useMaterial3: false,
        fontFamily: Platform.isWindows ? 'Microsoft YaHei' : null,
      ).toTheme;
    } else {
      return FlexColorScheme.light(
        scheme: FlexSchemeHelper.getSchemeFromString(_instance.theme),
        useMaterial3: false,
        fontFamily: Platform.isWindows ? 'Microsoft YaHei' : null,
      ).toTheme;
    }
  }

  static Future<void> setTheme(bool? isDark, String? theme) async {
    final prefs = await SharedPreferences.getInstance();
    if (isDark != null) {
      await _instance._saveThemeMode(
          prefs, isDark ? ThemeMode.dark : ThemeMode.light);
    }
    if (theme != null) {
      await prefs.setString('theme', theme);
      _instance.theme = theme;
    }
    _instance._notifyThemeChanged();
  }

  static Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await _instance._saveThemeMode(prefs, mode);
    _instance._notifyThemeChanged();
  }

  Future<void> _saveThemeMode(SharedPreferences prefs, ThemeMode mode) async {
    await prefs.setString('themeMode', mode.name);
    if (mode != ThemeMode.system) {
      await prefs.setBool('isDark', mode == ThemeMode.dark);
    }
    _themeMode = mode;
  }
}
