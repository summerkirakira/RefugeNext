//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/filter_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_starsystem_filters200_response_filters.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListStarsystemFilters200ResponseFilters {
  /// Returns a new [ListStarsystemFilters200ResponseFilters] instance.
  ListStarsystemFilters200ResponseFilters({

     this.affiliation,

     this.status,

     this.type,

     this.size,
  });

  @JsonKey(
    
    name: r'affiliation',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? affiliation;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? status;



  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? type;



  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? size;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListStarsystemFilters200ResponseFilters &&
      other.affiliation == affiliation &&
      other.status == status &&
      other.type == type &&
      other.size == size;

    @override
    int get hashCode =>
        affiliation.hashCode +
        status.hashCode +
        type.hashCode +
        size.hashCode;

  factory ListStarsystemFilters200ResponseFilters.fromJson(Map<String, dynamic> json) => _$ListStarsystemFilters200ResponseFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$ListStarsystemFilters200ResponseFiltersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

