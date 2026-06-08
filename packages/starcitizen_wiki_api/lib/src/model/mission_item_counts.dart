//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_item_counts.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionItemCounts {
  /// Returns a new [MissionItemCounts] instance.
  MissionItemCounts({

     this.maxItems,

     this.minItems,
  });

  @JsonKey(
    
    name: r'max_items',
    required: false,
    includeIfNull: false,
  )


  final int? maxItems;



  @JsonKey(
    
    name: r'min_items',
    required: false,
    includeIfNull: false,
  )


  final int? minItems;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionItemCounts &&
      other.maxItems == maxItems &&
      other.minItems == minItems;

    @override
    int get hashCode =>
        (maxItems == null ? 0 : maxItems.hashCode) +
        (minItems == null ? 0 : minItems.hashCode);

  factory MissionItemCounts.fromJson(Map<String, dynamic> json) => _$MissionItemCountsFromJson(json);

  Map<String, dynamic> toJson() => _$MissionItemCountsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

