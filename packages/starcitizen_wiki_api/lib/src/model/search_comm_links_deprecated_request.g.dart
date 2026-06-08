// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_comm_links_deprecated_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCommLinksDeprecatedRequest _$SearchCommLinksDeprecatedRequestFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('SearchCommLinksDeprecatedRequest', json, ($checkedConvert) {
      final val = SearchCommLinksDeprecatedRequest(
        keyword: $checkedConvert('keyword', (v) => v as String?),
        query: $checkedConvert('query', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$SearchCommLinksDeprecatedRequestToJson(
  SearchCommLinksDeprecatedRequest instance,
) => <String, dynamic>{'keyword': ?instance.keyword, 'query': ?instance.query};
