// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radiation_resistance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadiationResistance _$RadiationResistanceFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RadiationResistance',
      json,
      ($checkedConvert) {
        final val = RadiationResistance(
          maximumRadiationCapacity: $checkedConvert(
            'maximum_radiation_capacity',
            (v) => (v as num?)?.toDouble(),
          ),
          radiationDissipationRate: $checkedConvert(
            'radiation_dissipation_rate',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'maximumRadiationCapacity': 'maximum_radiation_capacity',
        'radiationDissipationRate': 'radiation_dissipation_rate',
      },
    );

Map<String, dynamic> _$RadiationResistanceToJson(
  RadiationResistance instance,
) => <String, dynamic>{
  'maximum_radiation_capacity': ?instance.maximumRadiationCapacity,
  'radiation_dissipation_rate': ?instance.radiationDissipationRate,
};
