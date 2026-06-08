//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/filter_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_commodity_filters200_response_filters.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListCommodityFilters200ResponseFilters {
  /// Returns a new [ListCommodityFilters200ResponseFilters] instance.
  ListCommodityFilters200ResponseFilters({

     this.system,

     this.type,

     this.rarity,

     this.kind,

     this.refinedVersion,

     this.group,

     this.location,
  });

      /// Star systems where commodities can be found
  @JsonKey(
    
    name: r'system',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? system;



      /// Location type names
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? type;



      /// Commodity tier/rarity levels
  @JsonKey(
    
    name: r'rarity',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? rarity;



      /// Resource kinds
  @JsonKey(
    
    name: r'kind',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? kind;



      /// Refined version names
  @JsonKey(
    
    name: r'refined_version',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? refinedVersion;



      /// Commodity groups
  @JsonKey(
    
    name: r'group',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? group;



      /// Starmap locations grouped by system
  @JsonKey(
    
    name: r'location',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? location;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListCommodityFilters200ResponseFilters &&
      other.system == system &&
      other.type == type &&
      other.rarity == rarity &&
      other.kind == kind &&
      other.refinedVersion == refinedVersion &&
      other.group == group &&
      other.location == location;

    @override
    int get hashCode =>
        system.hashCode +
        type.hashCode +
        rarity.hashCode +
        kind.hashCode +
        refinedVersion.hashCode +
        group.hashCode +
        location.hashCode;

  factory ListCommodityFilters200ResponseFilters.fromJson(Map<String, dynamic> json) => _$ListCommodityFilters200ResponseFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$ListCommodityFilters200ResponseFiltersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

