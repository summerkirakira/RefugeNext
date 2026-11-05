import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';
import '../../repo/terminal_localization.dart';

/// Retains page state while localized labels change. Each page awaits
/// [localizationReady] before publishing its first data snapshot.
mixin TerminalLocalizationState<T extends StatefulWidget> on State<T> {
  late final Future<void> localizationReady =
      context.read<MainDataModel?>()?.localizationReady ??
          loadTerminalLocalization();

  /// 翻译已就绪时为 true,此时页面可以直接显示已有数据,不必等待首帧。
  bool get localizationLoaded =>
      context.read<MainDataModel?>()?.localizationLoaded ?? false;

  @override
  void initState() {
    super.initState();
    terminalLocalizationChanges.addListener(onLocalizationChanged);
  }

  @protected
  void onLocalizationChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    terminalLocalizationChanges.removeListener(onLocalizationChanged);
    super.dispose();
  }
}
