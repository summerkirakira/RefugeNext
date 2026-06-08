//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/filter_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_location_filters200_response_filters.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListLocationFilters200ResponseFilters {
  /// Returns a new [ListLocationFilters200ResponseFilters] instance.
  ListLocationFilters200ResponseFilters({

     this.typeName,

     this.typeClassification,

     this.respawnLocationType,

     this.jurisdictionName,

     this.affiliationName,

     this.system,

     this.parentName,

     this.amenity,

     this.resource,
  });

  @JsonKey(
    
    name: r'type_name',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? typeName;



  @JsonKey(
    
    name: r'type_classification',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? typeClassification;



  @JsonKey(
    
    name: r'respawn_location_type',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? respawnLocationType;



  @JsonKey(
    
    name: r'jurisdiction_name',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? jurisdictionName;



  @JsonKey(
    
    name: r'affiliation_name',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? affiliationName;



  @JsonKey(
    
    name: r'system',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? system;



  @JsonKey(
    
    name: r'parent_name',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? parentName;



  @JsonKey(
    
    name: r'amenity',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? amenity;



  @JsonKey(
    
    name: r'resource',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? resource;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListLocationFilters200ResponseFilters &&
      other.typeName == typeName &&
      other.typeClassification == typeClassification &&
      other.respawnLocationType == respawnLocationType &&
      other.jurisdictionName == jurisdictionName &&
      other.affiliationName == affiliationName &&
      other.system == system &&
      other.parentName == parentName &&
      other.amenity == amenity &&
      other.resource == resource;

    @override
    int get hashCode =>
        typeName.hashCode +
        typeClassification.hashCode +
        respawnLocationType.hashCode +
        jurisdictionName.hashCode +
        affiliationName.hashCode +
        system.hashCode +
        parentName.hashCode +
        amenity.hashCode +
        resource.hashCode;

  factory ListLocationFilters200ResponseFilters.fromJson(Map<String, dynamic> json) => _$ListLocationFilters200ResponseFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$ListLocationFilters200ResponseFiltersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

