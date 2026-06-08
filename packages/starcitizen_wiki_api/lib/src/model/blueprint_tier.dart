//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/blueprint_requirement_node.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_tier.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintTier {
  /// Returns a new [BlueprintTier] instance.
  BlueprintTier({

     this.tierIndex,

     this.craftTimeSeconds,

     this.requirements,
  });

      /// Zero-based index of this crafting tier
  @JsonKey(
    
    name: r'tier_index',
    required: false,
    includeIfNull: false,
  )


  final int? tierIndex;



      /// Crafting duration in seconds for this tier
  @JsonKey(
    
    name: r'craft_time_seconds',
    required: false,
    includeIfNull: false,
  )


  final int? craftTimeSeconds;



      /// Recursive requirement tree for this tier
  @JsonKey(
    
    name: r'requirements',
    required: false,
    includeIfNull: false,
  )


  final BlueprintRequirementNode? requirements;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintTier &&
      other.tierIndex == tierIndex &&
      other.craftTimeSeconds == craftTimeSeconds &&
      other.requirements == requirements;

    @override
    int get hashCode =>
        (tierIndex == null ? 0 : tierIndex.hashCode) +
        (craftTimeSeconds == null ? 0 : craftTimeSeconds.hashCode) +
        (requirements == null ? 0 : requirements.hashCode);

  factory BlueprintTier.fromJson(Map<String, dynamic> json) => _$BlueprintTierFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintTierToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

