//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'starmap_location_link.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StarmapLocationLink {
  /// Returns a new [StarmapLocationLink] instance.
  StarmapLocationLink({

     this.uuid,

     this.name,

     this.slug,

     this.typeName,

     this.parentName,

     this.starSystemName,

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
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'slug',
    required: false,
    includeIfNull: false,
  )


  final String? slug;



  @JsonKey(
    
    name: r'type_name',
    required: false,
    includeIfNull: false,
  )


  final String? typeName;



  @JsonKey(
    
    name: r'parent_name',
    required: false,
    includeIfNull: false,
  )


  final String? parentName;



  @JsonKey(
    
    name: r'star_system_name',
    required: false,
    includeIfNull: false,
  )


  final String? starSystemName;



      /// API URL for the starmap location
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Web URL for the starmap location
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StarmapLocationLink &&
      other.uuid == uuid &&
      other.name == name &&
      other.slug == slug &&
      other.typeName == typeName &&
      other.parentName == parentName &&
      other.starSystemName == starSystemName &&
      other.link == link &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (slug == null ? 0 : slug.hashCode) +
        (typeName == null ? 0 : typeName.hashCode) +
        (parentName == null ? 0 : parentName.hashCode) +
        (starSystemName == null ? 0 : starSystemName.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory StarmapLocationLink.fromJson(Map<String, dynamic> json) => _$StarmapLocationLinkFromJson(json);

  Map<String, dynamic> toJson() => _$StarmapLocationLinkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

