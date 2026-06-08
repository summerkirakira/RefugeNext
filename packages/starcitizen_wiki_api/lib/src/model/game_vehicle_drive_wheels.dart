//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_drive_wheels.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleDriveWheels {
  /// Returns a new [GameVehicleDriveWheels] instance.
  GameVehicleDriveWheels({

     this.count,

     this.drivingCount,

     this.steeringCount,

     this.driveType,
  });

      /// Total number of wheels.
  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;



      /// Number of driven wheels.
  @JsonKey(
    
    name: r'driving_count',
    required: false,
    includeIfNull: false,
  )


  final int? drivingCount;



      /// Number of steered wheels.
  @JsonKey(
    
    name: r'steering_count',
    required: false,
    includeIfNull: false,
  )


  final int? steeringCount;



      /// Drive configuration (e.g. AWD, RWD, Unknown).
  @JsonKey(
    
    name: r'drive_type',
    required: false,
    includeIfNull: false,
  )


  final String? driveType;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleDriveWheels &&
      other.count == count &&
      other.drivingCount == drivingCount &&
      other.steeringCount == steeringCount &&
      other.driveType == driveType;

    @override
    int get hashCode =>
        (count == null ? 0 : count.hashCode) +
        (drivingCount == null ? 0 : drivingCount.hashCode) +
        (steeringCount == null ? 0 : steeringCount.hashCode) +
        (driveType == null ? 0 : driveType.hashCode);

  factory GameVehicleDriveWheels.fromJson(Map<String, dynamic> json) => _$GameVehicleDriveWheelsFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleDriveWheelsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

