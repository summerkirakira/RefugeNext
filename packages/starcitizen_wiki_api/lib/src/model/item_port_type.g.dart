// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_port_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemPortType _$ItemPortTypeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ItemPortType', json, ($checkedConvert) {
      final val = ItemPortType(
        type: $checkedConvert('type', (v) => v as String?),
        subTypes: $checkedConvert(
          'sub_types',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'subTypes': 'sub_types'});

Map<String, dynamic> _$ItemPortTypeToJson(ItemPortType instance) =>
    <String, dynamic>{'type': ?instance.type, 'sub_types': ?instance.subTypes};
