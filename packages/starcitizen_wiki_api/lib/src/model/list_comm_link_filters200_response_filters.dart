//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/filter_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_comm_link_filters200_response_filters.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListCommLinkFilters200ResponseFilters {
  /// Returns a new [ListCommLinkFilters200ResponseFilters] instance.
  ListCommLinkFilters200ResponseFilters({

     this.category,

     this.channel,

     this.series,
  });

      /// Category names such as General, Community, Lore, Development
  @JsonKey(
    
    name: r'category',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? category;



      /// Channel names such as Engineering, Transmission, Featured post
  @JsonKey(
    
    name: r'channel',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? channel;



      /// Series names such as Around the Verse, 10 For the Chairman
  @JsonKey(
    
    name: r'series',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? series;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListCommLinkFilters200ResponseFilters &&
      other.category == category &&
      other.channel == channel &&
      other.series == series;

    @override
    int get hashCode =>
        category.hashCode +
        channel.hashCode +
        series.hashCode;

  factory ListCommLinkFilters200ResponseFilters.fromJson(Map<String, dynamic> json) => _$ListCommLinkFilters200ResponseFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$ListCommLinkFilters200ResponseFiltersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

