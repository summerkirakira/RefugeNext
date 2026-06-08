//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'tractor_beam_force.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TractorBeamForce {
  /// Returns a new [TractorBeamForce] instance.
  TractorBeamForce({

     this.min,

     this.max,

     this.maxVolume,

     this.volumeForceCoefficient,
  });

      /// Minimum force output.
  @JsonKey(
    
    name: r'min',
    required: false,
    includeIfNull: false,
  )


  final double? min;



      /// Maximum force output.
  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final double? max;



      /// Maximum object volume the beam can handle (µSCU).
  @JsonKey(
    
    name: r'max_volume',
    required: false,
    includeIfNull: false,
  )


  final double? maxVolume;



      /// Force falloff based on target volume.
  @JsonKey(
    
    name: r'volume_force_coefficient',
    required: false,
    includeIfNull: false,
  )


  final double? volumeForceCoefficient;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TractorBeamForce &&
      other.min == min &&
      other.max == max &&
      other.maxVolume == maxVolume &&
      other.volumeForceCoefficient == volumeForceCoefficient;

    @override
    int get hashCode =>
        (min == null ? 0 : min.hashCode) +
        (max == null ? 0 : max.hashCode) +
        (maxVolume == null ? 0 : maxVolume.hashCode) +
        (volumeForceCoefficient == null ? 0 : volumeForceCoefficient.hashCode);

  factory TractorBeamForce.fromJson(Map<String, dynamic> json) => _$TractorBeamForceFromJson(json);

  Map<String, dynamic> toJson() => _$TractorBeamForceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

