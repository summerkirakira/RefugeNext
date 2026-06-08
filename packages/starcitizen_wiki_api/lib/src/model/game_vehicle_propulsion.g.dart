// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_propulsion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehiclePropulsion _$GameVehiclePropulsionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehiclePropulsion',
  json,
  ($checkedConvert) {
    final val = GameVehiclePropulsion(
      thrusters: $checkedConvert(
        'thrusters',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GameVehiclePropulsionThrustersInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      thrustCapacity: $checkedConvert(
        'thrust_capacity',
        (v) => v == null
            ? null
            : GameVehiclePropulsionThrustCapacity.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'thrustCapacity': 'thrust_capacity'},
);

Map<String, dynamic> _$GameVehiclePropulsionToJson(
  GameVehiclePropulsion instance,
) => <String, dynamic>{
  'thrusters': ?instance.thrusters?.map((e) => e.toJson()).toList(),
  'thrust_capacity': ?instance.thrustCapacity?.toJson(),
};
