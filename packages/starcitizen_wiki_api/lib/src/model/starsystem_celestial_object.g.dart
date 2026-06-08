// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starsystem_celestial_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarsystemCelestialObject _$StarsystemCelestialObjectFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'StarsystemCelestialObject',
  json,
  ($checkedConvert) {
    final val = StarsystemCelestialObject(
      celestialObject: $checkedConvert(
        'celestial_object',
        (v) => v == null
            ? null
            : StarsystemCelestialObjectCelestialObject.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'celestialObject': 'celestial_object'},
);

Map<String, dynamic> _$StarsystemCelestialObjectToJson(
  StarsystemCelestialObject instance,
) => <String, dynamic>{'celestial_object': ?instance.celestialObject?.toJson()};
