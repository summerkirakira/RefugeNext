//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_speed.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleSpeed {
  /// Returns a new [GameVehicleSpeed] instance.
  GameVehicleSpeed({

     this.scm,

     this.max,

     this.boostForward,

     this.boostBackward,

     this.zeroToScm,

     this.zeroToMax,

     this.scmToZero,

     this.maxToZero,
  });

      /// Space Combat Maneuvering speed in m/s.
  @JsonKey(
    
    name: r'scm',
    required: false,
    includeIfNull: false,
  )


  final num? scm;



      /// Maximum speed in m/s.
  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final num? max;



      /// Forward boost speed in m/s.
  @JsonKey(
    
    name: r'boost_forward',
    required: false,
    includeIfNull: false,
  )


  final num? boostForward;



      /// Backward boost speed in m/s.
  @JsonKey(
    
    name: r'boost_backward',
    required: false,
    includeIfNull: false,
  )


  final num? boostBackward;



      /// Time from zero to SCM speed in seconds.
  @JsonKey(
    
    name: r'zero_to_scm',
    required: false,
    includeIfNull: false,
  )


  final num? zeroToScm;



      /// Time from zero to max speed in seconds.
  @JsonKey(
    
    name: r'zero_to_max',
    required: false,
    includeIfNull: false,
  )


  final num? zeroToMax;



      /// Time from SCM to zero in seconds.
  @JsonKey(
    
    name: r'scm_to_zero',
    required: false,
    includeIfNull: false,
  )


  final num? scmToZero;



      /// Time from max to zero in seconds.
  @JsonKey(
    
    name: r'max_to_zero',
    required: false,
    includeIfNull: false,
  )


  final num? maxToZero;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleSpeed &&
      other.scm == scm &&
      other.max == max &&
      other.boostForward == boostForward &&
      other.boostBackward == boostBackward &&
      other.zeroToScm == zeroToScm &&
      other.zeroToMax == zeroToMax &&
      other.scmToZero == scmToZero &&
      other.maxToZero == maxToZero;

    @override
    int get hashCode =>
        scm.hashCode +
        max.hashCode +
        (boostForward == null ? 0 : boostForward.hashCode) +
        (boostBackward == null ? 0 : boostBackward.hashCode) +
        (zeroToScm == null ? 0 : zeroToScm.hashCode) +
        (zeroToMax == null ? 0 : zeroToMax.hashCode) +
        (scmToZero == null ? 0 : scmToZero.hashCode) +
        (maxToZero == null ? 0 : maxToZero.hashCode);

  factory GameVehicleSpeed.fromJson(Map<String, dynamic> json) => _$GameVehicleSpeedFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleSpeedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

