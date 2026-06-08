// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_comm_link_images_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCommLinkImagesRequest _$SearchCommLinkImagesRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SearchCommLinkImagesRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['query']);
  final val = SearchCommLinkImagesRequest(
    query: $checkedConvert('query', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$SearchCommLinkImagesRequestToJson(
  SearchCommLinkImagesRequest instance,
) => <String, dynamic>{'query': instance.query};
