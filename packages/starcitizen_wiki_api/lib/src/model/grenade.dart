//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/grenade_aoe.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grenade.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Grenade {
  /// Returns a new [Grenade] instance.
  Grenade({

     this.damageType,

     this.damage,

     this.aoe,

     this.areaOfEffect,
  });

      /// Damage type reported by the grenade payload.
  @JsonKey(
    
    name: r'damage_type',
    required: false,
    includeIfNull: false,
  )


  final String? damageType;



      /// Damage value used by the grenade payload.
  @JsonKey(
    
    name: r'damage',
    required: false,
    includeIfNull: false,
  )


  final double? damage;



  @JsonKey(
    
    name: r'aoe',
    required: false,
    includeIfNull: false,
  )


  final GrenadeAoe? aoe;



      /// Deprecated. Use `aoe.maximum`.
  @Deprecated('areaOfEffect has been deprecated')
  @JsonKey(
    
    name: r'area_of_effect',
    required: false,
    includeIfNull: false,
  )


  final double? areaOfEffect;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Grenade &&
      other.damageType == damageType &&
      other.damage == damage &&
      other.aoe == aoe &&
      other.areaOfEffect == areaOfEffect;

    @override
    int get hashCode =>
        (damageType == null ? 0 : damageType.hashCode) +
        (damage == null ? 0 : damage.hashCode) +
        aoe.hashCode +
        (areaOfEffect == null ? 0 : areaOfEffect.hashCode);

  factory Grenade.fromJson(Map<String, dynamic> json) => _$GrenadeFromJson(json);

  Map<String, dynamic> toJson() => _$GrenadeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

