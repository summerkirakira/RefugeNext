//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ammunition_bullet_electron.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AmmunitionBulletElectron {
  /// Returns a new [AmmunitionBulletElectron] instance.
  AmmunitionBulletElectron({

     this.jumpRange,

     this.maximumJumps,

     this.residualChargeMultiplier,
  });

      /// Maximum range of each electron jump in meters.
  @JsonKey(
    
    name: r'jump_range',
    required: false,
    includeIfNull: false,
  )


  final double? jumpRange;



      /// Maximum number of chain jumps to additional targets.
  @JsonKey(
    
    name: r'maximum_jumps',
    required: false,
    includeIfNull: false,
  )


  final int? maximumJumps;



      /// Damage multiplier for each subsequent jump.
  @JsonKey(
    
    name: r'residual_charge_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? residualChargeMultiplier;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AmmunitionBulletElectron &&
      other.jumpRange == jumpRange &&
      other.maximumJumps == maximumJumps &&
      other.residualChargeMultiplier == residualChargeMultiplier;

    @override
    int get hashCode =>
        (jumpRange == null ? 0 : jumpRange.hashCode) +
        (maximumJumps == null ? 0 : maximumJumps.hashCode) +
        (residualChargeMultiplier == null ? 0 : residualChargeMultiplier.hashCode);

  factory AmmunitionBulletElectron.fromJson(Map<String, dynamic> json) => _$AmmunitionBulletElectronFromJson(json);

  Map<String, dynamic> toJson() => _$AmmunitionBulletElectronToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

