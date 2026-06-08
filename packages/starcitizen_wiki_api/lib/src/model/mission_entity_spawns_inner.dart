//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_entity_spawns_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionEntitySpawnsInner {
  /// Returns a new [MissionEntitySpawnsInner] instance.
  MissionEntitySpawnsInner({

     this.tags,

     this.amount,

     this.weight,

     this.groupName,

     this.markupTags,

     this.negativeTags,

     this.mergedTags,
  });

  @JsonKey(
    
    name: r'tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? tags;



  @JsonKey(
    
    name: r'amount',
    required: false,
    includeIfNull: false,
  )


  final int? amount;



  @JsonKey(
    
    name: r'weight',
    required: false,
    includeIfNull: false,
  )


  final int? weight;



  @JsonKey(
    
    name: r'group_name',
    required: false,
    includeIfNull: false,
  )


  final String? groupName;



  @JsonKey(
    
    name: r'markup_tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? markupTags;



  @JsonKey(
    
    name: r'negative_tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? negativeTags;



  @JsonKey(
    
    name: r'merged_tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? mergedTags;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionEntitySpawnsInner &&
      other.tags == tags &&
      other.amount == amount &&
      other.weight == weight &&
      other.groupName == groupName &&
      other.markupTags == markupTags &&
      other.negativeTags == negativeTags &&
      other.mergedTags == mergedTags;

    @override
    int get hashCode =>
        (tags == null ? 0 : tags.hashCode) +
        (amount == null ? 0 : amount.hashCode) +
        (weight == null ? 0 : weight.hashCode) +
        (groupName == null ? 0 : groupName.hashCode) +
        (markupTags == null ? 0 : markupTags.hashCode) +
        (negativeTags == null ? 0 : negativeTags.hashCode) +
        mergedTags.hashCode;

  factory MissionEntitySpawnsInner.fromJson(Map<String, dynamic> json) => _$MissionEntitySpawnsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$MissionEntitySpawnsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

