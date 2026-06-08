//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/tractor_beam_towing.dart';
import 'package:starcitizen_wiki_api/src/model/tractor_beam_range.dart';
import 'package:starcitizen_wiki_api/src/model/tractor_beam_cargo_mode_override.dart';
import 'package:starcitizen_wiki_api/src/model/tractor_beam_force.dart';
import 'package:starcitizen_wiki_api/src/model/tractor_beam_tether.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tractor_beam.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TractorBeam {
  /// Returns a new [TractorBeam] instance.
  TractorBeam({

     this.force,

     this.range,

     this.tether,

     this.cargoModeOverride,

     this.towing,

     this.minForce,

     this.maxForce,

     this.minDistance,

     this.maxDistance,

     this.fullStrengthDistance,

     this.maxAngle,

     this.maxVolume,

     this.volumeForceCoefficient,

     this.tetherBreakTime,

     this.safeRangeValueFactor,
  });

  @JsonKey(
    
    name: r'force',
    required: false,
    includeIfNull: false,
  )


  final TractorBeamForce? force;



  @JsonKey(
    
    name: r'range',
    required: false,
    includeIfNull: false,
  )


  final TractorBeamRange? range;



  @JsonKey(
    
    name: r'tether',
    required: false,
    includeIfNull: false,
  )


  final TractorBeamTether? tether;



  @JsonKey(
    
    name: r'cargo_mode_override',
    required: false,
    includeIfNull: false,
  )


  final TractorBeamCargoModeOverride? cargoModeOverride;



  @JsonKey(
    
    name: r'towing',
    required: false,
    includeIfNull: false,
  )


  final TractorBeamTowing? towing;



      /// Deprecated. Use `force.min`.
  @Deprecated('minForce has been deprecated')
  @JsonKey(
    
    name: r'min_force',
    required: false,
    includeIfNull: false,
  )


  final double? minForce;



      /// Deprecated. Use `force.max`.
  @Deprecated('maxForce has been deprecated')
  @JsonKey(
    
    name: r'max_force',
    required: false,
    includeIfNull: false,
  )


  final double? maxForce;



      /// Deprecated. Use `range.min`.
  @Deprecated('minDistance has been deprecated')
  @JsonKey(
    
    name: r'min_distance',
    required: false,
    includeIfNull: false,
  )


  final double? minDistance;



      /// Deprecated. Use `range.max`.
  @Deprecated('maxDistance has been deprecated')
  @JsonKey(
    
    name: r'max_distance',
    required: false,
    includeIfNull: false,
  )


  final double? maxDistance;



      /// Deprecated. Use `range.full_strength_distance`.
  @Deprecated('fullStrengthDistance has been deprecated')
  @JsonKey(
    
    name: r'full_strength_distance',
    required: false,
    includeIfNull: false,
  )


  final double? fullStrengthDistance;



      /// Deprecated. Use `range.max_angle`.
  @Deprecated('maxAngle has been deprecated')
  @JsonKey(
    
    name: r'max_angle',
    required: false,
    includeIfNull: false,
  )


  final double? maxAngle;



      /// Deprecated. Use `force.max_volume`.
  @Deprecated('maxVolume has been deprecated')
  @JsonKey(
    
    name: r'max_volume',
    required: false,
    includeIfNull: false,
  )


  final double? maxVolume;



      /// Deprecated. Use `force.volume_force_coefficient`.
  @Deprecated('volumeForceCoefficient has been deprecated')
  @JsonKey(
    
    name: r'volume_force_coefficient',
    required: false,
    includeIfNull: false,
  )


  final double? volumeForceCoefficient;



      /// Deprecated. Use `tether.tether_break_time`.
  @Deprecated('tetherBreakTime has been deprecated')
  @JsonKey(
    
    name: r'tether_break_time',
    required: false,
    includeIfNull: false,
  )


  final double? tetherBreakTime;



      /// Deprecated. Use `tether.safe_range_value_factor`.
  @Deprecated('safeRangeValueFactor has been deprecated')
  @JsonKey(
    
    name: r'safe_range_value_factor',
    required: false,
    includeIfNull: false,
  )


  final double? safeRangeValueFactor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TractorBeam &&
      other.force == force &&
      other.range == range &&
      other.tether == tether &&
      other.cargoModeOverride == cargoModeOverride &&
      other.towing == towing &&
      other.minForce == minForce &&
      other.maxForce == maxForce &&
      other.minDistance == minDistance &&
      other.maxDistance == maxDistance &&
      other.fullStrengthDistance == fullStrengthDistance &&
      other.maxAngle == maxAngle &&
      other.maxVolume == maxVolume &&
      other.volumeForceCoefficient == volumeForceCoefficient &&
      other.tetherBreakTime == tetherBreakTime &&
      other.safeRangeValueFactor == safeRangeValueFactor;

    @override
    int get hashCode =>
        (force == null ? 0 : force.hashCode) +
        (range == null ? 0 : range.hashCode) +
        (tether == null ? 0 : tether.hashCode) +
        (cargoModeOverride == null ? 0 : cargoModeOverride.hashCode) +
        (towing == null ? 0 : towing.hashCode) +
        (minForce == null ? 0 : minForce.hashCode) +
        (maxForce == null ? 0 : maxForce.hashCode) +
        (minDistance == null ? 0 : minDistance.hashCode) +
        (maxDistance == null ? 0 : maxDistance.hashCode) +
        (fullStrengthDistance == null ? 0 : fullStrengthDistance.hashCode) +
        (maxAngle == null ? 0 : maxAngle.hashCode) +
        (maxVolume == null ? 0 : maxVolume.hashCode) +
        (volumeForceCoefficient == null ? 0 : volumeForceCoefficient.hashCode) +
        (tetherBreakTime == null ? 0 : tetherBreakTime.hashCode) +
        (safeRangeValueFactor == null ? 0 : safeRangeValueFactor.hashCode);

  factory TractorBeam.fromJson(Map<String, dynamic> json) => _$TractorBeamFromJson(json);

  Map<String, dynamic> toJson() => _$TractorBeamToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

