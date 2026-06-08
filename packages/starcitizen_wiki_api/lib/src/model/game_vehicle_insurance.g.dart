// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_insurance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleInsurance _$GameVehicleInsuranceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleInsurance',
  json,
  ($checkedConvert) {
    final val = GameVehicleInsurance(
      claimTime: $checkedConvert('claim_time', (v) => v as num?),
      expediteTime: $checkedConvert('expedite_time', (v) => v as num?),
      expediteCost: $checkedConvert('expedite_cost', (v) => v as num?),
    );
    return val;
  },
  fieldKeyMap: const {
    'claimTime': 'claim_time',
    'expediteTime': 'expedite_time',
    'expediteCost': 'expedite_cost',
  },
);

Map<String, dynamic> _$GameVehicleInsuranceToJson(
  GameVehicleInsurance instance,
) => <String, dynamic>{
  'claim_time': ?instance.claimTime,
  'expedite_time': ?instance.expediteTime,
  'expedite_cost': ?instance.expediteCost,
};
