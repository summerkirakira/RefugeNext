//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/filter_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_galactapedia_filters200_response_filters.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListGalactapediaFilters200ResponseFilters {
  /// Returns a new [ListGalactapediaFilters200ResponseFilters] instance.
  ListGalactapediaFilters200ResponseFilters({

     this.category,

     this.tag,

     this.template,
  });

      /// Category names such as Animals, Archaeology, Art, Banu, Civilizations
  @JsonKey(
    
    name: r'category',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? category;



      /// Tag names such as vehicle models, locations, and lore terms
  @JsonKey(
    
    name: r'tag',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? tag;



      /// Template types such as Civilization, Company, Event
  @JsonKey(
    
    name: r'template',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? template;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListGalactapediaFilters200ResponseFilters &&
      other.category == category &&
      other.tag == tag &&
      other.template == template;

    @override
    int get hashCode =>
        category.hashCode +
        tag.hashCode +
        template.hashCode;

  factory ListGalactapediaFilters200ResponseFilters.fromJson(Map<String, dynamic> json) => _$ListGalactapediaFilters200ResponseFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$ListGalactapediaFilters200ResponseFiltersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

