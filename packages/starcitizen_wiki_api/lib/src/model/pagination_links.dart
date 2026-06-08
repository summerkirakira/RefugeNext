//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'pagination_links.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaginationLinks {
  /// Returns a new [PaginationLinks] instance.
  PaginationLinks({

     this.first,

     this.last,

     this.prev,

     this.next,
  });

      /// URL to the first page.
  @JsonKey(
    
    name: r'first',
    required: false,
    includeIfNull: false,
  )


  final String? first;



      /// URL to the last page.
  @JsonKey(
    
    name: r'last',
    required: false,
    includeIfNull: false,
  )


  final String? last;



      /// URL to the previous page.
  @JsonKey(
    
    name: r'prev',
    required: false,
    includeIfNull: false,
  )


  final String? prev;



      /// URL to the next page.
  @JsonKey(
    
    name: r'next',
    required: false,
    includeIfNull: false,
  )


  final String? next;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaginationLinks &&
      other.first == first &&
      other.last == last &&
      other.prev == prev &&
      other.next == next;

    @override
    int get hashCode =>
        (first == null ? 0 : first.hashCode) +
        (last == null ? 0 : last.hashCode) +
        (prev == null ? 0 : prev.hashCode) +
        (next == null ? 0 : next.hashCode);

  factory PaginationLinks.fromJson(Map<String, dynamic> json) => _$PaginationLinksFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationLinksToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

