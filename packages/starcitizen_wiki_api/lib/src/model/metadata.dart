//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/canonical_resource_meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Metadata {
  /// Returns a new [Metadata] instance.
  Metadata({

     this.updatedAt,

     this.version,

     this.deprecatedFields,

     this.resource,
  });

      /// Timestamp this data was last updated.
  @JsonKey(
    
    name: r'updated_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? updatedAt;



      /// The Game Version this item exists in.
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



      /// Deprecated fields that will be removed in future versions.
  @JsonKey(
    
    name: r'deprecated_fields',
    required: false,
    includeIfNull: false,
  )


  final String? deprecatedFields;



  @JsonKey(
    
    name: r'resource',
    required: false,
    includeIfNull: false,
  )


  final CanonicalResourceMeta? resource;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Metadata &&
      other.updatedAt == updatedAt &&
      other.version == version &&
      other.deprecatedFields == deprecatedFields &&
      other.resource == resource;

    @override
    int get hashCode =>
        updatedAt.hashCode +
        version.hashCode +
        deprecatedFields.hashCode +
        resource.hashCode;

  factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

