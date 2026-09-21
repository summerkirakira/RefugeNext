import '../../../network/cirno/property/property.dart';
import '../../../repo/ccu_plan_storage.dart';
import '../../../repo/ship_alias.dart';
import '../../../services/rsi_session_service.dart';

/// Compatibility view used by the hangar's saved-chain filter.
class UpgradeStep {
  const UpgradeStep(this.fromProduct, this.toProduct, this.cost, this.tags,
      {required this.fromShip, required this.toShip, this.itemId});
  final String fromProduct;
  final String toProduct;
  final int cost;
  final List<String> tags;
  final ShipAlias fromShip;
  final ShipAlias toShip;
  final int? itemId;
}

Future<List<UpgradeStep>> getStepsFromStorage(int num) async {
  try {
    final saved = await CcuPlanStorage()
        .load(RsiSessionService.instance.account ?? '', num);
    if (saved == null) return [];
    final aliases = {
      for (final s in await ShipAliasRepo().getShipAliases()) s.id: s
    };
    return [
      for (final step in saved.plan.steps)
        if (aliases.containsKey(step.fromShipId) &&
            aliases.containsKey(step.toShipId))
          UpgradeStep(
              saved.names[step.fromShipId] ?? aliases[step.fromShipId]!.name,
              saved.names[step.toShipId] ?? aliases[step.toShipId]!.name,
              step.cost,
              [step.sourceLabel],
              fromShip: aliases[step.fromShipId]!,
              toShip: aliases[step.toShipId]!,
              itemId: step.isOwned ? step.itemId : null)
    ];
  } catch (_) {
    return [];
  }
}
