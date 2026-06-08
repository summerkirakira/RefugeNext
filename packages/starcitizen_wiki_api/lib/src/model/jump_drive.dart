//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'jump_drive.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class JumpDrive {
  /// Returns a new [JumpDrive] instance.
  JumpDrive({

     this.alignmentRate,

     this.alignmentDecayRate,

     this.tuningRate,

     this.tuningDecayRate,

     this.fuelUsageEfficiencyMultiplier,
  });

      /// Rate at which the drive aligns to a jump point. Higher values mean faster alignment.
  @JsonKey(
    
    name: r'alignment_rate',
    required: false,
    includeIfNull: false,
  )


  final double? alignmentRate;



      /// Rate at which alignment decays when not actively aligning.
  @JsonKey(
    
    name: r'alignment_decay_rate',
    required: false,
    includeIfNull: false,
  )


  final double? alignmentDecayRate;



      /// Tuning speed. Higher values mean faster calibration.
  @JsonKey(
    
    name: r'tuning_rate',
    required: false,
    includeIfNull: false,
  )


  final double? tuningRate;



      /// Rate at which tuning decays when not actively tuning.
  @JsonKey(
    
    name: r'tuning_decay_rate',
    required: false,
    includeIfNull: false,
  )


  final double? tuningDecayRate;



      /// Fuel efficiency multiplier. Higher values mean less fuel consumed per jump.
  @JsonKey(
    
    name: r'fuel_usage_efficiency_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? fuelUsageEfficiencyMultiplier;





    @override
    bool operator ==(Object other) => identical(this, other) || other is JumpDrive &&
      other.alignmentRate == alignmentRate &&
      other.alignmentDecayRate == alignmentDecayRate &&
      other.tuningRate == tuningRate &&
      other.tuningDecayRate == tuningDecayRate &&
      other.fuelUsageEfficiencyMultiplier == fuelUsageEfficiencyMultiplier;

    @override
    int get hashCode =>
        (alignmentRate == null ? 0 : alignmentRate.hashCode) +
        (alignmentDecayRate == null ? 0 : alignmentDecayRate.hashCode) +
        (tuningRate == null ? 0 : tuningRate.hashCode) +
        (tuningDecayRate == null ? 0 : tuningDecayRate.hashCode) +
        (fuelUsageEfficiencyMultiplier == null ? 0 : fuelUsageEfficiencyMultiplier.hashCode);

  factory JumpDrive.fromJson(Map<String, dynamic> json) => _$JumpDriveFromJson(json);

  Map<String, dynamic> toJson() => _$JumpDriveToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

