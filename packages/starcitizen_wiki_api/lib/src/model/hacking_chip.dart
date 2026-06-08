//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'hacking_chip.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HackingChip {
  /// Returns a new [HackingChip] instance.
  HackingChip({

     this.maxCharges,

     this.durationMultiplier,

     this.errorChance,

     this.accessTag,
  });

      /// Number of uses before the chip depletes.
  @JsonKey(
    
    name: r'max_charges',
    required: false,
    includeIfNull: false,
  )


  final int? maxCharges;



      /// Multiplier applied to the base hack duration. Values below 1.0 speed the hack up; values above 1.0 slow it down. Example 0.5 halves the required time.
  @JsonKey(
    
    name: r'duration_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? durationMultiplier;



      /// Probability (0-1) that a hack attempt fails or produces an error. Higher values indicate more risk. Example 0.9 = 90% error chance.
  @JsonKey(
    
    name: r'error_chance',
    required: false,
    includeIfNull: false,
  )


  final double? errorChance;



      /// Gameplay access tag required/assigned when the chip is used (e.g., MissionQuestItem to mark mission-only keys).
  @JsonKey(
    
    name: r'access_tag',
    required: false,
    includeIfNull: false,
  )


  final String? accessTag;





    @override
    bool operator ==(Object other) => identical(this, other) || other is HackingChip &&
      other.maxCharges == maxCharges &&
      other.durationMultiplier == durationMultiplier &&
      other.errorChance == errorChance &&
      other.accessTag == accessTag;

    @override
    int get hashCode =>
        (maxCharges == null ? 0 : maxCharges.hashCode) +
        (durationMultiplier == null ? 0 : durationMultiplier.hashCode) +
        (errorChance == null ? 0 : errorChance.hashCode) +
        (accessTag == null ? 0 : accessTag.hashCode);

  factory HackingChip.fromJson(Map<String, dynamic> json) => _$HackingChipFromJson(json);

  Map<String, dynamic> toJson() => _$HackingChipToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

