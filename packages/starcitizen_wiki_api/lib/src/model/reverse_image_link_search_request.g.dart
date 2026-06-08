// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reverse_image_link_search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReverseImageLinkSearchRequest _$ReverseImageLinkSearchRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReverseImageLinkSearchRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['url']);
  final val = ReverseImageLinkSearchRequest(
    url: $checkedConvert('url', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$ReverseImageLinkSearchRequestToJson(
  ReverseImageLinkSearchRequest instance,
) => <String, dynamic>{'url': instance.url};
