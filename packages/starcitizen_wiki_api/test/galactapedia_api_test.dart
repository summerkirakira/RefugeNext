import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for GalactapediaApi
void main() {
  final instance = StarcitizenWikiApi().getGalactapediaApi();

  group(GalactapediaApi, () {
    // Galactapedia Article
    //
    // Retrieve a Galactapedia article by ID with available includes and translations.
    //
    //Future<GetGalactapediaArticle200Response> getGalactapediaArticle(String id, { String locale, List<String> include }) async
    test('test getGalactapediaArticle', () async {
      // TODO
    });

    // Galactapedia Overview
    //
    // Returns paginated Galactapedia articles ordered by descending ID by default. Each article includes its templates, categories, and tags. Supports filtering by category, tag, template, title, and creation date. Results can be sorted by title, categories_count, tags_count, and related_articles_count.
    //
    //Future<ListGalactapediaArticles200Response> listGalactapediaArticles({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketCategoryRightSquareBracket, String filterLeftSquareBracketTagRightSquareBracket, String filterLeftSquareBracketTemplateRightSquareBracket, String filterLeftSquareBracketTitleRightSquareBracket, String filterLeftSquareBracketCreatedAtRightSquareBracket, String sort }) async
    test('test listGalactapediaArticles', () async {
      // TODO
    });

    // Galactapedia Filters
    //
    // Returns available category, tag, and template filter values for Galactapedia articles, with occurrence counts. Providing additional filter parameters will narrow the facets accordingly.
    //
    //Future<ListGalactapediaFilters200Response> listGalactapediaFilters({ String filterLeftSquareBracketCategoryRightSquareBracket, String filterLeftSquareBracketTagRightSquareBracket, String filterLeftSquareBracketTemplateRightSquareBracket, String filterLeftSquareBracketTitleRightSquareBracket, String filterLeftSquareBracketCreatedAtRightSquareBracket }) async
    test('test listGalactapediaFilters', () async {
      // TODO
    });

    // Galactapedia Article Search (Deprecated)
    //
    // Deprecated. Use GET /api/galactapedia?filter[title]={value} for title search. This endpoint will be removed in a future version.
    //
    //Future<SearchGalactapediaDeprecated200Response> searchGalactapediaDeprecated(Object body) async
    test('test searchGalactapediaDeprecated', () async {
      // TODO
    });

  });
}
