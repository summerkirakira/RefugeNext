//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'weapon_modifier_salvage.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponModifierSalvage {
  /// Returns a new [WeaponModifierSalvage] instance.
  WeaponModifierSalvage({

     this.salvageSpeedMultiplier,

     this.radiusMultiplier,

     this.extractionEfficiency,
  });

      /// Salvage speed multiplier.
  @JsonKey(
    
    name: r'salvage_speed_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? salvageSpeedMultiplier;



      /// Salvage radius multiplier.
  @JsonKey(
    
    name: r'radius_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? radiusMultiplier;



      /// Extraction efficiency multiplier.
  @JsonKey(
    
    name: r'extraction_efficiency',
    required: false,
    includeIfNull: false,
  )


  final double? extractionEfficiency;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponModifierSalvage &&
      other.salvageSpeedMultiplier == salvageSpeedMultiplier &&
      other.radiusMultiplier == radiusMultiplier &&
      other.extractionEfficiency == extractionEfficiency;

    @override
    int get hashCode =>
        (salvageSpeedMultiplier == null ? 0 : salvageSpeedMultiplier.hashCode) +
        (radiusMultiplier == null ? 0 : radiusMultiplier.hashCode) +
        (extractionEfficiency == null ? 0 : extractionEfficiency.hashCode);

  factory WeaponModifierSalvage.fromJson(Map<String, dynamic> json) => _$WeaponModifierSalvageFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponModifierSalvageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

