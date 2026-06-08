//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'material_entry.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MaterialEntry {
  /// Returns a new [MaterialEntry] instance.
  MaterialEntry({

     this.key,

     this.name,

     this.uuid,

     this.isCurrent,

     this.qualityMin,

     this.qualityMax,

     this.qualityMean,

     this.qualityStddev,

     this.minPercentage,

     this.maxPercentage,

     this.instability,

     this.resistance,

     this.groupProbability,

     this.groupProbabilityPercent,

     this.relativeProbability,

     this.relativeProbabilityPercent,

     this.qualityQuantizedValues,

     this.qualityQuantization,
  });

      /// Unique material key identifier.
  @JsonKey(
    
    name: r'key',
    required: false,
    includeIfNull: false,
  )


  final String? key;



      /// Display name of the material.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// UUID of the commodity this material represents.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Whether this material is the primary commodity being viewed.
  @JsonKey(
    
    name: r'is_current',
    required: false,
    includeIfNull: false,
  )


  final bool? isCurrent;



      /// Minimum quality value of this material in the deposit.
  @JsonKey(
    
    name: r'quality_min',
    required: false,
    includeIfNull: false,
  )


  final int? qualityMin;



      /// Maximum quality value of this material in the deposit.
  @JsonKey(
    
    name: r'quality_max',
    required: false,
    includeIfNull: false,
  )


  final int? qualityMax;



      /// Average quality value of this material.
  @JsonKey(
    
    name: r'quality_mean',
    required: false,
    includeIfNull: false,
  )


  final int? qualityMean;



      /// Standard deviation of the quality distribution.
  @JsonKey(
    
    name: r'quality_stddev',
    required: false,
    includeIfNull: false,
  )


  final int? qualityStddev;



      /// Minimum composition percentage of this material (0-100).
  @JsonKey(
    
    name: r'min_percentage',
    required: false,
    includeIfNull: false,
  )


  final num? minPercentage;



      /// Maximum composition percentage of this material (0-100).
  @JsonKey(
    
    name: r'max_percentage',
    required: false,
    includeIfNull: false,
  )


  final num? maxPercentage;



      /// Instability rating of this material, affecting mining difficulty.
  @JsonKey(
    
    name: r'instability',
    required: false,
    includeIfNull: false,
  )


  final num? instability;



      /// Resistance rating of this material, affecting mining difficulty.
  @JsonKey(
    
    name: r'resistance',
    required: false,
    includeIfNull: false,
  )


  final num? resistance;



      /// Raw probability of this material occurring in the deposit group (0-1).
  @JsonKey(
    
    name: r'group_probability',
    required: false,
    includeIfNull: false,
  )


  final num? groupProbability;



      /// Group probability expressed as a percentage (0-100).
  @JsonKey(
    
    name: r'group_probability_percent',
    required: false,
    includeIfNull: false,
  )


  final num? groupProbabilityPercent;



      /// Raw relative probability compared to other materials in the deposit (0-1).
  @JsonKey(
    
    name: r'relative_probability',
    required: false,
    includeIfNull: false,
  )


  final num? relativeProbability;



      /// Relative probability expressed as a percentage (0-100).
  @JsonKey(
    
    name: r'relative_probability_percent',
    required: false,
    includeIfNull: false,
  )


  final num? relativeProbabilityPercent;



      /// The discrete set of quantized quality values a player can actually receive, filtered by the material's quality range. Each value corresponds to one reachable quantization band.
  @JsonKey(
    
    name: r'quality_quantized_values',
    required: false,
    includeIfNull: false,
  )


  final List<int>? qualityQuantizedValues;



      /// All possible quantized quality values for this material from the source data. Use quality_quantized_values for the filtered set reachable on this specific deposit.
  @JsonKey(
    
    name: r'quality_quantization',
    required: false,
    includeIfNull: false,
  )


  final List<int>? qualityQuantization;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MaterialEntry &&
      other.key == key &&
      other.name == name &&
      other.uuid == uuid &&
      other.isCurrent == isCurrent &&
      other.qualityMin == qualityMin &&
      other.qualityMax == qualityMax &&
      other.qualityMean == qualityMean &&
      other.qualityStddev == qualityStddev &&
      other.minPercentage == minPercentage &&
      other.maxPercentage == maxPercentage &&
      other.instability == instability &&
      other.resistance == resistance &&
      other.groupProbability == groupProbability &&
      other.groupProbabilityPercent == groupProbabilityPercent &&
      other.relativeProbability == relativeProbability &&
      other.relativeProbabilityPercent == relativeProbabilityPercent &&
      other.qualityQuantizedValues == qualityQuantizedValues &&
      other.qualityQuantization == qualityQuantization;

    @override
    int get hashCode =>
        (key == null ? 0 : key.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (uuid == null ? 0 : uuid.hashCode) +
        isCurrent.hashCode +
        (qualityMin == null ? 0 : qualityMin.hashCode) +
        (qualityMax == null ? 0 : qualityMax.hashCode) +
        (qualityMean == null ? 0 : qualityMean.hashCode) +
        (qualityStddev == null ? 0 : qualityStddev.hashCode) +
        minPercentage.hashCode +
        maxPercentage.hashCode +
        (instability == null ? 0 : instability.hashCode) +
        (resistance == null ? 0 : resistance.hashCode) +
        groupProbability.hashCode +
        groupProbabilityPercent.hashCode +
        relativeProbability.hashCode +
        relativeProbabilityPercent.hashCode +
        (qualityQuantizedValues == null ? 0 : qualityQuantizedValues.hashCode) +
        (qualityQuantization == null ? 0 : qualityQuantization.hashCode);

  factory MaterialEntry.fromJson(Map<String, dynamic> json) => _$MaterialEntryFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialEntryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

