// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_hauling_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionHaulingOrder _$MissionHaulingOrderFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionHaulingOrder',
  json,
  ($checkedConvert) {
    final val = MissionHaulingOrder(
      kind: $checkedConvert('kind', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      uuid: $checkedConvert('uuid', (v) => v as String?),
      items: $checkedConvert(
        'items',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  MissionHaulingOrderItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      maxScu: $checkedConvert('max_scu', (v) => (v as num?)?.toInt()),
      minScu: $checkedConvert('min_scu', (v) => (v as num?)?.toInt()),
      maxAmount: $checkedConvert('max_amount', (v) => (v as num?)?.toInt()),
      minAmount: $checkedConvert('min_amount', (v) => (v as num?)?.toInt()),
      maxContainerSize: $checkedConvert(
        'max_container_size',
        (v) => (v as num?)?.toInt(),
      ),
      link: $checkedConvert('link', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      orOptions: $checkedConvert(
        'or_options',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => (e as List<dynamic>)
                  .map(
                    (e) =>
                        MissionHaulingOrder.fromJson(e as Map<String, dynamic>),
                  )
                  .toList(),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'maxScu': 'max_scu',
    'minScu': 'min_scu',
    'maxAmount': 'max_amount',
    'minAmount': 'min_amount',
    'maxContainerSize': 'max_container_size',
    'webUrl': 'web_url',
    'orOptions': 'or_options',
  },
);

Map<String, dynamic> _$MissionHaulingOrderToJson(
  MissionHaulingOrder instance,
) => <String, dynamic>{
  'kind': ?instance.kind,
  'name': ?instance.name,
  'uuid': ?instance.uuid,
  'items': ?instance.items?.map((e) => e.toJson()).toList(),
  'max_scu': ?instance.maxScu,
  'min_scu': ?instance.minScu,
  'max_amount': ?instance.maxAmount,
  'min_amount': ?instance.minAmount,
  'max_container_size': ?instance.maxContainerSize,
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
  'or_options': ?instance.orOptions
      ?.map((e) => e.map((e) => e.toJson()).toList())
      .toList(),
};
