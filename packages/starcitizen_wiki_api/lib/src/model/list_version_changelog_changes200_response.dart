//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/version_diff_entry.dart';
import 'package:starcitizen_wiki_api/src/model/pagination_meta.dart';
import 'package:starcitizen_wiki_api/src/model/pagination_links.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_version_changelog_changes200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListVersionChangelogChanges200Response {
  /// Returns a new [ListVersionChangelogChanges200Response] instance.
  ListVersionChangelogChanges200Response({

     this.data,

     this.links,

     this.meta,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final List<VersionDiffEntry>? data;



  @JsonKey(
    
    name: r'links',
    required: false,
    includeIfNull: false,
  )


  final PaginationLinks? links;



  @JsonKey(
    
    name: r'meta',
    required: false,
    includeIfNull: false,
  )


  final PaginationMeta? meta;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListVersionChangelogChanges200Response &&
      other.data == data &&
      other.links == links &&
      other.meta == meta;

    @override
    int get hashCode =>
        data.hashCode +
        links.hashCode +
        meta.hashCode;

  factory ListVersionChangelogChanges200Response.fromJson(Map<String, dynamic> json) => _$ListVersionChangelogChanges200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListVersionChangelogChanges200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

