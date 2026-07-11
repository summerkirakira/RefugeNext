import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/widgets/common/wiki_image_fallback.dart';

void main() {
  group('wikiImageFallbackUrl', () {
    String sha(String s) => sha256.convert(utf8.encode(s)).toString();

    test('对完整 url 整串算 sha256（与服务端 pipeline 一致）', () {
      const url =
          'https://media.starcitizen.tools/thumb/0/00/Aurora_MR.jpg/600px-Aurora_MR.jpg.webp';
      final fb = wikiImageFallbackUrl(url)!;
      expect(
        fb,
        'https://image.biaoju.site/starcitizen/wiki/images/${sha(url)}.webp',
      );
    });

    test('原图 url：整串算 sha256，不取 basename', () {
      const url = 'https://media.starcitizen.tools/3/34/Avenger_Stalker.jpg';
      expect(wikiImageFallbackUrl(url), endsWith('${sha(url)}.webp'));
      expect(
        wikiImageFallbackUrl(url),
        startsWith('https://image.biaoju.site/starcitizen/wiki/images/'),
      );
    });

    test('query/fragment 也算进 hash（整串原样，不截断）', () {
      const url = 'https://x/y/Foo.png?width=600';
      expect(wikiImageFallbackUrl(url), endsWith('${sha(url)}.webp'));
    });

    test('null / 空 返回 null', () {
      expect(wikiImageFallbackUrl(null), isNull);
      expect(wikiImageFallbackUrl(''), isNull);
    });
  });
}
