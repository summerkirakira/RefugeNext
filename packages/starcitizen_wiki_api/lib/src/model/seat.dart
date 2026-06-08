//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/seat_ejection.dart';
import 'package:starcitizen_wiki_api/src/model/seat_axis.dart';
import 'package:json_annotation/json_annotation.dart';

part 'seat.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Seat {
  /// Returns a new [Seat] instance.
  Seat({

     this.seatType,

     this.yaw,

     this.pitch,

     this.setYawPitchLimits,

     this.hasEjection,

     this.ejection,
  });

      /// Seat control type.
  @JsonKey(
    
    name: r'seat_type',
    required: false,
    includeIfNull: false,
  )


  final String? seatType;



      /// Yaw axis rotation limits.
  @JsonKey(
    
    name: r'yaw',
    required: false,
    includeIfNull: false,
  )


  final SeatAxis? yaw;



      /// Pitch axis rotation limits.
  @JsonKey(
    
    name: r'pitch',
    required: false,
    includeIfNull: false,
  )


  final SeatAxis? pitch;



      /// Whether yaw and pitch limits are enforced.
  @JsonKey(
    
    name: r'set_yaw_pitch_limits',
    required: false,
    includeIfNull: false,
  )


  final bool? setYawPitchLimits;



      /// Whether the seat has an ejection system.
  @JsonKey(
    
    name: r'has_ejection',
    required: false,
    includeIfNull: false,
  )


  final bool? hasEjection;



      /// Ejection system parameters.
  @JsonKey(
    
    name: r'ejection',
    required: false,
    includeIfNull: false,
  )


  final SeatEjection? ejection;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Seat &&
      other.seatType == seatType &&
      other.yaw == yaw &&
      other.pitch == pitch &&
      other.setYawPitchLimits == setYawPitchLimits &&
      other.hasEjection == hasEjection &&
      other.ejection == ejection;

    @override
    int get hashCode =>
        (seatType == null ? 0 : seatType.hashCode) +
        (yaw == null ? 0 : yaw.hashCode) +
        (pitch == null ? 0 : pitch.hashCode) +
        (setYawPitchLimits == null ? 0 : setYawPitchLimits.hashCode) +
        (hasEjection == null ? 0 : hasEjection.hashCode) +
        (ejection == null ? 0 : ejection.hashCode);

  factory Seat.fromJson(Map<String, dynamic> json) => _$SeatFromJson(json);

  Map<String, dynamic> toJson() => _$SeatToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

