// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cooler _$CoolerFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Cooler',
  json,
  ($checkedConvert) {
    final val = Cooler(
      coolingRate: $checkedConvert(
        'cooling_rate',
        (v) => (v as num?)?.toDouble(),
      ),
      suppressionIrFactor: $checkedConvert(
        'suppression_ir_factor',
        (v) => (v as num?)?.toDouble(),
      ),
      suppressionHeatFactor: $checkedConvert(
        'suppression_heat_factor',
        (v) => (v as num?)?.toDouble(),
      ),
      coolantSegmentGeneration: $checkedConvert(
        'coolant_segment_generation',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'coolingRate': 'cooling_rate',
    'suppressionIrFactor': 'suppression_ir_factor',
    'suppressionHeatFactor': 'suppression_heat_factor',
    'coolantSegmentGeneration': 'coolant_segment_generation',
  },
);

Map<String, dynamic> _$CoolerToJson(Cooler instance) => <String, dynamic>{
  'cooling_rate': ?instance.coolingRate,
  'suppression_ir_factor': ?instance.suppressionIrFactor,
  'suppression_heat_factor': ?instance.suppressionHeatFactor,
  'coolant_segment_generation': ?instance.coolantSegmentGeneration,
};
