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
