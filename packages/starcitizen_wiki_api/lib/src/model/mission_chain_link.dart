//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_chain_variant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_chain_link.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionChainLink {
  /// Returns a new [MissionChainLink] instance.
  MissionChainLink({

     this.uuid,

     this.title,

     this.missionType,

     this.variantCount,

     this.variants,

     this.link,

     this.webUrl,
  });

  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



  @JsonKey(
    
    name: r'title',
    required: false,
    includeIfNull: false,
  )


  final String? title;



  @JsonKey(
    
    name: r'mission_type',
    required: false,
    includeIfNull: false,
  )


  final String? missionType;



      /// Number of mission variants with the same title. Only present when greater than 1.
  @JsonKey(
    
    name: r'variant_count',
    required: false,
    includeIfNull: false,
  )


  final int? variantCount;



      /// Additional mission variants sharing the same title. Only present when variant_count > 1.
  @JsonKey(
    
    name: r'variants',
    required: false,
    includeIfNull: false,
  )


  final List<MissionChainVariant>? variants;



  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionChainLink &&
      other.uuid == uuid &&
      other.title == title &&
      other.missionType == missionType &&
      other.variantCount == variantCount &&
      other.variants == variants &&
      other.link == link &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        (title == null ? 0 : title.hashCode) +
        (missionType == null ? 0 : missionType.hashCode) +
        (variantCount == null ? 0 : variantCount.hashCode) +
        (variants == null ? 0 : variants.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory MissionChainLink.fromJson(Map<String, dynamic> json) => _$MissionChainLinkFromJson(json);

  Map<String, dynamic> toJson() => _$MissionChainLinkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

