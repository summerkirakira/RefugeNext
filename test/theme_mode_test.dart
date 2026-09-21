import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/funcs/theme.dart';
import 'package:refuge_next/src/widgets/settings/theme_settings/theme_mode_sheet.dart';

class _ThemeModel extends MainDataModel {
  _ThemeModel({this.vip = true});

  bool vip;

  @override
  bool get isVIP => vip;

  @override
  Future<void> initUser() async {}

  @override
  Future<void> initialize() async {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await ThemeManager().init();
  });

  test('兼容旧版开关，并优先读取新的三态选择', () async {
    expect(ThemeManager().themeMode, ThemeMode.light);
    for (final dark in [true, false]) {
      SharedPreferences.setMockInitialValues({'isDark': dark});
      await ThemeManager().init();
      expect(ThemeManager().themeMode, dark ? ThemeMode.dark : ThemeMode.light);
    }
    SharedPreferences.setMockInitialValues({
      'isDark': true,
      'themeMode': 'system',
    });
    await ThemeManager().init();
    expect(ThemeManager().themeMode, ThemeMode.system);
  });

  test('三种模式均可保存并恢复，换主题颜色保留自动模式', () async {
    final model = _ThemeModel();
    addTearDown(model.dispose);
    for (final mode in ThemeMode.values) {
      await model.setThemeMode(mode);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('themeMode'), mode.name);
      await ThemeManager().init();
      expect(model.themeMode, mode);
    }
    await model.setThemeMode(ThemeMode.system);
    await ThemeManager.setTheme(null, 'green');
    expect(model.themeMode, ThemeMode.system);
    expect(ThemeManager().theme, 'green');
  });

  test('非 VIP 无法通过数据模型启用深色或跟随系统', () async {
    final model = _ThemeModel(vip: false);
    addTearDown(model.dispose);
    await model.setThemeMode(ThemeMode.dark);
    expect(model.themeMode, ThemeMode.light);
    await model.setThemeMode(ThemeMode.system);
    expect(model.themeMode, ThemeMode.light);
    await model.toggleDarkMode();
    expect(model.themeMode, ThemeMode.light);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.containsKey('themeMode'), isFalse);
  });

  testWidgets('跟随系统实时更新全局主题，手动开关不受系统影响', (tester) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.light;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
    final model = _ThemeModel();
    addTearDown(model.dispose);
    await model.setThemeMode(ThemeMode.system);
    await tester.pumpWidget(ListenableBuilder(
      listenable: model,
      builder: (context, _) => MaterialApp(
        theme: model.getTheme(context),
        home: Builder(
          builder: (context) => Text(Theme.of(context).brightness.name),
        ),
      ),
    ));
    expect(find.text('light'), findsOneWidget);
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    await tester.pumpAndSettle();
    expect(model.isDarkMode, isTrue);
    expect(find.text('dark'), findsOneWidget);
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.light;
    await tester.pumpAndSettle();
    expect(model.isDarkMode, isFalse);
    expect(find.text('light'), findsOneWidget);

    await model.setThemeMode(ThemeMode.dark);
    await tester.pumpAndSettle();
    expect(find.text('dark'), findsOneWidget);
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.light;
    await tester.pumpAndSettle();
    expect(find.text('dark'), findsOneWidget);

    await model.setThemeMode(ThemeMode.light);
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    await tester.pumpAndSettle();
    expect(model.isDarkMode, isFalse);
    expect(find.text('light'), findsOneWidget);
  });

  test('现有非会员重置逻辑会退出跟随系统并通知界面', () async {
    final model = _ThemeModel();
    await model.setThemeMode(ThemeMode.system);
    var notifications = 0;
    model.addListener(() => notifications++);
    await ThemeManager.setTheme(false, 'blue');
    expect(model.themeMode, ThemeMode.light);
    expect(notifications, 1);
    model.dispose();
    await ThemeManager.setThemeMode(ThemeMode.dark);
    expect(notifications, 1);
  });

  for (final mode in ThemeMode.values) {
    testWidgets('夜间模式弹窗选择 ${mode.name}', (tester) async {
      ThemeMode? selected;
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () async {
                selected = await showModalBottomSheet<ThemeMode>(
                  context: context,
                  builder: (_) => const ThemeModeSheet(
                    selectedMode: ThemeMode.system,
                  ),
                );
              },
              child: const Text('选择模式'),
            ),
          ),
        ),
      ));
      await tester.tap(find.text('选择模式'));
      await tester.pumpAndSettle();
      expect(find.text('开启'), findsOneWidget);
      expect(find.text('关闭'), findsOneWidget);
      expect(find.text('跟随系统'), findsOneWidget);
      expect(find.byIcon(Icons.check_rounded), findsOneWidget);
      await tester.tap(find.text(themeModeLabel(mode)));
      await tester.pumpAndSettle();
      expect(selected, mode);
      expect(find.byType(ThemeModeSheet), findsNothing);
    });
  }
}
