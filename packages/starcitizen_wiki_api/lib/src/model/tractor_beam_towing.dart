//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'tractor_beam_towing.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TractorBeamTowing {
  /// Returns a new [TractorBeamTowing] instance.
  TractorBeamTowing({

     this.force,

     this.maxAcceleration,

     this.maxDistance,

     this.qtMassLimit,
  });

      /// Towing force.
  @JsonKey(
    
    name: r'force',
    required: false,
    includeIfNull: false,
  )


  final double? force;



      /// Maximum towing acceleration.
  @JsonKey(
    
    name: r'max_acceleration',
    required: false,
    includeIfNull: false,
  )


  final double? maxAcceleration;



      /// Maximum towing distance.
  @JsonKey(
    
    name: r'max_distance',
    required: false,
    includeIfNull: false,
  )


  final double? maxDistance;



      /// Quantum tow mass limit.
  @JsonKey(
    
    name: r'qt_mass_limit',
    required: false,
    includeIfNull: false,
  )


  final double? qtMassLimit;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TractorBeamTowing &&
      other.force == force &&
      other.maxAcceleration == maxAcceleration &&
      other.maxDistance == maxDistance &&
      other.qtMassLimit == qtMassLimit;

    @override
    int get hashCode =>
        (force == null ? 0 : force.hashCode) +
        (maxAcceleration == null ? 0 : maxAcceleration.hashCode) +
        (maxDistance == null ? 0 : maxDistance.hashCode) +
        (qtMassLimit == null ? 0 : qtMassLimit.hashCode);

  factory TractorBeamTowing.fromJson(Map<String, dynamic> json) => _$TractorBeamTowingFromJson(json);

  Map<String, dynamic> toJson() => _$TractorBeamTowingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

