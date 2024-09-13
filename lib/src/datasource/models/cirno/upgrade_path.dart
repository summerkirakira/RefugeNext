class ShipUpgradeConfig {
  final int fromShipId;
  final int toShipId;
  final List<int> bannedShipList;
  final List<CCUItem> bannedWbCcuList;
  final List<int> mustHaveShipList;
  final bool useHistoryCcu;
  final List<CCUItem> hangarCcuList;
  final List<CCUItem> buybackCcuList;

  ShipUpgradeConfig({
    required this.fromShipId,
    required this.toShipId,
    required this.bannedShipList,
    required this.bannedWbCcuList,
    required this.mustHaveShipList,
    required this.useHistoryCcu,
    required this.hangarCcuList,
    required this.buybackCcuList,
  });

  factory ShipUpgradeConfig.fromJson(Map<String, dynamic> json) {
    return ShipUpgradeConfig(
      fromShipId: json['from_ship_id'] as int,
      toShipId: json['to_ship_id'] as int,
      bannedShipList: List<int>.from(json['banned_ship_list']),
      bannedWbCcuList: (json['banned_wb_ccu_list'] as List)
          .map((item) => CCUItem.fromJson(item))
          .toList(),
      mustHaveShipList: List<int>.from(json['must_have_ship_list']),
      useHistoryCcu: json['use_history_ccu'] as bool,
      hangarCcuList: (json['hangar_ccu_list'] as List)
          .map((item) => CCUItem.fromJson(item))
          .toList(),
      buybackCcuList: (json['buyback_ccu_list'] as List)
          .map((item) => CCUItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from_ship_id': fromShipId,
      'to_ship_id': toShipId,
      'banned_ship_list': bannedShipList,
      'banned_wb_ccu_list': bannedWbCcuList.map((item) => item.toJson()).toList(),
      'must_have_ship_list': mustHaveShipList,
      'use_history_ccu': useHistoryCcu,
      'hangar_ccu_list': hangarCcuList.map((item) => item.toJson()).toList(),
      'buyback_ccu_list': buybackCcuList.map((item) => item.toJson()).toList(),
    };
  }
}

class CCUItem {
  final Ship fromShip;
  final Ship toShip;
  final int value;

  CCUItem({
    required this.fromShip,
    required this.toShip,
    required this.value,
  });

  factory CCUItem.fromJson(Map<String, dynamic> json) {
    return CCUItem(
      fromShip: Ship.fromJson(json['from_ship']),
      toShip: Ship.fromJson(json['to_ship']),
      value: json['value'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from_ship': fromShip.toJson(),
      'to_ship': toShip.toJson(),
      'value': value,
    };
  }
}

class Ship {
  final int id;
  final int value;

  Ship({
    required this.id,
    required this.value,
  });

  factory Ship.fromJson(Map<String, dynamic> json) {
    return Ship(
      id: json['id'] as int,
      value: json['value'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value': value,
    };
  }
}