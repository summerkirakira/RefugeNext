//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'pagination_meta_links_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaginationMetaLinksInner {
  /// Returns a new [PaginationMetaLinksInner] instance.
  PaginationMetaLinksInner({

     this.url,

     this.label,

     this.active,
  });

  @JsonKey(
    
    name: r'url',
    required: false,
    includeIfNull: false,
  )


  final String? url;



  @JsonKey(
    
    name: r'label',
    required: false,
    includeIfNull: false,
  )


  final String? label;



  @JsonKey(
    
    name: r'active',
    required: false,
    includeIfNull: false,
  )


  final bool? active;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaginationMetaLinksInner &&
      other.url == url &&
      other.label == label &&
      other.active == active;

    @override
    int get hashCode =>
        (url == null ? 0 : url.hashCode) +
        label.hashCode +
        active.hashCode;

  factory PaginationMetaLinksInner.fromJson(Map<String, dynamic> json) => _$PaginationMetaLinksInnerFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationMetaLinksInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

