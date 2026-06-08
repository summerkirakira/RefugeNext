//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_armor_signal_multiplier.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleArmorSignalMultiplier {
  /// Returns a new [VehicleArmorSignalMultiplier] instance.
  VehicleArmorSignalMultiplier({

     this.crossSection,

     this.crossSectionChange,

     this.infrared,

     this.infraredChange,

     this.electromagnetic,

     this.electromagneticChange,
  });

      /// Radar cross-section multiplier.
  @JsonKey(
    
    name: r'cross_section',
    required: false,
    includeIfNull: false,
  )


  final double? crossSection;



      /// Cross-section change from baseline (multiplier - 1). Negative values indicate reduction.
  @JsonKey(
    
    name: r'cross_section_change',
    required: false,
    includeIfNull: false,
  )


  final double? crossSectionChange;



      /// Infrared signature multiplier. Lower values reduce heat detectability.
  @JsonKey(
    
    name: r'infrared',
    required: false,
    includeIfNull: false,
  )


  final double? infrared;



      /// Infrared change from baseline (multiplier - 1).
  @JsonKey(
    
    name: r'infrared_change',
    required: false,
    includeIfNull: false,
  )


  final double? infraredChange;



      /// Electromagnetic signature multiplier. Lower values improve EM stealth.
  @JsonKey(
    
    name: r'electromagnetic',
    required: false,
    includeIfNull: false,
  )


  final double? electromagnetic;



      /// EM change from baseline (multiplier - 1).
  @JsonKey(
    
    name: r'electromagnetic_change',
    required: false,
    includeIfNull: false,
  )


  final double? electromagneticChange;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleArmorSignalMultiplier &&
      other.crossSection == crossSection &&
      other.crossSectionChange == crossSectionChange &&
      other.infrared == infrared &&
      other.infraredChange == infraredChange &&
      other.electromagnetic == electromagnetic &&
      other.electromagneticChange == electromagneticChange;

    @override
    int get hashCode =>
        (crossSection == null ? 0 : crossSection.hashCode) +
        (crossSectionChange == null ? 0 : crossSectionChange.hashCode) +
        (infrared == null ? 0 : infrared.hashCode) +
        (infraredChange == null ? 0 : infraredChange.hashCode) +
        (electromagnetic == null ? 0 : electromagnetic.hashCode) +
        (electromagneticChange == null ? 0 : electromagneticChange.hashCode);

  factory VehicleArmorSignalMultiplier.fromJson(Map<String, dynamic> json) => _$VehicleArmorSignalMultiplierFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleArmorSignalMultiplierToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

