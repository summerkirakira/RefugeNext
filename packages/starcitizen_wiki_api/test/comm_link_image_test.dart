import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for CommLinkImage
void main() {
  final CommLinkImage? instance = /* CommLinkImage(...) */ null;
  // TODO add properties to the entity

  group(CommLinkImage, () {
    // Internal database identifier.
    // int id
    test('to test the property `id`', () async {
      // TODO
    });

    // File name or path segment of the image.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // Full URL to the image on the RSI media CDN.
    // String rsiUrl
    test('to test the property `rsiUrl`', () async {
      // TODO
    });

    // API URL for this image resource.
    // String apiUrl
    test('to test the property `apiUrl`', () async {
      // TODO
    });

    // Alternative text for the image.
    // String alt
    test('to test the property `alt`', () async {
      // TODO
    });

    // File size in bytes.
    // int size
    test('to test the property `size`', () async {
      // TODO
    });

    // MIME type of the image file.
    // String mimeType
    test('to test the property `mimeType`', () async {
      // TODO
    });

    // ISO 8601 timestamp of when the image was last modified on the CDN.
    // DateTime lastModified
    test('to test the property `lastModified`', () async {
      // TODO
    });

    // Tags associated with the image when the `tags` relation is loaded.
    // List<CommLinkImageTagsInner> tags
    test('to test the property `tags`', () async {
      // TODO
    });

    // API URL to find visually similar images.
    // String similarUrl
    test('to test the property `similarUrl`', () async {
      // TODO
    });

    // Comm-Links that reference this image, included when the `commLinks` relation is loaded.
    // List<CommLinkImageCommLinksInner> commLinks
    test('to test the property `commLinks`', () async {
      // TODO
    });

    // Duplicate images that share the same base image, included when the `duplicates` relation is loaded.
    // List<CommLinkImageDuplicatesInner> duplicates
    test('to test the property `duplicates`', () async {
      // TODO
    });

    // CommLinkImageBaseImage baseImage
    test('to test the property `baseImage`', () async {
      // TODO
    });

    // Similarity percentage to the search image. Only present in reverse image search results.
    // int similarity
    test('to test the property `similarity`', () async {
      // TODO
    });

  });
}
