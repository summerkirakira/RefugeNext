import 'package:flutter/foundation.dart';
import 'game_item_translation.dart';
import 'ship_alias.dart';
import 'translation.dart';

/// Local resources only. Missing files leave the repositories' fallback values
/// available; a later successful load emits a change without reopening a page.
Future<void> loadTerminalLocalization() async {
  await Future.wait([
    TranslationRepo().loadTranslationSetting(),
    TranslationRepo().getTranslations(),
    ShipAliasRepo().getShipAliases(),
    GameItemTranslationRepo().load(),
  ]);
}

final Listenable terminalLocalizationChanges = Listenable.merge([
  TranslationRepo(),
  ShipAliasRepo(),
  GameItemTranslationRepo(),
]);
