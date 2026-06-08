//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/pagination_meta_links_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_meta.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaginationMeta {
  /// Returns a new [PaginationMeta] instance.
  PaginationMeta({

     this.currentPage,

     this.from,

     this.lastPage,

     this.perPage,

     this.to,

     this.total,

     this.links,

     this.path,
  });

      /// Current page number.
  @JsonKey(
    
    name: r'current_page',
    required: false,
    includeIfNull: false,
  )


  final int? currentPage;



      /// Index of the first item in this page.
  @JsonKey(
    
    name: r'from',
    required: false,
    includeIfNull: false,
  )


  final int? from;



      /// Last available page number.
  @JsonKey(
    
    name: r'last_page',
    required: false,
    includeIfNull: false,
  )


  final int? lastPage;



      /// Number of items per page.
  @JsonKey(
    
    name: r'per_page',
    required: false,
    includeIfNull: false,
  )


  final int? perPage;



      /// Index of the last item in this page.
  @JsonKey(
    
    name: r'to',
    required: false,
    includeIfNull: false,
  )


  final int? to;



      /// Total number of items across all pages.
  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final int? total;



      /// Pagination navigation links with page URLs.
  @JsonKey(
    
    name: r'links',
    required: false,
    includeIfNull: false,
  )


  final List<PaginationMetaLinksInner>? links;



      /// Base URL path for pagination.
  @JsonKey(
    
    name: r'path',
    required: false,
    includeIfNull: false,
  )


  final String? path;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaginationMeta &&
      other.currentPage == currentPage &&
      other.from == from &&
      other.lastPage == lastPage &&
      other.perPage == perPage &&
      other.to == to &&
      other.total == total &&
      other.links == links &&
      other.path == path;

    @override
    int get hashCode =>
        currentPage.hashCode +
        from.hashCode +
        lastPage.hashCode +
        perPage.hashCode +
        to.hashCode +
        total.hashCode +
        links.hashCode +
        path.hashCode;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) => _$PaginationMetaFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationMetaToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

