// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starsystem_jumppoints_jumppoints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarsystemJumppointsJumppoints _$StarsystemJumppointsJumppointsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('StarsystemJumppointsJumppoints', json, ($checkedConvert) {
  final val = StarsystemJumppointsJumppoints(
    data: $checkedConvert(
      'data',
      (v) => v == null ? null : Jumppoint.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$StarsystemJumppointsJumppointsToJson(
  StarsystemJumppointsJumppoints instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
