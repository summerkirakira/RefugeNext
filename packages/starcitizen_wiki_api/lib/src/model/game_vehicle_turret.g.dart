// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_turret.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleTurret _$GameVehicleTurretFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleTurret',
  json,
  ($checkedConvert) {
    final val = GameVehicleTurret(
      category: $checkedConvert('category', (v) => v as String?),
      displayName: $checkedConvert('display_name', (v) => v as String?),
      hardpointName: $checkedConvert('hardpoint_name', (v) => v as String?),
      partName: $checkedConvert('part_name', (v) => v as String?),
      turretType: $checkedConvert('turret_type', (v) => v as String?),
      className: $checkedConvert('class_name', (v) => v as String?),
      size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
      turret: $checkedConvert('turret', (v) => v as bool?),
      gimballed: $checkedConvert('gimballed', (v) => v as bool?),
      fixed: $checkedConvert('fixed', (v) => v as bool?),
      mountCount: $checkedConvert('mount_count', (v) => (v as num?)?.toInt()),
      weaponSizes: $checkedConvert(
        'weapon_sizes',
        (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
      ),
      payloadSizes: $checkedConvert(
        'payload_sizes',
        (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
      ),
      payloadTypes: $checkedConvert(
        'payload_types',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      payloadClassNames: $checkedConvert(
        'payload_class_names',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      mounts: $checkedConvert(
        'mounts',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GameVehicleTurretMountsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      dpsTotal: $checkedConvert('dps_total', (v) => v as num?),
      sustainedDpsTotal: $checkedConvert(
        'sustained_dps_total',
        (v) => v as num?,
      ),
      alphaTotal: $checkedConvert('alpha_total', (v) => v as num?),
      isPilotSlaveable: $checkedConvert(
        'is_pilot_slaveable',
        (v) => v as bool?,
      ),
      weapons: $checkedConvert(
        'weapons',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GameVehicleTurretWeaponsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      version: $checkedConvert('version', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'displayName': 'display_name',
    'hardpointName': 'hardpoint_name',
    'partName': 'part_name',
    'turretType': 'turret_type',
    'className': 'class_name',
    'mountCount': 'mount_count',
    'weaponSizes': 'weapon_sizes',
    'payloadSizes': 'payload_sizes',
    'payloadTypes': 'payload_types',
    'payloadClassNames': 'payload_class_names',
    'dpsTotal': 'dps_total',
    'sustainedDpsTotal': 'sustained_dps_total',
    'alphaTotal': 'alpha_total',
    'isPilotSlaveable': 'is_pilot_slaveable',
  },
);

Map<String, dynamic> _$GameVehicleTurretToJson(GameVehicleTurret instance) =>
    <String, dynamic>{
      'category': ?instance.category,
      'display_name': ?instance.displayName,
      'hardpoint_name': ?instance.hardpointName,
      'part_name': ?instance.partName,
      'turret_type': ?instance.turretType,
      'class_name': ?instance.className,
      'size': ?instance.size,
      'turret': ?instance.turret,
      'gimballed': ?instance.gimballed,
      'fixed': ?instance.fixed,
      'mount_count': ?instance.mountCount,
      'weapon_sizes': ?instance.weaponSizes,
      'payload_sizes': ?instance.payloadSizes,
      'payload_types': ?instance.payloadTypes,
      'payload_class_names': ?instance.payloadClassNames,
      'mounts': ?instance.mounts?.map((e) => e.toJson()).toList(),
      'dps_total': ?instance.dpsTotal,
      'sustained_dps_total': ?instance.sustainedDpsTotal,
      'alpha_total': ?instance.alphaTotal,
      'is_pilot_slaveable': ?instance.isPilotSlaveable,
      'weapons': ?instance.weapons?.map((e) => e.toJson()).toList(),
      'version': ?instance.version,
    };
