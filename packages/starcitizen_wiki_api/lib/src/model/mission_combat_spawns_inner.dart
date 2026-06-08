//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_combat_spawns_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionCombatSpawnsInner {
  /// Returns a new [MissionCombatSpawnsInner] instance.
  MissionCombatSpawnsInner({

     this.role,

     this.weight,

     this.groupName,

     this.spawnKind,

     this.concurrentAmount,
  });

  @JsonKey(
    
    name: r'role',
    required: false,
    includeIfNull: false,
  )


  final String? role;



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
    
    name: r'spawn_kind',
    required: false,
    includeIfNull: false,
  )


  final String? spawnKind;



  @JsonKey(
    
    name: r'concurrent_amount',
    required: false,
    includeIfNull: false,
  )


  final int? concurrentAmount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionCombatSpawnsInner &&
      other.role == role &&
      other.weight == weight &&
      other.groupName == groupName &&
      other.spawnKind == spawnKind &&
      other.concurrentAmount == concurrentAmount;

    @override
    int get hashCode =>
        (role == null ? 0 : role.hashCode) +
        (weight == null ? 0 : weight.hashCode) +
        (groupName == null ? 0 : groupName.hashCode) +
        (spawnKind == null ? 0 : spawnKind.hashCode) +
        (concurrentAmount == null ? 0 : concurrentAmount.hashCode);

  factory MissionCombatSpawnsInner.fromJson(Map<String, dynamic> json) => _$MissionCombatSpawnsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$MissionCombatSpawnsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

