// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationLinks _$PaginationLinksFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PaginationLinks', json, ($checkedConvert) {
      final val = PaginationLinks(
        first: $checkedConvert('first', (v) => v as String?),
        last: $checkedConvert('last', (v) => v as String?),
        prev: $checkedConvert('prev', (v) => v as String?),
        next: $checkedConvert('next', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$PaginationLinksToJson(PaginationLinks instance) =>
    <String, dynamic>{
      'first': ?instance.first,
      'last': ?instance.last,
      'prev': ?instance.prev,
      'next': ?instance.next,
    };
