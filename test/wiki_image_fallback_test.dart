import 'dart:convert';
import 'dart:io' as io;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto/crypto.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/widgets/common/wiki_image_fallback.dart';

const eclipseUrl =
    'https://media.starcitizen.tools/thumb/b/bd/Aegis_Eclipse_over_Magda.png/600px-Aegis_Eclipse_over_Magda.png.webp?htmpc';
const eclipseMirror =
    'https://image.biaoju.site/starcitizen/wiki/images/93b33a4a52d312ee62478a115f5e23bc8afcdbcc5ae9e8fb8c51e51659cd7e94.webp';

class _ImageCache extends Fake implements BaseCacheManager {
  _ImageCache(this.successUrl);
  final String? successUrl;
  final requests = <String>[];

  @override
  Stream<FileResponse> getFileStream(String url,
      {String? key,
      Map<String, String>? headers,
      bool withProgress = false}) async* {
    requests.add(url);
    if (url != successUrl) throw StateError('404 Image unavailable');
    final file = MemoryFileSystem().file('/image.jpg')
      ..writeAsBytesSync(
          io.File('assets/images/cirno_ai.jpg').readAsBytesSync());
    yield FileInfo(file, FileSource.Cache,
        DateTime.now().add(const Duration(days: 1)), url);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  CachedNetworkImageProvider.defaultCacheManager = _ImageCache(null);
  group('wikiImageFallbackUrl', () {
    String sha(String s) => sha256.convert(utf8.encode(s)).toString();

    test('对完整 url 整串算 sha256，兼容已有镜像', () {
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

  test('日蚀参数地址保留旧镜像，并回退到手机验证可用的无参数镜像', () {
    expect(wikiImageFallbackUrls(eclipseUrl), [
      wikiImageFallbackUrl(eclipseUrl),
      eclipseMirror,
    ]);
  });

  test('无参数地址去重，空地址无请求', () {
    const url = 'https://media.starcitizen.tools/a/a1/Ship.webp';
    expect(wikiImageFallbackUrls(url), [wikiImageFallbackUrl(url)]);
    expect(wikiImageFallbackUrls(null), isEmpty);
    expect(wikiImageFallbackUrls(''), isEmpty);
  });

  test('只移除查询参数和片段，保留原路径编码', () {
    const base = 'https://media.starcitizen.tools/a/a1/Ship%20%23%3F.webp';
    for (final suffix in ['?cache=1#preview', '#preview', '?', '#']) {
      expect(wikiImageFallbackUrls('$base$suffix'), [
        wikiImageFallbackUrl('$base$suffix'),
        wikiImageFallbackUrl(base),
      ]);
    }
  });

  for (final successUrl in [
    wikiImageFallbackUrl(eclipseUrl),
    eclipseMirror,
    null
  ]) {
    testWidgets('镜像逐级回退，成功于 $successUrl', (tester) async {
      final cache = _ImageCache(successUrl);
      final previous = CachedNetworkImageProvider.defaultCacheManager;
      CachedNetworkImageProvider.defaultCacheManager = cache;
      addTearDown(() {
        CachedNetworkImageProvider.defaultCacheManager = previous;
        PaintingBinding.instance.imageCache.clear();
        PaintingBinding.instance.imageCache.clearLiveImages();
      });
      await tester.pumpWidget(MaterialApp(
        home: Center(
            child: SizedBox(
          width: 132,
          height: 118,
          child: wikiImageFallback(
            eclipseUrl,
            onFail: const Icon(Icons.broken_image_outlined),
            imageBuilder: (context, provider) => Image(
              key: const ValueKey('loaded-mirror'),
              image: provider,
              fit: BoxFit.cover,
            ),
          ),
        )),
      ));
      if (successUrl != null) {
        for (var i = 0; i < 3; i++) {
          await tester.pump();
        }
        await tester.runAsync(() => precacheImage(
              CachedNetworkImageProvider(successUrl),
              tester.element(find.byType(Center)),
            ));
      }
      await tester.pumpAndSettle();
      expect(
          cache.requests,
          successUrl == wikiImageFallbackUrl(eclipseUrl)
              ? [successUrl]
              : wikiImageFallbackUrls(eclipseUrl));
      expect(find.byIcon(Icons.broken_image_outlined),
          successUrl == null ? findsOneWidget : findsNothing);
      expect(find.byKey(const ValueKey('loaded-mirror')),
          successUrl == null ? findsNothing : findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
