//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/filter_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_ship_matrix_filters200_response_filters.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListShipMatrixFilters200ResponseFilters {
  /// Returns a new [ListShipMatrixFilters200ResponseFilters] instance.
  ListShipMatrixFilters200ResponseFilters({

     this.manufacturer,

     this.size,

     this.type,

     this.focus,

     this.productionStatus,
  });

  @JsonKey(
    
    name: r'manufacturer',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? manufacturer;



  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? size;



  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? type;



  @JsonKey(
    
    name: r'focus',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? focus;



  @JsonKey(
    
    name: r'production_status',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? productionStatus;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListShipMatrixFilters200ResponseFilters &&
      other.manufacturer == manufacturer &&
      other.size == size &&
      other.type == type &&
      other.focus == focus &&
      other.productionStatus == productionStatus;

    @override
    int get hashCode =>
        manufacturer.hashCode +
        size.hashCode +
        type.hashCode +
        focus.hashCode +
        productionStatus.hashCode;

  factory ListShipMatrixFilters200ResponseFilters.fromJson(Map<String, dynamic> json) => _$ListShipMatrixFilters200ResponseFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$ListShipMatrixFilters200ResponseFiltersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

