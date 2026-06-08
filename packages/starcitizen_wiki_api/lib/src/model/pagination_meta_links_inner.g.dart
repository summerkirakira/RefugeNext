// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_meta_links_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationMetaLinksInner _$PaginationMetaLinksInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PaginationMetaLinksInner', json, ($checkedConvert) {
  final val = PaginationMetaLinksInner(
    url: $checkedConvert('url', (v) => v as String?),
    label: $checkedConvert('label', (v) => v as String?),
    active: $checkedConvert('active', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$PaginationMetaLinksInnerToJson(
  PaginationMetaLinksInner instance,
) => <String, dynamic>{
  'url': ?instance.url,
  'label': ?instance.label,
  'active': ?instance.active,
};
