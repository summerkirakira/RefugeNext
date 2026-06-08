import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for CommLinksApi
void main() {
  final instance = StarcitizenWikiApi().getCommLinksApi();

  group(CommLinksApi, () {
    // Comm-Link Reverse Image Similar Search
    //
    // Find Comm-Link images similar to an existing RSI-hosted image.
    //
    //Future<ReverseImageSearch200Response> findSimilarImages(int image, { int similarity }) async
    test('test findSimilarImages', () async {
      // TODO
    });

    // Comm-Link Detail
    //
    // Retrieve a single Comm-Link by its CIG ID. Images with hash and metadata are always included. The response contains prev_id and next_id metadata for sequential navigation between Comm-Links.
    //
    //Future<GetCommLink200Response> getCommLink(int id, { List<String> include }) async
    test('test getCommLink', () async {
      // TODO
    });

    // Comm-Link Image Detail
    //
    // Retrieve a single comm-link image with its associated Comm-Links (with channel, category, series), tags, duplicates, and base image when available.
    //
    //Future<GetCommLinkImage200Response> getCommLinkImage(int image) async
    test('test getCommLinkImage', () async {
      // TODO
    });

    // Comm-Link Images Random
    //
    // Retrieve random comm-link images (minimum 250 KB), optionally filtered by tag name. Only images without a base image are included.
    //
    //Future<ReverseImageSearch200Response> getRandomCommLinkImage({ int limit, String filterLeftSquareBracketTagsRightSquareBracket }) async
    test('test getRandomCommLinkImage', () async {
      // TODO
    });

    // Comm-Link Filters
    //
    // Returns available category, channel, and series filter values for Comm-Links, with occurrence counts. Providing additional filter parameters will narrow the facets accordingly.
    //
    //Future<ListCommLinkFilters200Response> listCommLinkFilters({ int filterLeftSquareBracketIdRightSquareBracket, String filterLeftSquareBracketTitleRightSquareBracket, String filterLeftSquareBracketContentRightSquareBracket, String filterLeftSquareBracketChannelRightSquareBracket, String filterLeftSquareBracketSeriesRightSquareBracket, String filterLeftSquareBracketCategoryRightSquareBracket, String filterLeftSquareBracketCreatedAtRightSquareBracket }) async
    test('test listCommLinkFilters', () async {
      // TODO
    });

    // Comm-Link Images
    //
    // List available comm-link images with pagination. Each image includes its associated Comm-Links (with channel, category, series), tags, duplicates, and base image when available.
    //
    //Future<ListCommLinkImages200Response> listCommLinkImages({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketTagsRightSquareBracket }) async
    test('test listCommLinkImages', () async {
      // TODO
    });

    // Comm-Links Overview
    //
    // Returns paginated comm-links ordered by descending ID by default. Supports filtering by channel, category, series, title, content, and publication date. Results can be sorted by id, title, images_count, links_count, channel, category, series, and created_at. Use the include parameter to embed images or links.
    //
    //Future<ListCommLinks200Response> listCommLinks({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, List<String> include, int filterLeftSquareBracketIdRightSquareBracket, String filterLeftSquareBracketTitleRightSquareBracket, String filterLeftSquareBracketContentRightSquareBracket, String filterLeftSquareBracketChannelRightSquareBracket, String filterLeftSquareBracketSeriesRightSquareBracket, String filterLeftSquareBracketCategoryRightSquareBracket, String filterLeftSquareBracketCreatedAtRightSquareBracket, String sort }) async
    test('test listCommLinks', () async {
      // TODO
    });

    // Comm-Link Reverse Image Link Search
    //
    // Return comm-links that reference the same RSI-hosted image URL.
    //
    //Future<ReverseImageLinkSearch200Response> reverseImageLinkSearch(ReverseImageLinkSearchRequest reverseImageLinkSearchRequest) async
    test('test reverseImageLinkSearch', () async {
      // TODO
    });

    // Comm-Link Reverse Image Search
    //
    // Search comm-links by uploading an image and specifying a similarity threshold. Requires the GD PHP extension.
    //
    //Future<ReverseImageSearch200Response> reverseImageSearch(MultipartFile image, { int similarity }) async
    test('test reverseImageSearch', () async {
      // TODO
    });

    // Comm-Link Image Search by filename
    //
    // Search comm-link images by filename with optional tag filtering. Only images without a base image and with non-zero file size are returned.
    //
    //Future<ReverseImageSearch200Response> searchCommLinkImages(SearchCommLinkImagesRequest searchCommLinkImagesRequest, { String filterLeftSquareBracketTagsRightSquareBracket }) async
    test('test searchCommLinkImages', () async {
      // TODO
    });

    // Comm-Link Search (Deprecated)
    //
    // Deprecated. Use GET /api/comm-links?filter[title]={value} for title search. This endpoint will be removed in a future version.
    //
    //Future<ListCommLinks200Response> searchCommLinksDeprecated(SearchCommLinksDeprecatedRequest searchCommLinksDeprecatedRequest, { String locale, List<String> include, String filterLeftSquareBracketChannelRightSquareBracket, String filterLeftSquareBracketSeriesRightSquareBracket, String filterLeftSquareBracketCategoryRightSquareBracket }) async
    test('test searchCommLinksDeprecated', () async {
      // TODO
    });

  });
}
