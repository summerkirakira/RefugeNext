//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'commodity_index_location_entry.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommodityIndexLocationEntry {
  /// Returns a new [CommodityIndexLocationEntry] instance.
  CommodityIndexLocationEntry({

     this.groupName,

     this.resourceKind,

     this.qualityMin,

     this.qualityMax,

     this.entryCount,
  });

      /// Internal group name identifying the mining method or category (e.g. \"SpaceShip_Mineables\", \"Harvestables\").
  @JsonKey(
    
    name: r'group_name',
    required: false,
    includeIfNull: false,
  )


  final String? groupName;



      /// Kind of resource if resolvable from the group (e.g. \"Mineable\", \"Harvestable\").
  @JsonKey(
    
    name: r'resource_kind',
    required: false,
    includeIfNull: false,
  )


  final String? resourceKind;



      /// Minimum quality value across entries in this group.
  @JsonKey(
    
    name: r'quality_min',
    required: false,
    includeIfNull: false,
  )


  final int? qualityMin;



      /// Maximum quality value across entries in this group.
  @JsonKey(
    
    name: r'quality_max',
    required: false,
    includeIfNull: false,
  )


  final int? qualityMax;



      /// Number of individual resource entries in this group.
  @JsonKey(
    
    name: r'entry_count',
    required: false,
    includeIfNull: false,
  )


  final int? entryCount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommodityIndexLocationEntry &&
      other.groupName == groupName &&
      other.resourceKind == resourceKind &&
      other.qualityMin == qualityMin &&
      other.qualityMax == qualityMax &&
      other.entryCount == entryCount;

    @override
    int get hashCode =>
        groupName.hashCode +
        (resourceKind == null ? 0 : resourceKind.hashCode) +
        (qualityMin == null ? 0 : qualityMin.hashCode) +
        (qualityMax == null ? 0 : qualityMax.hashCode) +
        entryCount.hashCode;

  factory CommodityIndexLocationEntry.fromJson(Map<String, dynamic> json) => _$CommodityIndexLocationEntryFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityIndexLocationEntryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

