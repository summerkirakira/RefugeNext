//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/commodity_index_location_entry.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commodity_index_location.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommodityIndexLocation {
  /// Returns a new [CommodityIndexLocation] instance.
  CommodityIndexLocation({

     this.name,

     this.displayName,

     this.system,

     this.type,

     this.parentName,

     this.parentType,

     this.uuid,

     this.link,

     this.entries,
  });

      /// Canonical location name.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Formatted display name including designation prefix (e.g. \"CRU-L1: Green Circle\").
  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



      /// Star system name this location belongs to.
  @JsonKey(
    
    name: r'system',
    required: false,
    includeIfNull: false,
  )


  final String? system;



      /// Location type classification (e.g. \"Moon\", \"Planet\", \"Outpost\").
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Name of the parent celestial body or location.
  @JsonKey(
    
    name: r'parent_name',
    required: false,
    includeIfNull: false,
  )


  final String? parentName;



      /// Type of the parent location.
  @JsonKey(
    
    name: r'parent_type',
    required: false,
    includeIfNull: false,
  )


  final String? parentType;



      /// UUID of the starmap location entity.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// API link to the full location details.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Resource entries grouped by mining method.
  @JsonKey(
    
    name: r'entries',
    required: false,
    includeIfNull: false,
  )


  final List<CommodityIndexLocationEntry>? entries;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommodityIndexLocation &&
      other.name == name &&
      other.displayName == displayName &&
      other.system == system &&
      other.type == type &&
      other.parentName == parentName &&
      other.parentType == parentType &&
      other.uuid == uuid &&
      other.link == link &&
      other.entries == entries;

    @override
    int get hashCode =>
        name.hashCode +
        displayName.hashCode +
        (system == null ? 0 : system.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (parentName == null ? 0 : parentName.hashCode) +
        (parentType == null ? 0 : parentType.hashCode) +
        (uuid == null ? 0 : uuid.hashCode) +
        (link == null ? 0 : link.hashCode) +
        entries.hashCode;

  factory CommodityIndexLocation.fromJson(Map<String, dynamic> json) => _$CommodityIndexLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityIndexLocationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

