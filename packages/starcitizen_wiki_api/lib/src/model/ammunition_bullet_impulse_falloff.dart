//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ammunition_bullet_impulse_falloff.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AmmunitionBulletImpulseFalloff {
  /// Returns a new [AmmunitionBulletImpulseFalloff] instance.
  AmmunitionBulletImpulseFalloff({

     this.minDistance,

     this.dropFalloff,

     this.maxFalloff,
  });

      /// Distance in meters before impulse falloff begins.
  @JsonKey(
    
    name: r'min_distance',
    required: false,
    includeIfNull: false,
  )


  final double? minDistance;



      /// Impulse reduction rate per meter after min distance.
  @JsonKey(
    
    name: r'drop_falloff',
    required: false,
    includeIfNull: false,
  )


  final double? dropFalloff;



      /// Maximum impulse reduction fraction (0-1).
  @JsonKey(
    
    name: r'max_falloff',
    required: false,
    includeIfNull: false,
  )


  final double? maxFalloff;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AmmunitionBulletImpulseFalloff &&
      other.minDistance == minDistance &&
      other.dropFalloff == dropFalloff &&
      other.maxFalloff == maxFalloff;

    @override
    int get hashCode =>
        (minDistance == null ? 0 : minDistance.hashCode) +
        (dropFalloff == null ? 0 : dropFalloff.hashCode) +
        (maxFalloff == null ? 0 : maxFalloff.hashCode);

  factory AmmunitionBulletImpulseFalloff.fromJson(Map<String, dynamic> json) => _$AmmunitionBulletImpulseFalloffFromJson(json);

  Map<String, dynamic> toJson() => _$AmmunitionBulletImpulseFalloffToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

