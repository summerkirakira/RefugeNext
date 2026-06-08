// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_armor_signal_multiplier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleArmorSignalMultiplier _$VehicleArmorSignalMultiplierFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'VehicleArmorSignalMultiplier',
  json,
  ($checkedConvert) {
    final val = VehicleArmorSignalMultiplier(
      crossSection: $checkedConvert(
        'cross_section',
        (v) => (v as num?)?.toDouble(),
      ),
      crossSectionChange: $checkedConvert(
        'cross_section_change',
        (v) => (v as num?)?.toDouble(),
      ),
      infrared: $checkedConvert('infrared', (v) => (v as num?)?.toDouble()),
      infraredChange: $checkedConvert(
        'infrared_change',
        (v) => (v as num?)?.toDouble(),
      ),
      electromagnetic: $checkedConvert(
        'electromagnetic',
        (v) => (v as num?)?.toDouble(),
      ),
      electromagneticChange: $checkedConvert(
        'electromagnetic_change',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'crossSection': 'cross_section',
    'crossSectionChange': 'cross_section_change',
    'infraredChange': 'infrared_change',
    'electromagneticChange': 'electromagnetic_change',
  },
);

Map<String, dynamic> _$VehicleArmorSignalMultiplierToJson(
  VehicleArmorSignalMultiplier instance,
) => <String, dynamic>{
  'cross_section': ?instance.crossSection,
  'cross_section_change': ?instance.crossSectionChange,
  'infrared': ?instance.infrared,
  'infrared_change': ?instance.infraredChange,
  'electromagnetic': ?instance.electromagnetic,
  'electromagnetic_change': ?instance.electromagneticChange,
};
