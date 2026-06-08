// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_index_hauling_summary_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionIndexHaulingSummaryInner _$MissionIndexHaulingSummaryInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionIndexHaulingSummaryInner',
  json,
  ($checkedConvert) {
    final val = MissionIndexHaulingSummaryInner(
      name: $checkedConvert('name', (v) => v as String?),
      minAmount: $checkedConvert('min_amount', (v) => (v as num?)?.toInt()),
      maxAmount: $checkedConvert('max_amount', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {'minAmount': 'min_amount', 'maxAmount': 'max_amount'},
);

Map<String, dynamic> _$MissionIndexHaulingSummaryInnerToJson(
  MissionIndexHaulingSummaryInner instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'min_amount': ?instance.minAmount,
  'max_amount': ?instance.maxAmount,
};
