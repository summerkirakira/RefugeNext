// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starsystem_jumppoints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarsystemJumppoints _$StarsystemJumppointsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('StarsystemJumppoints', json, ($checkedConvert) {
  final val = StarsystemJumppoints(
    jumppoints: $checkedConvert(
      'jumppoints',
      (v) => v == null
          ? null
          : StarsystemJumppointsJumppoints.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$StarsystemJumppointsToJson(
  StarsystemJumppoints instance,
) => <String, dynamic>{'jumppoints': ?instance.jumppoints?.toJson()};
