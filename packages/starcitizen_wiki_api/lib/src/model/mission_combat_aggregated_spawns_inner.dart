//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_combat_aggregated_spawns_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionCombatAggregatedSpawnsInner {
  /// Returns a new [MissionCombatAggregatedSpawnsInner] instance.
  MissionCombatAggregatedSpawnsInner({

     this.role,

     this.groupName,

     this.spawnKind,

     this.concurrentMin,

     this.concurrentMax,

     this.weight,
  });

  @JsonKey(
    
    name: r'role',
    required: false,
    includeIfNull: false,
  )


  final String? role;



  @JsonKey(
    
    name: r'group_name',
    required: false,
    includeIfNull: false,
  )


  final String? groupName;



  @JsonKey(
    
    name: r'spawn_kind',
    required: false,
    includeIfNull: false,
  )


  final String? spawnKind;



  @JsonKey(
    
    name: r'concurrent_min',
    required: false,
    includeIfNull: false,
  )


  final int? concurrentMin;



  @JsonKey(
    
    name: r'concurrent_max',
    required: false,
    includeIfNull: false,
  )


  final int? concurrentMax;



  @JsonKey(
    
    name: r'weight',
    required: false,
    includeIfNull: false,
  )


  final int? weight;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionCombatAggregatedSpawnsInner &&
      other.role == role &&
      other.groupName == groupName &&
      other.spawnKind == spawnKind &&
      other.concurrentMin == concurrentMin &&
      other.concurrentMax == concurrentMax &&
      other.weight == weight;

    @override
    int get hashCode =>
        role.hashCode +
        (groupName == null ? 0 : groupName.hashCode) +
        (spawnKind == null ? 0 : spawnKind.hashCode) +
        (concurrentMin == null ? 0 : concurrentMin.hashCode) +
        (concurrentMax == null ? 0 : concurrentMax.hashCode) +
        (weight == null ? 0 : weight.hashCode);

  factory MissionCombatAggregatedSpawnsInner.fromJson(Map<String, dynamic> json) => _$MissionCombatAggregatedSpawnsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$MissionCombatAggregatedSpawnsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

