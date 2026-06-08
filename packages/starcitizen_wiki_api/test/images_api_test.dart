import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for ImagesApi
void main() {
  final instance = StarcitizenWikiApi().getImagesApi();

  group(ImagesApi, () {
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

    // Comm-Link Images
    //
    // List available comm-link images with pagination. Each image includes its associated Comm-Links (with channel, category, series), tags, duplicates, and base image when available.
    //
    //Future<ListCommLinkImages200Response> listCommLinkImages({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketTagsRightSquareBracket }) async
    test('test listCommLinkImages', () async {
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

  });
}
