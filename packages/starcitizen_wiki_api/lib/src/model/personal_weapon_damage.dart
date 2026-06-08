//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/personal_weapon_damage_vector.dart';
import 'package:json_annotation/json_annotation.dart';

part 'personal_weapon_damage.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PersonalWeaponDamage {
  /// Returns a new [PersonalWeaponDamage] instance.
  PersonalWeaponDamage({

     this.dpsTotal,

     this.alphaTotal,

     this.max,

     this.maximum,

     this.dps,

     this.alpha,
  });

      /// Total damage per second across all types.
  @JsonKey(
    
    name: r'dps_total',
    required: false,
    includeIfNull: false,
  )


  final double? dpsTotal;



      /// Total damage per shot across all types.
  @JsonKey(
    
    name: r'alpha_total',
    required: false,
    includeIfNull: false,
  )


  final double? alphaTotal;



      /// Maximum damage per magazine.
  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final double? max;



      /// Deprecated: Use max.
  @Deprecated('maximum has been deprecated')
  @JsonKey(
    
    name: r'maximum',
    required: false,
    includeIfNull: false,
  )


  final double? maximum;



  @JsonKey(
    
    name: r'dps',
    required: false,
    includeIfNull: false,
  )


  final PersonalWeaponDamageVector? dps;



  @JsonKey(
    
    name: r'alpha',
    required: false,
    includeIfNull: false,
  )


  final PersonalWeaponDamageVector? alpha;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PersonalWeaponDamage &&
      other.dpsTotal == dpsTotal &&
      other.alphaTotal == alphaTotal &&
      other.max == max &&
      other.maximum == maximum &&
      other.dps == dps &&
      other.alpha == alpha;

    @override
    int get hashCode =>
        (dpsTotal == null ? 0 : dpsTotal.hashCode) +
        (alphaTotal == null ? 0 : alphaTotal.hashCode) +
        (max == null ? 0 : max.hashCode) +
        (maximum == null ? 0 : maximum.hashCode) +
        (dps == null ? 0 : dps.hashCode) +
        (alpha == null ? 0 : alpha.hashCode);

  factory PersonalWeaponDamage.fromJson(Map<String, dynamic> json) => _$PersonalWeaponDamageFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalWeaponDamageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

