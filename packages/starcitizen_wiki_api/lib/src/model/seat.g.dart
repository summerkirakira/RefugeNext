// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seat _$SeatFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Seat',
  json,
  ($checkedConvert) {
    final val = Seat(
      seatType: $checkedConvert('seat_type', (v) => v as String?),
      yaw: $checkedConvert(
        'yaw',
        (v) => v == null ? null : SeatAxis.fromJson(v as Map<String, dynamic>),
      ),
      pitch: $checkedConvert(
        'pitch',
        (v) => v == null ? null : SeatAxis.fromJson(v as Map<String, dynamic>),
      ),
      setYawPitchLimits: $checkedConvert(
        'set_yaw_pitch_limits',
        (v) => v as bool?,
      ),
      hasEjection: $checkedConvert('has_ejection', (v) => v as bool?),
      ejection: $checkedConvert(
        'ejection',
        (v) =>
            v == null ? null : SeatEjection.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'seatType': 'seat_type',
    'setYawPitchLimits': 'set_yaw_pitch_limits',
    'hasEjection': 'has_ejection',
  },
);

Map<String, dynamic> _$SeatToJson(Seat instance) => <String, dynamic>{
  'seat_type': ?instance.seatType,
  'yaw': ?instance.yaw?.toJson(),
  'pitch': ?instance.pitch?.toJson(),
  'set_yaw_pitch_limits': ?instance.setYawPitchLimits,
  'has_ejection': ?instance.hasEjection,
  'ejection': ?instance.ejection?.toJson(),
};
