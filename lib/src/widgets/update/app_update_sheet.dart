import 'dart:async';

import 'package:flutter/material.dart';

import '../../services/update/app_update_controller.dart';

Future<void>? _openSheet;
bool get isUpdateSheetOpen => _openSheet != null;

Future<void> showAppUpdateSheet(BuildContext context,
    {AppUpdateController? controller}) {
  if (_openSheet != null) return _openSheet!;
  final task = showModalBottomSheet<void>(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    showDragHandle: false,
    // Match the R16 top corners of the hangar's Wolt detail sheet.
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    clipBehavior: Clip.antiAlias,
    constraints: const BoxConstraints(maxWidth: 600),
    builder: (_) =>
        AppUpdateSheet(controller: controller ?? AppUpdateController.instance),
  );
  return _openSheet = task.whenComplete(() => _openSheet = null);
}

class AppUpdateSheet extends StatefulWidget {
  const AppUpdateSheet({super.key, required this.controller});
  final AppUpdateController controller;
  @override
  State<AppUpdateSheet> createState() => _AppUpdateSheetState();
}

class _AppUpdateSheetState extends State<AppUpdateSheet>
    with WidgetsBindingObserver {
  bool _waitingForPermission = false;
  AppUpdateController get controller => widget.controller;

  bool get _active =>
      mounted &&
      (WidgetsBinding.instance.lifecycleState == null ||
          WidgetsBinding.instance.lifecycleState ==
              AppLifecycleState.resumed) &&
      (ModalRoute.of(context)?.isCurrent ?? true);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (controller.phase == UpdatePhase.idle ||
        controller.phase == UpdatePhase.upToDate ||
        (controller.phase == UpdatePhase.error &&
            controller.failure == UpdateFailure.check)) {
      unawaited(controller.check());
    } else if (controller.phase == UpdatePhase.permissionRequired) {
      unawaited(controller.refreshPermission());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _waitingForPermission) {
      _waitingForPermission = false;
      if (_active) unawaited(controller.resumePermission());
    }
  }

  Future<void> _download() async {
    if (await controller.download() && !controller.requiresRestart && _active) {
      await controller.install();
    }
  }

  Future<void> _permission() async {
    _waitingForPermission = true;
    if (!await controller.openPermissionSettings()) {
      _waitingForPermission = false;
    }
  }

  String _bytes(int bytes) => '${(bytes / 1024 / 1024).toStringAsFixed(1)} MB';

  String get _status => switch (controller.phase) {
        UpdatePhase.idle || UpdatePhase.checking => '正在检查更新…',
        UpdatePhase.available => '新版本已就绪',
        UpdatePhase.downloading => '正在下载更新',
        UpdatePhase.validating => '正在验证安装包…',
        UpdatePhase.ready =>
          controller.requiresRestart ? '下载完成，重启后更新' : '下载完成，可以安装',
        UpdatePhase.restarting => '正在准备重启更新…',
        UpdatePhase.unavailable => controller.error ?? '暂无可用更新包',
        UpdatePhase.permissionRequired => '需要允许安装应用',
        UpdatePhase.installRequested => '安装已交给系统，可再次安装',
        UpdatePhase.upToDate => '已是最新版本',
        UpdatePhase.error => controller.error ?? '更新失败，请重试',
      };

  Widget _primary() {
    final c = controller;
    final String label;
    final VoidCallback action;
    if (c.phase == UpdatePhase.permissionRequired) {
      label = '允许安装';
      action = _permission;
    } else if (c.hasPackage) {
      label = c.requiresRestart
          ? '重启并更新'
          : c.phase == UpdatePhase.installRequested
              ? '再次安装'
              : '安装更新';
      action = () => c.install();
    } else if (c.phase == UpdatePhase.upToDate ||
        c.phase == UpdatePhase.unavailable ||
        c.failure == UpdateFailure.check) {
      label = '重新检查';
      action = () => c.check();
    } else {
      label = c.phase == UpdatePhase.error ? '重新下载' : '下载更新';
      action = _download;
    }
    return FilledButton(onPressed: action, child: Text(label));
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          final c = controller;
          final theme = Theme.of(context);
          final downloading = c.phase == UpdatePhase.downloading;
          final waiting = c.busy || c.phase == UpdatePhase.idle;
          return SafeArea(
            top: false,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height * .85),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 4),
                    child: Center(
                      child: Container(
                        width: 36,
                        height: 4,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onSurfaceVariant
                              .withValues(alpha: .35),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(children: [
                            Expanded(
                                child: Text('应用更新',
                                    style: theme.textTheme.titleLarge)),
                            if (!waiting)
                              IconButton(
                                  tooltip: '检查最新版本',
                                  onPressed: () => c.check(),
                                  icon: const Icon(Icons.refresh_rounded)),
                            IconButton(
                                tooltip: '关闭',
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(Icons.close_rounded)),
                          ]),
                          const SizedBox(height: 4),
                          if (c.installed != null)
                            Text(
                                '当前版本 ${c.installed!.name}（${c.installed!.code}）',
                                style: theme.textTheme.bodySmall),
                          if (c.release != null) ...[
                            const SizedBox(height: 8),
                            Text('新版本 ${c.release!.name}',
                                style: theme.textTheme.headlineSmall),
                            const SizedBox(height: 10),
                            Text(c.release!.notes,
                                style: theme.textTheme.bodyMedium),
                          ],
                          const SizedBox(height: 16),
                          Text(_status,
                              style: theme.textTheme.titleSmall?.copyWith(
                                  color: c.phase == UpdatePhase.error
                                      ? theme.colorScheme.error
                                      : null)),
                          if (c.error != null &&
                              c.phase != UpdatePhase.unavailable &&
                              c.phase != UpdatePhase.error) ...[
                            const SizedBox(height: 8),
                            Text(c.error!),
                          ],
                          if (waiting) ...[
                            const SizedBox(height: 12),
                            LinearProgressIndicator(
                                value: downloading ? c.progress : null),
                            if (downloading) ...[
                              const SizedBox(height: 8),
                              Text(c.total > 0
                                  ? '${(c.progress! * 100).floor()}% · ${_bytes(c.received)} / ${_bytes(c.total)}'
                                  : '已下载 ${_bytes(c.received)}'),
                              const SizedBox(height: 8),
                              Text('关闭此窗口后可继续使用 App，稍后从设置查看进度。',
                                  style: theme.textTheme.bodySmall),
                            ],
                          ],
                          if (c.phase == UpdatePhase.permissionRequired) ...[
                            const SizedBox(height: 8),
                            const Text(
                                '请在系统设置中允许星河避难所安装应用，返回后继续安装。安装包已保留，无需重新下载。'),
                          ],
                          const SizedBox(height: 16),
                          if (downloading)
                            OutlinedButton(
                                onPressed: () => c.cancelDownload(),
                                child: const Text('取消下载'))
                          else if (!waiting) ...[
                            _primary(),
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('稍后')),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}

String updateSettingsSubtitle(AppUpdateController c) => switch (c.phase) {
      UpdatePhase.unavailable => c.error ?? '暂无可用更新包',
      UpdatePhase.restarting => '正在准备重启更新',
      UpdatePhase.checking => '正在检查更新',
      UpdatePhase.downloading =>
        c.progress == null ? '正在下载更新' : '正在下载 ${(c.progress! * 100).floor()}%',
      UpdatePhase.validating => '正在验证安装包',
      UpdatePhase.ready ||
      UpdatePhase.permissionRequired ||
      UpdatePhase.installRequested =>
        c.requiresRestart ? '下载完成，点击重启更新' : '下载完成，点击安装',
      UpdatePhase.error => c.hasPackage
          ? '安装未完成，点击重试'
          : c.failure == UpdateFailure.download
              ? '下载失败，点击重试'
              : '检查失败，点击重试',
      UpdatePhase.available => '发现新版本 ${c.release?.name ?? ''}',
      UpdatePhase.upToDate => '已是最新版本',
      UpdatePhase.idle => '查看是否有可用更新',
    };
