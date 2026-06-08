//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'resource_container_commodity_link.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResourceContainerCommodityLink {
  /// Returns a new [ResourceContainerCommodityLink] instance.
  ResourceContainerCommodityLink({

     this.uuid,

     this.name,

     this.slug,

     this.link,
  });

      /// Unique identifier of the commodity.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Display name of the commodity.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// URL-friendly slug for the commodity.
  @JsonKey(
    
    name: r'slug',
    required: false,
    includeIfNull: false,
  )


  final String? slug;



      /// API URL for the commodity detail endpoint.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResourceContainerCommodityLink &&
      other.uuid == uuid &&
      other.name == name &&
      other.slug == slug &&
      other.link == link;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode +
        (slug == null ? 0 : slug.hashCode) +
        (link == null ? 0 : link.hashCode);

  factory ResourceContainerCommodityLink.fromJson(Map<String, dynamic> json) => _$ResourceContainerCommodityLinkFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceContainerCommodityLinkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

