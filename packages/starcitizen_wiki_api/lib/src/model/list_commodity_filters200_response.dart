//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/list_commodity_filters200_response_filters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_commodity_filters200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListCommodityFilters200Response {
  /// Returns a new [ListCommodityFilters200Response] instance.
  ListCommodityFilters200Response({

     this.filters,
  });

  @JsonKey(
    
    name: r'filters',
    required: false,
    includeIfNull: false,
  )


  final ListCommodityFilters200ResponseFilters? filters;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListCommodityFilters200Response &&
      other.filters == filters;

    @override
    int get hashCode =>
        filters.hashCode;

  factory ListCommodityFilters200Response.fromJson(Map<String, dynamic> json) => _$ListCommodityFilters200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListCommodityFilters200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

