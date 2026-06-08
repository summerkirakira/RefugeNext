//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'canonical_resource_meta.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CanonicalResourceMeta {
  /// Returns a new [CanonicalResourceMeta] instance.
  CanonicalResourceMeta({

     this.type,

     this.uuid,

     this.slug,

     this.apiUrl,

     this.webUrl,

     this.version,
  });

      /// Resource type discriminator.
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final CanonicalResourceMetaTypeEnum? type;



      /// Entity UUID.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// URL-friendly slug. Omitted when null.
  @JsonKey(
    
    name: r'slug',
    required: false,
    includeIfNull: false,
  )


  final String? slug;



      /// Canonical API URL for this resource.
  @JsonKey(
    
    name: r'api_url',
    required: false,
    includeIfNull: false,
  )


  final String? apiUrl;



      /// Canonical web URL for this resource.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



      /// Game version code this response is scoped to. Omitted when not applicable.
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CanonicalResourceMeta &&
      other.type == type &&
      other.uuid == uuid &&
      other.slug == slug &&
      other.apiUrl == apiUrl &&
      other.webUrl == webUrl &&
      other.version == version;

    @override
    int get hashCode =>
        type.hashCode +
        uuid.hashCode +
        (slug == null ? 0 : slug.hashCode) +
        apiUrl.hashCode +
        webUrl.hashCode +
        (version == null ? 0 : version.hashCode);

  factory CanonicalResourceMeta.fromJson(Map<String, dynamic> json) => _$CanonicalResourceMetaFromJson(json);

  Map<String, dynamic> toJson() => _$CanonicalResourceMetaToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Resource type discriminator.
enum CanonicalResourceMetaTypeEnum {
    /// Resource type discriminator.
@JsonValue(r'blueprint')
blueprint(r'blueprint'),
    /// Resource type discriminator.
@JsonValue(r'commodity')
commodity(r'commodity'),
    /// Resource type discriminator.
@JsonValue(r'item')
item(r'item'),
    /// Resource type discriminator.
@JsonValue(r'location')
location(r'location'),
    /// Resource type discriminator.
@JsonValue(r'mission')
mission(r'mission'),
    /// Resource type discriminator.
@JsonValue(r'vehicle')
vehicle(r'vehicle');

const CanonicalResourceMetaTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


