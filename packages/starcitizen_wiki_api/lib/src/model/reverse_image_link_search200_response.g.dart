// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reverse_image_link_search200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReverseImageLinkSearch200Response _$ReverseImageLinkSearch200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReverseImageLinkSearch200Response', json, (
  $checkedConvert,
) {
  final val = ReverseImageLinkSearch200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => CommLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ReverseImageLinkSearch200ResponseToJson(
  ReverseImageLinkSearch200Response instance,
) => <String, dynamic>{'data': ?instance.data?.map((e) => e.toJson()).toList()};
