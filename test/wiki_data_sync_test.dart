import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/repo/base/versioned_list_repo.dart';
import 'package:refuge_next/src/repo/wiki_data_registry.dart';
import 'package:refuge_next/src/repo/wiki_data_sync.dart';

/// 最小假仓库:只实现 [WikiDataSync] 用到的 `listLocalVersions` /
/// `getSelectedVersion`,其余接口未用到,留空/抛出。
class _FakeRepo implements VersionedItemsRepo<int> {
  _FakeRepo({required this.locals});

  final List<String> locals;

  @override
  Future<List<String>> listLocalVersions() async => locals;

  @override
  Future<String?> getSelectedVersion() async =>
      locals.isEmpty ? null : locals.last;

  // —— 以下接口在本测试中未被调用 ——
  @override
  List<int> get itemsSync => const [];
  @override
  Future<List<int>> getItems() async => const [];
  @override
  Future<void> switchVersion(String version) async {}
  @override
  Future<DateTime?> lastUpdated(String version) async => null;
  @override
  Future<void> deleteVersion(String version) async {}
  @override
  Future<String?> fetchLatestVersion() async => null;
  @override
  Future<bool> checkForUpdate() async => false;
  @override
  Future<void> refresh() async {}
}

/// 包一层,记录刷新调用次数,并可注入「挂起」与「抛错」行为。
class _Probe {
  _Probe({
    required this.name,
    required this.locals,
    this.gate,
    this.throws = false,
  });

  final String name;
  final List<String> locals;

  /// 非空时刷新会等待该 Completer(用于制造并发窗口)。
  final Completer<void>? gate;
  final bool throws;
  int refreshCount = 0;

  WikiDataset get dataset => WikiDataset(
        name: name,
        repo: _FakeRepo(locals: locals),
        refresh: ({String? version}) async {
          refreshCount++;
          if (gate != null) await gate!.future;
          if (throws) throw StateError('boom $name');
        },
      );
}

void main() {
  setUp(() => WikiDataSync().resetForTest());
  tearDown(() => WikiDataSync().resetForTest());

  test('仅刷新本地缺目标版本的数据集', () async {
    final has = _Probe(name: 'has', locals: ['4.2']);
    final missing = _Probe(name: 'missing', locals: const []);
    final stale = _Probe(name: 'stale', locals: ['4.1']); // 缺 4.2 → 需刷新
    WikiDataSync().datasets = [has.dataset, missing.dataset, stale.dataset];

    final result = await WikiDataSync().syncMissing(version: '4.2');

    expect(has.refreshCount, 0);
    expect(missing.refreshCount, 1);
    expect(stale.refreshCount, 1);
    expect(result.skipped, ['has']);
    expect(result.succeeded, containsAll(<String>['missing', 'stale']));
    expect(result.failed, isEmpty);
  });

  test('并发调用 syncMissing 只触发一轮拉取', () async {
    final gate = Completer<void>();
    final p = _Probe(name: 'a', locals: const [], gate: gate);
    WikiDataSync().datasets = [p.dataset];

    final f1 = WikiDataSync().syncMissing(version: '4.2');
    final f2 = WikiDataSync().syncMissing(version: '4.2');
    expect(WikiDataSync().isRefreshing, isTrue);

    gate.complete();
    final r1 = await f1;
    final r2 = await f2;

    expect(p.refreshCount, 1); // 没有被重复触发
    expect(identical(r1, r2), isTrue); // 复用同一结果
    expect(WikiDataSync().isRefreshing, isFalse); // 结束后释放
  });

  test('单个数据集失败不影响其余,且计入 failed', () async {
    final bad = _Probe(name: 'bad', locals: const [], throws: true);
    final good = _Probe(name: 'good', locals: const []);
    WikiDataSync().datasets = [bad.dataset, good.dataset];

    final result = await WikiDataSync().syncMissing(version: '4.2');

    expect(good.refreshCount, 1);
    expect(result.succeeded, ['good']);
    expect(result.failed.keys, ['bad']);
    expect(result.failed['bad'], isA<StateError>());
  });

  test('inspect 标记需下载项', () async {
    final has = _Probe(name: 'has', locals: ['4.2']);
    final missing = _Probe(name: 'missing', locals: const []);
    WikiDataSync().datasets = [has.dataset, missing.dataset];

    final statuses = await WikiDataSync().inspect(version: '4.2');

    expect(statuses.firstWhere((s) => s.dataset.name == 'has').needsDownload,
        isFalse);
    expect(
        statuses.firstWhere((s) => s.dataset.name == 'missing').needsDownload,
        isTrue);
  });
}
