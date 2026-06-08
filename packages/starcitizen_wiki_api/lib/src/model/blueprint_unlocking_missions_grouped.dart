//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/blueprint_unlocking_missions_grouped_entry.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_unlocking_missions_grouped.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintUnlockingMissionsGrouped {
  /// Returns a new [BlueprintUnlockingMissionsGrouped] instance.
  BlueprintUnlockingMissionsGrouped({

     this.label,

     this.chance,

     this.missions,
  });

      /// Human-readable chance label (e.g. Guaranteed, 50% chance)
  @JsonKey(
    
    name: r'label',
    required: false,
    includeIfNull: false,
  )


  final String? label;



      /// Drop chance as a decimal
  @JsonKey(
    
    name: r'chance',
    required: false,
    includeIfNull: false,
  )


  final double? chance;



      /// Missions in this chance group
  @JsonKey(
    
    name: r'missions',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintUnlockingMissionsGroupedEntry>? missions;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintUnlockingMissionsGrouped &&
      other.label == label &&
      other.chance == chance &&
      other.missions == missions;

    @override
    int get hashCode =>
        label.hashCode +
        (chance == null ? 0 : chance.hashCode) +
        missions.hashCode;

  factory BlueprintUnlockingMissionsGrouped.fromJson(Map<String, dynamic> json) => _$BlueprintUnlockingMissionsGroupedFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintUnlockingMissionsGroupedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

