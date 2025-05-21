class DeviceInfo {
  final String version;
  final String androidVersion;
  final String systemModel;

  DeviceInfo({
    required this.version,
    required this.androidVersion,
    required this.systemModel,
  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    return DeviceInfo(
      version: json['version'] as String,
      androidVersion: json['androidVersion'] as String,
      systemModel: json['systemModel'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'androidVersion': androidVersion,
      'systemModel': systemModel,
    };
  }
}


class RefugeVersionProperty {
  final int versionCode;
  final String versionName;
  final int shipAliasVersionCode;
  final String shipAliasUrl;
  final int translationVersionCode;
  final String translationUrl;
  final bool isVip;
  final int vipExpire;
  final int credit;
  final String appUrl;
  final String updateContent;
  final int shipInfoVersionCode;
  final String shipInfoUrl;

  RefugeVersionProperty({
    required this.versionCode,
    required this.versionName,
    required this.shipAliasVersionCode,
    required this.shipAliasUrl,
    required this.translationVersionCode,
    required this.translationUrl,
    required this.isVip,
    required this.vipExpire,
    required this.credit,
    required this.appUrl,
    required this.updateContent,
    required this.shipInfoVersionCode,
    required this.shipInfoUrl,
  });

  factory RefugeVersionProperty.fromJson(Map<String, dynamic> json) {
    return RefugeVersionProperty(
      versionCode: json['versionCode'] as int,
      versionName: json['versionName'] as String,
      shipAliasVersionCode: json['shipAliasVersionCode'] as int,
      shipAliasUrl: json['shipAliasUrl'] as String,
      translationVersionCode: json['translationVersionCode'] as int,
      translationUrl: json['translationUrl'] as String,
      isVip: json['isVip'] as bool,
      vipExpire: json['vipExpire'] as int,
      credit: json['credit'] as int,
      appUrl: json['appUrl'] as String,
      updateContent: json['updateContent'] as String,
      shipInfoVersionCode: json['shipInfoVersionCode'] as int,
      shipInfoUrl: json['shipInfoUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'versionCode': versionCode,
      'versionName': versionName,
      'shipAliasVersionCode': shipAliasVersionCode,
      'shipAliasUrl': shipAliasUrl,
      'translationVersionCode': translationVersionCode,
      'translationUrl': translationUrl,
      'isVip': isVip,
      'vipExpire': vipExpire,
      'credit': credit,
      'appUrl': appUrl,
      'updateContent': updateContent,
      'shipInfoVersionCode': shipInfoVersionCode,
      'shipInfoUrl': shipInfoUrl,
    };
  }
}

class UpgradeShip {
  final String name;
  final int id;

  UpgradeShip({
    required this.name,
    required this.id,
  });

  factory UpgradeShip.fromJson(Map<String, dynamic> json) {
    return UpgradeShip(
      name: json['name'] as String,
      id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }

  @override
  String toString() {
    return 'UpgradeShip{name: $name, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpgradeShip &&
        other.name == name &&
        other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}

class UpgradeShipList {
  final List<UpgradeShip> ships;

  UpgradeShipList({
    required this.ships,
  });

  factory UpgradeShipList.fromJson(Map<String, dynamic> json) {
    return UpgradeShipList(
      ships: (json['ships'] as List<dynamic>)
          .map((e) => UpgradeShip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ships': ships.map((e) => e.toJson()).toList(),
    };
  }
}
