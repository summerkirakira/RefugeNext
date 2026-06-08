// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_inventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemInventory _$ItemInventoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ItemInventory',
      json,
      ($checkedConvert) {
        final val = ItemInventory(
          uuid: $checkedConvert('uuid', (v) => v as String?),
          width: $checkedConvert('width', (v) => (v as num?)?.toDouble()),
          height: $checkedConvert('height', (v) => (v as num?)?.toDouble()),
          length: $checkedConvert('length', (v) => (v as num?)?.toDouble()),
          volume: $checkedConvert('volume', (v) => (v as num?)?.toDouble()),
          scu: $checkedConvert('scu', (v) => (v as num?)?.toDouble()),
          scuConverted: $checkedConvert(
            'scu_converted',
            (v) => (v as num?)?.toDouble(),
          ),
          unit: $checkedConvert('unit', (v) => v as String?),
          microScu: $checkedConvert(
            'micro_scu',
            (v) => (v as num?)?.toDouble(),
          ),
          open: $checkedConvert('open', (v) => v as bool?),
          external_: $checkedConvert('external', (v) => v as bool?),
          closed: $checkedConvert('closed', (v) => v as bool?),
          minSize: $checkedConvert(
            'min_size',
            (v) => v == null
                ? null
                : ItemInventoryMinSize.fromJson(v as Map<String, dynamic>),
          ),
          maxSize: $checkedConvert(
            'max_size',
            (v) => v == null
                ? null
                : ItemInventoryMaxSize.fromJson(v as Map<String, dynamic>),
          ),
          minScuBox: $checkedConvert('min_scu_box', (v) => v as num?),
          maxScuBox: $checkedConvert('max_scu_box', (v) => v as num?),
        );
        return val;
      },
      fieldKeyMap: const {
        'scuConverted': 'scu_converted',
        'microScu': 'micro_scu',
        'external_': 'external',
        'minSize': 'min_size',
        'maxSize': 'max_size',
        'minScuBox': 'min_scu_box',
        'maxScuBox': 'max_scu_box',
      },
    );

Map<String, dynamic> _$ItemInventoryToJson(ItemInventory instance) =>
    <String, dynamic>{
      'uuid': ?instance.uuid,
      'width': ?instance.width,
      'height': ?instance.height,
      'length': ?instance.length,
      'volume': ?instance.volume,
      'scu': ?instance.scu,
      'scu_converted': ?instance.scuConverted,
      'unit': ?instance.unit,
      'micro_scu': ?instance.microScu,
      'open': ?instance.open,
      'external': ?instance.external_,
      'closed': ?instance.closed,
      'min_size': ?instance.minSize?.toJson(),
      'max_size': ?instance.maxSize?.toJson(),
      'min_scu_box': ?instance.minScuBox,
      'max_scu_box': ?instance.maxScuBox,
    };
