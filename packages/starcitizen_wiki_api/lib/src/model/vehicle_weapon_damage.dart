//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_damage_types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_weapon_damage.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleWeaponDamage {
  /// Returns a new [VehicleWeaponDamage] instance.
  VehicleWeaponDamage({

     this.sustained60s,

     this.burst,

     this.alphaTotal,

     this.max,

     this.maximum,

     this.alpha,
  });

      /// Sustained damage over 60 seconds.
  @JsonKey(
    
    name: r'sustained_60s',
    required: false,
    includeIfNull: false,
  )


  final double? sustained60s;



      /// Burst damage.
  @JsonKey(
    
    name: r'burst',
    required: false,
    includeIfNull: false,
  )


  final double? burst;



      /// Total alpha damage per shot.
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
    
    name: r'alpha',
    required: false,
    includeIfNull: false,
  )


  final VehicleWeaponDamageTypes? alpha;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleWeaponDamage &&
      other.sustained60s == sustained60s &&
      other.burst == burst &&
      other.alphaTotal == alphaTotal &&
      other.max == max &&
      other.maximum == maximum &&
      other.alpha == alpha;

    @override
    int get hashCode =>
        (sustained60s == null ? 0 : sustained60s.hashCode) +
        (burst == null ? 0 : burst.hashCode) +
        (alphaTotal == null ? 0 : alphaTotal.hashCode) +
        (max == null ? 0 : max.hashCode) +
        (maximum == null ? 0 : maximum.hashCode) +
        (alpha == null ? 0 : alpha.hashCode);

  factory VehicleWeaponDamage.fromJson(Map<String, dynamic> json) => _$VehicleWeaponDamageFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleWeaponDamageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

