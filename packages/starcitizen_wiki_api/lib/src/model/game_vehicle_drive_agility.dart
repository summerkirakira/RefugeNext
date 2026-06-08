//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_drive_agility.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleDriveAgility {
  /// Returns a new [GameVehicleDriveAgility] instance.
  GameVehicleDriveAgility({

     this.handling,

     this.grip,

     this.acceleration,
  });

      /// Handling score (0-1).
  @JsonKey(
    
    name: r'handling',
    required: false,
    includeIfNull: false,
  )


  final num? handling;



      /// Grip score (0-1).
  @JsonKey(
    
    name: r'grip',
    required: false,
    includeIfNull: false,
  )


  final num? grip;



      /// Acceleration score (0-1).
  @JsonKey(
    
    name: r'acceleration',
    required: false,
    includeIfNull: false,
  )


  final num? acceleration;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleDriveAgility &&
      other.handling == handling &&
      other.grip == grip &&
      other.acceleration == acceleration;

    @override
    int get hashCode =>
        (handling == null ? 0 : handling.hashCode) +
        (grip == null ? 0 : grip.hashCode) +
        (acceleration == null ? 0 : acceleration.hashCode);

  factory GameVehicleDriveAgility.fromJson(Map<String, dynamic> json) => _$GameVehicleDriveAgilityFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleDriveAgilityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

