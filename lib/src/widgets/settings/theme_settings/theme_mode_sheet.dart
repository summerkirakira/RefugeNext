import 'package:flutter/material.dart';

String themeModeLabel(ThemeMode mode) => switch (mode) {
      ThemeMode.dark => '开启',
      ThemeMode.light => '关闭',
      ThemeMode.system => '跟随系统',
    };

class ThemeModeSheet extends StatelessWidget {
  const ThemeModeSheet({super.key, required this.selectedMode});

  final ThemeMode selectedMode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
              child: Text('夜间模式', style: theme.textTheme.titleLarge),
            ),
            for (final option in const [
              (ThemeMode.dark, Icons.dark_mode_outlined, '始终使用深色外观'),
              (ThemeMode.light, Icons.light_mode_outlined, '始终使用浅色外观'),
              (ThemeMode.system, Icons.brightness_auto_outlined, '随系统外观自动切换'),
            ])
              ListTile(
                leading: Icon(option.$2),
                title: Text(themeModeLabel(option.$1)),
                subtitle: Text(option.$3),
                selected: selectedMode == option.$1,
                trailing: selectedMode == option.$1
                    ? Icon(Icons.check_rounded,
                        color: theme.colorScheme.primary)
                    : null,
                onTap: () => Navigator.of(context).pop(option.$1),
              ),
          ],
        ),
      ),
    );
  }
}
