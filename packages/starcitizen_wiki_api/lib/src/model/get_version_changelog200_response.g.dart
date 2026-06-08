// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_version_changelog200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVersionChangelog200Response _$GetVersionChangelog200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetVersionChangelog200Response', json, ($checkedConvert) {
  final val = GetVersionChangelog200Response(
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : VersionChangelog.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetVersionChangelog200ResponseToJson(
  GetVersionChangelog200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
