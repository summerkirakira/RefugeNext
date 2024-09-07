import 'package:refuge_next/src/datasource/models/shop/upgrade_ship_info.dart' show UpgradeShipInfo, Skus;
import 'package:refuge_next/src/network/api_service.dart';
import '../datasource/models/shop/upgrade_ship_info.dart' show UpgradeShipInfo;
import '../network/graphql/init_ship_upgrade.dart';
import '../network/graphql/filtered_ship_upgrade.dart';
import 'package:refuge_next/src/repo/ship_alias.dart';



class ShipUpgradeRepo {
  static final ShipUpgradeRepo _instance = ShipUpgradeRepo._internal();

  ShipUpgradeRepo._internal();

  factory ShipUpgradeRepo() => _instance;

  final RsiApiClient rsiApiClient = RsiApiClient();

  List<UpgradeShipInfo> _shipUpgrade = [];

  Future<List<UpgradeShipInfo>> initShipUpgrade() async {
    await rsiApiClient.setAuthToken();
    await rsiApiClient.setContextToken();

    final response = await InitShipUpgrade().execute();
    if (response == null) {
      return [];
    }
    _shipUpgrade = response;
    return response;
  }
  
  
  List<UpgradeShipInfo> modifyShipInfo(List<UpgradeShipInfo> ships) {
    final shipAliasRepo = ShipAliasRepo();
    ships.forEach((ship) {
      ship.shipAlias = shipAliasRepo.getShipAliasSync(ship.name!);
    });

    ships.sort((a, b) {
      if (a.shipAlias != null && b.shipAlias != null) {
        return a.shipAlias!.getHighestSku().compareTo(b.shipAlias!.getHighestSku());
      }
      return 0;
    });

    return ships;
  }
  

  Future<List<List<UpgradeShipInfo>>> filterShipUpgrade(int? fromId, int? toId) async {
    final response = await FilterUpgradeShip(fromId: fromId, toId: toId).execute();

    List<int> fromIds = [];
    List<int> toIds = [];

    if (response.data!.from != null) {
      fromIds = response.data!.from!.ships!.map((e) => e.id!).toList();
    }
    toIds = response.data!.to!.ships!.map((e) => e.id!).toList();

    final toSkus = response.data!.to!.ships!.map((e) => e.skus!).toList();

    List<UpgradeShipInfo> fromShips = getShipsByIds(fromIds, null);
    List<UpgradeShipInfo> toShips = getShipsByIds(toIds, toSkus);

    return [modifyShipInfo(fromShips), modifyShipInfo(toShips)];
  }

  List<UpgradeShipInfo> getShipsByIds(List<int> idList, List<List<Skus>>? toSkus) {
    List<UpgradeShipInfo> result = [];
    final upgradeMap = {for (var upgrade in _shipUpgrade) upgrade.id: upgrade};
    if (upgradeMap.isEmpty) {
      return result;
    }
    List<UpgradeShipInfo> ships = idList.map((id) => upgradeMap[id]!).toList();
    if (toSkus != null) {
      for (int i = 0; i < toSkus.length; i++) {
        ships[i].skus = toSkus[i];
      }
    }
    return ships;
  }

  List<UpgradeShipInfo> get shipUpgrade => _shipUpgrade;

}