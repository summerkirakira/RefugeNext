import 'dart:io' as io;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/datasource/models/hangar.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_cover_image.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_item_widget.dart';

const original = 'https://example.invalid/package.jpg';
const expensive = 'https://example.invalid/expensive.jpg';
const cheap = 'https://example.invalid/cheap.jpg';

HangarSubItem ship(String url, int price, {String kind = 'Ship'}) =>
    HangarSubItem(
      id: url,
      image: url,
      packageId: 1,
      title: url,
      kind: kind,
      subtitle: '',
      insertTime: 0,
      price: price,
      fromShipPrice: 0,
      toShipPrice: 0,
    );

HangarItem package(List<HangarSubItem> items, {bool isUpgrade = false}) =>
    HangarItem(
      id: 1,
      idList: [1],
      name: 'Package',
      chineseName: '礼包',
      image: original,
      number: 2,
      status: 'Attributed',
      tags: [],
      date: '',
      contains: '',
      price: 10000,
      insurance: 'LTI',
      alsoContains: '',
      chineseAlsoContains: '',
      items: items,
      isUpgrade: isUpgrade,
      rawData: [],
      ownedBy: '',
      currentPrice: 10000,
      canGit: false,
      canReclaim: false,
      canUpgrade: false,
      page: 0,
    );

class _Model extends MainDataModel {
  @override
  bool get isVIP => false;
  @override
  Future<void> initUser() async {}
  @override
  Future<void> initialize() async {}
}

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
    if (url != successUrl) throw StateError('Image unavailable');
    final file = MemoryFileSystem().file('/image.jpg')
      ..writeAsBytesSync(io.File('assets/images/cirno_ai.jpg').readAsBytesSync());
    yield FileInfo(file, FileSource.Cache,
        DateTime.now().add(const Duration(days: 1)), url);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // 在首次读取前替换默认缓存，避免单元测试初始化平台文件系统。
  CachedNetworkImageProvider.defaultCacheManager = _ImageCache(null);

  test('开启后选择最高价舰船，按价格回退且不修改原数据', () {
    final item = package([ship(cheap, 10000), ship(expensive, 50000)]);
    final before = item.toJson();
    expect(hangarCoverImageUrls(item, preferShipImage: true),
        [expensive, cheap, original]);
    expect(item.toJson(), before);
    expect(hangarCoverImageUrls(item, preferShipImage: false), [original]);
  });

  test('最高价无图或无效 URL 时，选择下一艘有图的船', () {
    final item = package([
      ship('', 100000),
      ship('invalid-image', 90000),
      ship(cheap, 10000),
      ship(expensive, 50000),
    ]);
    expect(hangarCoverImageUrls(item, preferShipImage: true),
        [expensive, cheap, original]);
  });

  test('相同价格保留包内顺序，未知价格排最后，重复 URL 不重复尝试', () {
    final item = package([
      ship(cheap, 0),
      ship(expensive, 10000),
      ship('https://example.invalid/tie.jpg', 10000),
      ship(expensive, 20000),
    ]);
    expect(hangarCoverImageUrls(item, preferShipImage: true),
        [expensive, 'https://example.invalid/tie.jpg', cheap, original]);
  });

  test('单船、无图、无舰船和 CCU 按约定选择封面', () {
    expect(
        hangarCoverImageUrls(package([ship(cheap, 0)]), preferShipImage: true),
        [cheap, original]);
    for (final item in [
      package([]),
      package([ship('', 10000)]),
      package([ship(cheap, 10000, kind: 'Paint')]),
      package([ship(cheap, 10000)], isUpgrade: true),
    ]) {
      expect(hangarCoverImageUrls(item, preferShipImage: true), [original]);
    }
  });

  test('普通用户可切换，立即通知界面并持久化偏好', () async {
    SharedPreferences.setMockInitialValues({});
    final model = _Model();
    final restored = _Model();
    addTearDown(model.dispose);
    addTearDown(restored.dispose);
    await model.loadPreferHangarShipImageSetting();
    expect(model.preferHangarShipImage, isFalse);
    var notifications = 0;
    model.addListener(() => notifications++);
    final save = model.setPreferHangarShipImage(true);
    expect(model.preferHangarShipImage, isTrue);
    expect(notifications, 1);
    await save;
    await restored.loadPreferHangarShipImageSetting();
    expect(restored.preferHangarShipImage, isTrue);
    await model.setPreferHangarShipImage(false);
    await restored.loadPreferHangarShipImageSetting();
    expect(restored.preferHangarShipImage, isFalse);
  });

  for (final successUrl in [cheap, original, null]) {
    testWidgets('图片请求失败后逐级回退到 $successUrl', (tester) async {
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
          child: HangarItemImageWidget(
            hangarItem: package([ship(cheap, 10000), ship(expensive, 50000)]),
            preferShipImage: true,
          ),
        ),
      ));
      if (successUrl != null) {
        // 图片解码由引擎异步完成，需要退出测试的 fake async 时钟。
        for (var i = 0; i < 3; i++) {
          await tester.pump();
        }
        await tester.runAsync(() => precacheImage(
              CachedNetworkImageProvider(successUrl),
              tester.element(find.byType(HangarCoverImage)),
            ));
      }
      await tester.pumpAndSettle();
      expect(
          cache.requests,
          successUrl == cheap
              ? [expensive, cheap]
              : [expensive, cheap, original]);
      expect(find.byIcon(Icons.error),
          successUrl == null ? findsOneWidget : findsNothing);
      expect(find.text('x2'), findsOneWidget);
      expect(find.text('LTI'), findsOneWidget);
      expect(
          tester.getSize(find.byType(HangarCoverImage)), const Size(100, 100));
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('默认机库卡片保持原封面，显式开启后才替换', (tester) async {
    final previous = CachedNetworkImageProvider.defaultCacheManager;
    CachedNetworkImageProvider.defaultCacheManager = _ImageCache(null);
    addTearDown(() {
      CachedNetworkImageProvider.defaultCacheManager = previous;
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();
    });
    final item = package([ship(expensive, 10000)]);
    for (final enabled in [false, true, false]) {
      await tester.pumpWidget(MaterialApp(
        home: HangarItemWidget(
          hangarItem: item,
          onTap: (_, __) {},
          preferShipImage: enabled,
        ),
      ));
      final image = tester
          .widget<CachedNetworkImage>(find.byType(CachedNetworkImage).first);
      expect(image.imageUrl, enabled ? expensive : original);
      await tester.pumpAndSettle();
    }
  });
}
