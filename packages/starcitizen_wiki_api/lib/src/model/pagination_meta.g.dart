// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationMeta _$PaginationMetaFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PaginationMeta',
  json,
  ($checkedConvert) {
    final val = PaginationMeta(
      currentPage: $checkedConvert('current_page', (v) => (v as num?)?.toInt()),
      from: $checkedConvert('from', (v) => (v as num?)?.toInt()),
      lastPage: $checkedConvert('last_page', (v) => (v as num?)?.toInt()),
      perPage: $checkedConvert('per_page', (v) => (v as num?)?.toInt()),
      to: $checkedConvert('to', (v) => (v as num?)?.toInt()),
      total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
      links: $checkedConvert(
        'links',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  PaginationMetaLinksInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      path: $checkedConvert('path', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'currentPage': 'current_page',
    'lastPage': 'last_page',
    'perPage': 'per_page',
  },
);

Map<String, dynamic> _$PaginationMetaToJson(PaginationMeta instance) =>
    <String, dynamic>{
      'current_page': ?instance.currentPage,
      'from': ?instance.from,
      'last_page': ?instance.lastPage,
      'per_page': ?instance.perPage,
      'to': ?instance.to,
      'total': ?instance.total,
      'links': ?instance.links?.map((e) => e.toJson()).toList(),
      'path': ?instance.path,
    };
