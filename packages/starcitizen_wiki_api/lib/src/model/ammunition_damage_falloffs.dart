//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/ammunition_damage_falloff.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ammunition_damage_falloffs.g.dart';


@Deprecated('AmmunitionDamageFalloffs has been deprecated')
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AmmunitionDamageFalloffs {
  /// Returns a new [AmmunitionDamageFalloffs] instance.
  AmmunitionDamageFalloffs({

     this.minDistance,

     this.perMeter,

     this.minDamage,
  });

  @Deprecated('minDistance has been deprecated')
  @JsonKey(
    
    name: r'min_distance',
    required: false,
    includeIfNull: false,
  )


  final AmmunitionDamageFalloff? minDistance;



  @Deprecated('perMeter has been deprecated')
  @JsonKey(
    
    name: r'per_meter',
    required: false,
    includeIfNull: false,
  )


  final AmmunitionDamageFalloff? perMeter;



  @Deprecated('minDamage has been deprecated')
  @JsonKey(
    
    name: r'min_damage',
    required: false,
    includeIfNull: false,
  )


  final AmmunitionDamageFalloff? minDamage;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AmmunitionDamageFalloffs &&
      other.minDistance == minDistance &&
      other.perMeter == perMeter &&
      other.minDamage == minDamage;

    @override
    int get hashCode =>
        (minDistance == null ? 0 : minDistance.hashCode) +
        (perMeter == null ? 0 : perMeter.hashCode) +
        (minDamage == null ? 0 : minDamage.hashCode);

  factory AmmunitionDamageFalloffs.fromJson(Map<String, dynamic> json) => _$AmmunitionDamageFalloffsFromJson(json);

  Map<String, dynamic> toJson() => _$AmmunitionDamageFalloffsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

