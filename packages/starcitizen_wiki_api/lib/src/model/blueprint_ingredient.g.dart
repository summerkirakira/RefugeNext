// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintIngredient _$BlueprintIngredientFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BlueprintIngredient',
      json,
      ($checkedConvert) {
        final val = BlueprintIngredient(
          name: $checkedConvert('name', (v) => v as String?),
          kind: $checkedConvert(
            'kind',
            (v) => $enumDecodeNullable(_$BlueprintIngredientKindEnumEnumMap, v),
          ),
          resourceTypeUuid: $checkedConvert(
            'resource_type_uuid',
            (v) => v as String?,
          ),
          itemUuid: $checkedConvert('item_uuid', (v) => v as String?),
          quantityScu: $checkedConvert(
            'quantity_scu',
            (v) => (v as num?)?.toDouble(),
          ),
          quantity: $checkedConvert('quantity', (v) => (v as num?)?.toDouble()),
          link: $checkedConvert('link', (v) => v as String?),
          webUrl: $checkedConvert('web_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'resourceTypeUuid': 'resource_type_uuid',
        'itemUuid': 'item_uuid',
        'quantityScu': 'quantity_scu',
        'webUrl': 'web_url',
      },
    );

Map<String, dynamic> _$BlueprintIngredientToJson(
  BlueprintIngredient instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'kind': ?_$BlueprintIngredientKindEnumEnumMap[instance.kind],
  'resource_type_uuid': ?instance.resourceTypeUuid,
  'item_uuid': ?instance.itemUuid,
  'quantity_scu': ?instance.quantityScu,
  'quantity': ?instance.quantity,
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
};

const _$BlueprintIngredientKindEnumEnumMap = {
  BlueprintIngredientKindEnum.resource: 'resource',
  BlueprintIngredientKindEnum.item: 'item',
};
