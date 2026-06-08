//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_chain_variant.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionChainVariant {
  /// Returns a new [MissionChainVariant] instance.
  MissionChainVariant({

     this.uuid,

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
    bool operator ==(Object other) => identical(this, other) || other is MissionChainVariant &&
      other.uuid == uuid &&
      other.link == link &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory MissionChainVariant.fromJson(Map<String, dynamic> json) => _$MissionChainVariantFromJson(json);

  Map<String, dynamic> toJson() => _$MissionChainVariantToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

