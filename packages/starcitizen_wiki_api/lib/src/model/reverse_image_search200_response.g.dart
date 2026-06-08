// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reverse_image_search200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReverseImageSearch200Response _$ReverseImageSearch200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReverseImageSearch200Response', json, ($checkedConvert) {
  final val = ReverseImageSearch200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => CommLinkImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ReverseImageSearch200ResponseToJson(
  ReverseImageSearch200Response instance,
) => <String, dynamic>{'data': ?instance.data?.map((e) => e.toJson()).toList()};
