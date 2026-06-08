// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_galactapedia_article200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGalactapediaArticle200Response _$GetGalactapediaArticle200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetGalactapediaArticle200Response', json, (
  $checkedConvert,
) {
  final val = GetGalactapediaArticle200Response(
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : GalactapediaArticle.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetGalactapediaArticle200ResponseToJson(
  GetGalactapediaArticle200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
