// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_authenticated_user200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAuthenticatedUser200Response _$GetAuthenticatedUser200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GetAuthenticatedUser200Response',
  json,
  ($checkedConvert) {
    final val = GetAuthenticatedUser200Response(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      name: $checkedConvert('name', (v) => v as String?),
      email: $checkedConvert('email', (v) => v as String?),
      emailVerifiedAt: $checkedConvert(
        'email_verified_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      isAdmin: $checkedConvert('is_admin', (v) => v as bool?),
      languageId: $checkedConvert('language_id', (v) => (v as num?)?.toInt()),
      createdAt: $checkedConvert(
        'created_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'emailVerifiedAt': 'email_verified_at',
    'isAdmin': 'is_admin',
    'languageId': 'language_id',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$GetAuthenticatedUser200ResponseToJson(
  GetAuthenticatedUser200Response instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'email': ?instance.email,
  'email_verified_at': ?instance.emailVerifiedAt?.toIso8601String(),
  'is_admin': ?instance.isAdmin,
  'language_id': ?instance.languageId,
  'created_at': ?instance.createdAt?.toIso8601String(),
  'updated_at': ?instance.updatedAt?.toIso8601String(),
};
