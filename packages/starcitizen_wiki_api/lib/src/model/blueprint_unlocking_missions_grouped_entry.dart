//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_unlocking_missions_grouped_entry.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintUnlockingMissionsGroupedEntry {
  /// Returns a new [BlueprintUnlockingMissionsGroupedEntry] instance.
  BlueprintUnlockingMissionsGroupedEntry({

     this.title,

     this.rewardScope,

     this.count,

     this.webUrl,
  });

      /// Mission title
  @JsonKey(
    
    name: r'title',
    required: false,
    includeIfNull: false,
  )


  final String? title;



      /// Scope of the blueprint reward
  @JsonKey(
    
    name: r'reward_scope',
    required: false,
    includeIfNull: false,
  )


  final String? rewardScope;



      /// Number of occurrences of this mission
  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;



      /// Web URL for the mission detail page
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintUnlockingMissionsGroupedEntry &&
      other.title == title &&
      other.rewardScope == rewardScope &&
      other.count == count &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        title.hashCode +
        (rewardScope == null ? 0 : rewardScope.hashCode) +
        count.hashCode +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory BlueprintUnlockingMissionsGroupedEntry.fromJson(Map<String, dynamic> json) => _$BlueprintUnlockingMissionsGroupedEntryFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintUnlockingMissionsGroupedEntryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

