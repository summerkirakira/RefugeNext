//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/filter_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_blueprint_filters200_response_filters.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListBlueprintFilters200ResponseFilters {
  /// Returns a new [ListBlueprintFilters200ResponseFilters] instance.
  ListBlueprintFilters200ResponseFilters({

     this.outputPeriodType,

     this.ingredientPeriodUuid,

     this.resourcePeriodUuid,
  });

      /// Crafted item types (e.g. WeaponPersonal, Char_Armor_Torso, WeaponAttachment)
  @JsonKey(
    
    name: r'output.type',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? outputPeriodType;



      /// Ingredient commodity UUIDs with names and counts
  @JsonKey(
    
    name: r'ingredient.uuid',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? ingredientPeriodUuid;



      /// Combined ingredient and dismantle return resource UUIDs with names and counts
  @JsonKey(
    
    name: r'resource.uuid',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? resourcePeriodUuid;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListBlueprintFilters200ResponseFilters &&
      other.outputPeriodType == outputPeriodType &&
      other.ingredientPeriodUuid == ingredientPeriodUuid &&
      other.resourcePeriodUuid == resourcePeriodUuid;

    @override
    int get hashCode =>
        outputPeriodType.hashCode +
        ingredientPeriodUuid.hashCode +
        resourcePeriodUuid.hashCode;

  factory ListBlueprintFilters200ResponseFilters.fromJson(Map<String, dynamic> json) => _$ListBlueprintFilters200ResponseFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$ListBlueprintFilters200ResponseFiltersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

