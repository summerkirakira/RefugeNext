import 'package:flutter/foundation.dart';

import '../network/wiki/wiki_api.dart';
import 'base/versioned_json_store.dart';
import 'game_version_manager.dart';
import 'wiki_data_registry.dart';

/// 单个数据集的「是否需下载」状态(供面板展示)。
class WikiDatasetStatus {
  final WikiDataset dataset;

  /// 本地当前选中的版本码;无本地数据为 null。
  final String? localVersion;

  /// 是否需要下载(本地缺目标版本,或目标版本未知时本地为空)。
  final bool needsDownload;

  const WikiDatasetStatus({
    required this.dataset,
    required this.localVersion,
    required this.needsDownload,
  });
}

/// 一键同步过程中的进度(逐个数据集推进)。
class WikiSyncProgress {
  /// 当前正在刷新的数据集名。
  final String name;

  /// 已完成的数据集数。
  final int done;

  /// 待刷新的数据集总数。
  final int total;

  const WikiSyncProgress({
    required this.name,
    required this.done,
    required this.total,
  });
}

/// 一键同步的结果汇总。
class WikiSyncResult {
  /// 刷新成功的数据集名。
  final List<String> succeeded;

  /// 刷新失败的数据集名 → 错误对象。
  final Map<String, Object> failed;

  /// 本地已是目标版本、无需刷新而跳过的数据集名。
  final List<String> skipped;

  const WikiSyncResult({
    required this.succeeded,
    required this.failed,
    required this.skipped,
  });

  /// 实际尝试刷新(成功+失败)的数据集总数。
  int get attempted => succeeded.length + failed.length;
}

/// 统一刷新全部 wiki 数据的协调器(单例)。
///
/// 职责:
/// - [inspect] 解析目标版本后,纯本地判断每个数据集是否「缺失/有更新」;
/// - [syncMissing] 仅下载需更新的数据集,顺序拉取、逐项回报进度、单项失败不中断;
/// - 通过 [_inflight] 提供**并发去重**:进行中再次调用复用同一 Future,
///   避免下拉刷新过程中被重复触发拉取。
class WikiDataSync {
  static final WikiDataSync _instance = WikiDataSync._internal();
  WikiDataSync._internal();
  factory WikiDataSync() => _instance;

  Future<WikiSyncResult>? _inflight;

  /// 待同步的数据集列表;默认全部 [kWikiDatasets]。仅供测试注入假数据集。
  @visibleForTesting
  List<WikiDataset> datasets = kWikiDatasets;

  /// 重置内部状态(供测试隔离用例)。
  @visibleForTesting
  void resetForTest() {
    _inflight = null;
    datasets = kWikiDatasets;
  }

  /// 是否有同步正在进行。
  bool get isRefreshing => _inflight != null;

  /// 解析「目标版本」:显式 [version] 优先;否则用全局选中版本;
  /// 全局也为空(=最新/默认)时,联网取服务端默认版本码。失败返回 null。
  Future<String?> _resolveTargetVersion(String? version) async {
    final explicit = version ?? GameVersionManager().version;
    if (explicit != null && explicit.isNotEmpty) {
      return explicit;
    }
    return WikiApiClient().getDefaultGameVersionCode();
  }

  /// 某数据集在 [target] 版本下是否需下载。
  ///
  /// - 目标版本已知:本地无该版本 → 需下载(覆盖「未下载」和「有新版本」两种);
  /// - 目标版本未知(离线且未指定):仅当本地完全无数据时才需下载,避免离线时
  ///   误判全部数据集都要重拉。
  bool _needsDownload(List<String> localVersions, String? target) {
    if (target == null || target.isEmpty) {
      return localVersions.isEmpty;
    }
    return !localVersions.contains(VersionedJsonStore.sanitizeVersion(target));
  }

  /// 检视所有数据集相对 [version] 的下载状态(不触发刷新)。
  Future<List<WikiDatasetStatus>> inspect({String? version}) async {
    final target = await _resolveTargetVersion(version);
    final out = <WikiDatasetStatus>[];
    for (final ds in datasets) {
      final locals = await ds.repo.listLocalVersions();
      out.add(WikiDatasetStatus(
        dataset: ds,
        localVersion: await ds.repo.getSelectedVersion(),
        needsDownload: _needsDownload(locals, target),
      ));
    }
    return out;
  }

  /// 仅下载「缺失/有更新」的数据集。
  ///
  /// 并发去重:已有同步进行时,直接返回正在进行的 Future(忽略本次的
  /// [onProgress])。[version] 为 null 时按全局/默认版本解析。
  Future<WikiSyncResult> syncMissing({
    String? version,
    void Function(WikiSyncProgress)? onProgress,
  }) {
    final existing = _inflight;
    if (existing != null) {
      return existing;
    }
    final fut = _run(version, onProgress).whenComplete(() => _inflight = null);
    _inflight = fut;
    return fut;
  }

  Future<WikiSyncResult> _run(
    String? version,
    void Function(WikiSyncProgress)? onProgress,
  ) async {
    final target = await _resolveTargetVersion(version);

    // 1. 筛出需下载的数据集(纯本地判断)。
    final pending = <WikiDataset>[];
    final skipped = <String>[];
    for (final ds in datasets) {
      final locals = await ds.repo.listLocalVersions();
      if (_needsDownload(locals, target)) {
        pending.add(ds);
      } else {
        skipped.add(ds.name);
      }
    }

    // 2. 顺序刷新,逐项回报进度;单项失败计入 failed 并继续。
    final succeeded = <String>[];
    final failed = <String, Object>{};
    var done = 0;
    for (final ds in pending) {
      onProgress?.call(WikiSyncProgress(
        name: ds.name,
        done: done,
        total: pending.length,
      ));
      try {
        await ds.refresh(version: version);
        succeeded.add(ds.name);
      } catch (e) {
        failed[ds.name] = e;
      }
      done++;
    }
    // 末尾再回报一次,让 UI 显示「全部完成」。
    onProgress?.call(WikiSyncProgress(
      name: '',
      done: done,
      total: pending.length,
    ));

    return WikiSyncResult(
      succeeded: succeeded,
      failed: failed,
      skipped: skipped,
    );
  }
}
