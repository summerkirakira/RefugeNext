//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_weapon_spread.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleWeaponSpread {
  /// Returns a new [VehicleWeaponSpread] instance.
  VehicleWeaponSpread({

     this.min,

     this.max,

     this.minimum,

     this.maximum,

     this.firstAttack,

     this.perAttack,

     this.decay,
  });

      /// Minimum spread angle.
  @JsonKey(
    
    name: r'min',
    required: false,
    includeIfNull: false,
  )


  final double? min;



      /// Maximum spread angle.
  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final double? max;



      /// Deprecated: Use min.
  @Deprecated('minimum has been deprecated')
  @JsonKey(
    
    name: r'minimum',
    required: false,
    includeIfNull: false,
  )


  final double? minimum;



      /// Deprecated: Use max.
  @Deprecated('maximum has been deprecated')
  @JsonKey(
    
    name: r'maximum',
    required: false,
    includeIfNull: false,
  )


  final double? maximum;



      /// Spread added on the first shot.
  @JsonKey(
    
    name: r'first_attack',
    required: false,
    includeIfNull: false,
  )


  final double? firstAttack;



      /// Spread added per subsequent shot.
  @JsonKey(
    
    name: r'per_attack',
    required: false,
    includeIfNull: false,
  )


  final double? perAttack;



      /// Rate at which spread recovers between shots.
  @JsonKey(
    
    name: r'decay',
    required: false,
    includeIfNull: false,
  )


  final double? decay;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleWeaponSpread &&
      other.min == min &&
      other.max == max &&
      other.minimum == minimum &&
      other.maximum == maximum &&
      other.firstAttack == firstAttack &&
      other.perAttack == perAttack &&
      other.decay == decay;

    @override
    int get hashCode =>
        (min == null ? 0 : min.hashCode) +
        (max == null ? 0 : max.hashCode) +
        (minimum == null ? 0 : minimum.hashCode) +
        (maximum == null ? 0 : maximum.hashCode) +
        (firstAttack == null ? 0 : firstAttack.hashCode) +
        (perAttack == null ? 0 : perAttack.hashCode) +
        (decay == null ? 0 : decay.hashCode);

  factory VehicleWeaponSpread.fromJson(Map<String, dynamic> json) => _$VehicleWeaponSpreadFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleWeaponSpreadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

