//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ammunition_penetration.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AmmunitionPenetration {
  /// Returns a new [AmmunitionPenetration] instance.
  AmmunitionPenetration({

     this.baseDistance,

     this.nearRadius,

     this.farRadius,

     this.angle,
  });

      /// Base penetration distance.
  @JsonKey(
    
    name: r'base_distance',
    required: false,
    includeIfNull: false,
  )


  final double? baseDistance;



      /// Near radius for penetration falloff.
  @JsonKey(
    
    name: r'near_radius',
    required: false,
    includeIfNull: false,
  )


  final double? nearRadius;



      /// Far radius for penetration falloff.
  @JsonKey(
    
    name: r'far_radius',
    required: false,
    includeIfNull: false,
  )


  final double? farRadius;



      /// Maximum impact angle (degrees) before ricochet/stop.
  @JsonKey(
    
    name: r'angle',
    required: false,
    includeIfNull: false,
  )


  final double? angle;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AmmunitionPenetration &&
      other.baseDistance == baseDistance &&
      other.nearRadius == nearRadius &&
      other.farRadius == farRadius &&
      other.angle == angle;

    @override
    int get hashCode =>
        (baseDistance == null ? 0 : baseDistance.hashCode) +
        (nearRadius == null ? 0 : nearRadius.hashCode) +
        (farRadius == null ? 0 : farRadius.hashCode) +
        (angle == null ? 0 : angle.hashCode);

  factory AmmunitionPenetration.fromJson(Map<String, dynamic> json) => _$AmmunitionPenetrationFromJson(json);

  Map<String, dynamic> toJson() => _$AmmunitionPenetrationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

