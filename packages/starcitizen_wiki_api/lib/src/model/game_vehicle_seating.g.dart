// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_seating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleSeating _$GameVehicleSeatingFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GameVehicleSeating',
      json,
      ($checkedConvert) {
        final val = GameVehicleSeating(
          crewStations: $checkedConvert(
            'crew_stations',
            (v) => (v as num?)?.toInt(),
          ),
          ejectionSeats: $checkedConvert(
            'ejection_seats',
            (v) => (v as num?)?.toInt(),
          ),
          escapePods: $checkedConvert(
            'escape_pods',
            (v) => (v as num?)?.toInt(),
          ),
          jumpSeats: $checkedConvert('jump_seats', (v) => (v as num?)?.toInt()),
          beds: $checkedConvert('beds', (v) => (v as num?)?.toInt()),
          medicalBeds: $checkedConvert('medical_beds', (v) => v),
        );
        return val;
      },
      fieldKeyMap: const {
        'crewStations': 'crew_stations',
        'ejectionSeats': 'ejection_seats',
        'escapePods': 'escape_pods',
        'jumpSeats': 'jump_seats',
        'medicalBeds': 'medical_beds',
      },
    );

Map<String, dynamic> _$GameVehicleSeatingToJson(GameVehicleSeating instance) =>
    <String, dynamic>{
      'crew_stations': ?instance.crewStations,
      'ejection_seats': ?instance.ejectionSeats,
      'escape_pods': ?instance.escapePods,
      'jump_seats': ?instance.jumpSeats,
      'beds': ?instance.beds,
      'medical_beds': ?instance.medicalBeds,
    };
