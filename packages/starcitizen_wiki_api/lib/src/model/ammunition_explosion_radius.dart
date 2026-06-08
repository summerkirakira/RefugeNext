//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ammunition_explosion_radius.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AmmunitionExplosionRadius {
  /// Returns a new [AmmunitionExplosionRadius] instance.
  AmmunitionExplosionRadius({

     this.min,

     this.max,
  });

      /// Minimum explosion radius (meters).
  @JsonKey(
    
    name: r'min',
    required: false,
    includeIfNull: false,
  )


  final double? min;



      /// Maximum explosion radius (meters).
  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final double? max;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AmmunitionExplosionRadius &&
      other.min == min &&
      other.max == max;

    @override
    int get hashCode =>
        (min == null ? 0 : min.hashCode) +
        (max == null ? 0 : max.hashCode);

  factory AmmunitionExplosionRadius.fromJson(Map<String, dynamic> json) => _$AmmunitionExplosionRadiusFromJson(json);

  Map<String, dynamic> toJson() => _$AmmunitionExplosionRadiusToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

