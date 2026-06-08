//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_blueprint_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_blueprint_pool.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionBlueprintPool {
  /// Returns a new [MissionBlueprintPool] instance.
  MissionBlueprintPool({

     this.dropChance,

     this.dropChancePercent,

     this.poolUuid,

     this.items,
  });

  @JsonKey(
    
    name: r'drop_chance',
    required: false,
    includeIfNull: false,
  )


  final double? dropChance;



  @JsonKey(
    
    name: r'drop_chance_percent',
    required: false,
    includeIfNull: false,
  )


  final double? dropChancePercent;



  @JsonKey(
    
    name: r'pool_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? poolUuid;



  @JsonKey(
    
    name: r'items',
    required: false,
    includeIfNull: false,
  )


  final List<MissionBlueprintItem>? items;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionBlueprintPool &&
      other.dropChance == dropChance &&
      other.dropChancePercent == dropChancePercent &&
      other.poolUuid == poolUuid &&
      other.items == items;

    @override
    int get hashCode =>
        (dropChance == null ? 0 : dropChance.hashCode) +
        (dropChancePercent == null ? 0 : dropChancePercent.hashCode) +
        (poolUuid == null ? 0 : poolUuid.hashCode) +
        items.hashCode;

  factory MissionBlueprintPool.fromJson(Map<String, dynamic> json) => _$MissionBlueprintPoolFromJson(json);

  Map<String, dynamic> toJson() => _$MissionBlueprintPoolToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

