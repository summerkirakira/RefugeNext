// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_port.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehiclePort _$GameVehiclePortFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehiclePort',
  json,
  ($checkedConvert) {
    final val = GameVehiclePort(
      name: $checkedConvert('name', (v) => v as String?),
      position: $checkedConvert('position', (v) => v as String?),
      sizes: $checkedConvert(
        'sizes',
        (v) => v == null
            ? null
            : GameVehiclePortSizes.fromJson(v as Map<String, dynamic>),
      ),
      className: $checkedConvert('class_name', (v) => v as String?),
      health: $checkedConvert('health', (v) => v as num?),
      editable: $checkedConvert('editable', (v) => v as bool?),
      editableChildren: $checkedConvert('editable_children', (v) => v as bool?),
      equippedItemUuid: $checkedConvert(
        'equipped_item_uuid',
        (v) => v as String?,
      ),
      type: $checkedConvert('type', (v) => v as String?),
      subType: $checkedConvert('sub_type', (v) => v as String?),
      subtype: $checkedConvert('subtype', (v) => v as String?),
      categoryLabel: $checkedConvert('category_label', (v) => v as String?),
      compatibleTypes: $checkedConvert(
        'compatible_types',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GameVehiclePortCompatibleTypesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      equippedItem: $checkedConvert(
        'equipped_item',
        (v) => v == null
            ? null
            : GameVehiclePortEquippedItem.fromJson(v as Map<String, dynamic>),
      ),
      ports: $checkedConvert(
        'ports',
        (v) => (v as List<dynamic>?)
            ?.map((e) => GameVehiclePort.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      requiredTags: $checkedConvert(
        'required_tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      portTags: $checkedConvert(
        'port_tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      version: $checkedConvert('version', (v) => v as String?),
      attachedVehicle: $checkedConvert(
        'attached_vehicle',
        (v) => v == null
            ? null
            : GameVehiclePortAttachedVehicle.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'className': 'class_name',
    'editableChildren': 'editable_children',
    'equippedItemUuid': 'equipped_item_uuid',
    'subType': 'sub_type',
    'categoryLabel': 'category_label',
    'compatibleTypes': 'compatible_types',
    'equippedItem': 'equipped_item',
    'requiredTags': 'required_tags',
    'portTags': 'port_tags',
    'attachedVehicle': 'attached_vehicle',
  },
);

Map<String, dynamic> _$GameVehiclePortToJson(GameVehiclePort instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'position': ?instance.position,
      'sizes': ?instance.sizes?.toJson(),
      'class_name': ?instance.className,
      'health': ?instance.health,
      'editable': ?instance.editable,
      'editable_children': ?instance.editableChildren,
      'equipped_item_uuid': ?instance.equippedItemUuid,
      'type': ?instance.type,
      'sub_type': ?instance.subType,
      'subtype': ?instance.subtype,
      'category_label': ?instance.categoryLabel,
      'compatible_types': ?instance.compatibleTypes
          ?.map((e) => e.toJson())
          .toList(),
      'equipped_item': ?instance.equippedItem?.toJson(),
      'ports': ?instance.ports?.map((e) => e.toJson()).toList(),
      'required_tags': ?instance.requiredTags,
      'port_tags': ?instance.portTags,
      'version': ?instance.version,
      'attached_vehicle': ?instance.attachedVehicle?.toJson(),
    };
