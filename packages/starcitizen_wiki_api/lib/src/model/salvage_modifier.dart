//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'salvage_modifier.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SalvageModifier {
  /// Returns a new [SalvageModifier] instance.
  SalvageModifier({

     this.salvageSpeedMultiplier,

     this.radiusMultiplier,

     this.extractionEfficiency,
  });

  @Deprecated('salvageSpeedMultiplier has been deprecated')
  @JsonKey(
    
    name: r'salvage_speed_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? salvageSpeedMultiplier;



  @Deprecated('radiusMultiplier has been deprecated')
  @JsonKey(
    
    name: r'radius_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? radiusMultiplier;



  @Deprecated('extractionEfficiency has been deprecated')
  @JsonKey(
    
    name: r'extraction_efficiency',
    required: false,
    includeIfNull: false,
  )


  final double? extractionEfficiency;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SalvageModifier &&
      other.salvageSpeedMultiplier == salvageSpeedMultiplier &&
      other.radiusMultiplier == radiusMultiplier &&
      other.extractionEfficiency == extractionEfficiency;

    @override
    int get hashCode =>
        (salvageSpeedMultiplier == null ? 0 : salvageSpeedMultiplier.hashCode) +
        (radiusMultiplier == null ? 0 : radiusMultiplier.hashCode) +
        (extractionEfficiency == null ? 0 : extractionEfficiency.hashCode);

  factory SalvageModifier.fromJson(Map<String, dynamic> json) => _$SalvageModifierFromJson(json);

  Map<String, dynamic> toJson() => _$SalvageModifierToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

