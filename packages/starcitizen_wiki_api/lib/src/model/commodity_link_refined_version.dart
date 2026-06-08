//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'commodity_link_refined_version.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommodityLinkRefinedVersion {
  /// Returns a new [CommodityLinkRefinedVersion] instance.
  CommodityLinkRefinedVersion({

     this.name,

     this.uuid,

     this.webUrl,

     this.link,
  });

      /// Name of the refined commodity.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// UUID of the refined commodity.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Frontend URL for the refined commodity page.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



      /// API link to the refined commodity details.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommodityLinkRefinedVersion &&
      other.name == name &&
      other.uuid == uuid &&
      other.webUrl == webUrl &&
      other.link == link;

    @override
    int get hashCode =>
        name.hashCode +
        uuid.hashCode +
        webUrl.hashCode +
        link.hashCode;

  factory CommodityLinkRefinedVersion.fromJson(Map<String, dynamic> json) => _$CommodityLinkRefinedVersionFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityLinkRefinedVersionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

