//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_drive_agility.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_drive_wheels.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_drive.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleDrive {
  /// Returns a new [GameVehicleDrive] instance.
  GameVehicleDrive({

     this.maxSpeedKph,

     this.maxSpeedMs,

     this.reverseSpeedKph,

     this.reverseSpeedMs,

     this.isTracked,

     this.wheels,

     this.agility,
  });

      /// Maximum speed in km/h.
  @JsonKey(
    
    name: r'max_speed_kph',
    required: false,
    includeIfNull: false,
  )


  final num? maxSpeedKph;



      /// Maximum speed in m/s.
  @JsonKey(
    
    name: r'max_speed_ms',
    required: false,
    includeIfNull: false,
  )


  final num? maxSpeedMs;



      /// Reverse speed in km/h.
  @JsonKey(
    
    name: r'reverse_speed_kph',
    required: false,
    includeIfNull: false,
  )


  final num? reverseSpeedKph;



      /// Reverse speed in m/s.
  @JsonKey(
    
    name: r'reverse_speed_ms',
    required: false,
    includeIfNull: false,
  )


  final num? reverseSpeedMs;



      /// Whether the vehicle uses tracks instead of wheels.
  @JsonKey(
    
    name: r'is_tracked',
    required: false,
    includeIfNull: false,
  )


  final bool? isTracked;



  @JsonKey(
    
    name: r'wheels',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleDriveWheels? wheels;



  @JsonKey(
    
    name: r'agility',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleDriveAgility? agility;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleDrive &&
      other.maxSpeedKph == maxSpeedKph &&
      other.maxSpeedMs == maxSpeedMs &&
      other.reverseSpeedKph == reverseSpeedKph &&
      other.reverseSpeedMs == reverseSpeedMs &&
      other.isTracked == isTracked &&
      other.wheels == wheels &&
      other.agility == agility;

    @override
    int get hashCode =>
        (maxSpeedKph == null ? 0 : maxSpeedKph.hashCode) +
        (maxSpeedMs == null ? 0 : maxSpeedMs.hashCode) +
        (reverseSpeedKph == null ? 0 : reverseSpeedKph.hashCode) +
        (reverseSpeedMs == null ? 0 : reverseSpeedMs.hashCode) +
        (isTracked == null ? 0 : isTracked.hashCode) +
        (wheels == null ? 0 : wheels.hashCode) +
        (agility == null ? 0 : agility.hashCode);

  factory GameVehicleDrive.fromJson(Map<String, dynamic> json) => _$GameVehicleDriveFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleDriveToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

