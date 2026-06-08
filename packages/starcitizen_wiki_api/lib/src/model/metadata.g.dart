// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Metadata _$MetadataFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Metadata',
  json,
  ($checkedConvert) {
    final val = Metadata(
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      version: $checkedConvert('version', (v) => v as String?),
      deprecatedFields: $checkedConvert(
        'deprecated_fields',
        (v) => v as String?,
      ),
      resource: $checkedConvert(
        'resource',
        (v) => v == null
            ? null
            : CanonicalResourceMeta.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'updatedAt': 'updated_at',
    'deprecatedFields': 'deprecated_fields',
  },
);

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
  'updated_at': ?instance.updatedAt?.toIso8601String(),
  'version': ?instance.version,
  'deprecated_fields': ?instance.deprecatedFields,
  'resource': ?instance.resource?.toJson(),
};
