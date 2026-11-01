import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/services/update/app_update_controller.dart';
import 'package:refuge_next/src/widgets/update/app_update_sheet.dart';
import 'support/update_backend_fake.dart';

Future<void> drainIO(WidgetTester tester, bool Function() done) async {
  for (var i = 0; i < 200 && !done(); i++) {
    await tester
        .runAsync(() => Future<void>.delayed(const Duration(milliseconds: 5)));
    await tester.pump();
  }
  expect(done(), true);
  await tester.pump();
}

void main() {
  late Directory directory;
  late UpdateBackendFake backend;
  late AppUpdateController controller;
  setUp(() async {
    directory = await Directory.systemTemp.createTemp('update-sheet-');
    backend = UpdateBackendFake(directory);
    controller = AppUpdateController(backend);
    await controller.check();
  });
  tearDown(() async {
    controller.dispose();
    await directory.delete(recursive: true);
  });

  Future<void> mount(WidgetTester tester,
      {Brightness brightness = Brightness.light, double scale = 1}) async {
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: brightness),
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(scale)),
          child: child!),
      home: Scaffold(
          body: Builder(
              builder: (context) => TextButton(
                  onPressed: () =>
                      showAppUpdateSheet(context, controller: controller),
                  child: const Text('打开更新')))),
    ));
    await tester.tap(find.text('打开更新'));
    await tester.pumpAndSettle();
  }

  for (final brightness in Brightness.values) {
    testWidgets(
        'full notes scroll without overflow in $brightness at large text',
        (tester) async {
      tester.view.physicalSize = const Size(360, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      backend.release = AppRelease(
          code: 443,
          name: '4.6.3',
          url: backend.release.url,
          notes: List.filled(25, '这是一条完整的更新说明。').join('\n'));
      await tester.runAsync(() => controller.check());
      await mount(tester, brightness: brightness, scale: 1.8);
      expect(find.text(backend.release.notes), findsOneWidget);
      await tester.scrollUntilVisible(find.text('下载更新'), 400,
          scrollable: find.byType(Scrollable).last);
      expect(tester.takeException(), isNull);
      await tester.tap(find.text('稍后'));
      await tester.pumpAndSettle();
    });
  }

  testWidgets(
      'closing download keeps task; reopening shows ready without automatic install',
      (tester) async {
    backend.downloadGate = Completer();
    await mount(tester);
    await tester.tap(find.text('下载更新'));
    await drainIO(tester, () => backend.progress != null);
    await tester.tap(find.byTooltip('关闭'));
    // The sheet is gone; its completion continuation must not launch an installer.
    await tester.pumpAndSettle();
    backend.downloadGate!.complete();
    await drainIO(tester, () => controller.phase == UpdatePhase.ready);
    expect(backend.installs, 0);
    await tester.tap(find.text('打开更新'));
    await tester.pumpAndSettle();
    expect(find.text('下载完成，可以安装'), findsOneWidget);
    await tester.tap(find.text('安装更新'));
    await drainIO(tester, () => backend.installs == 1);
    expect(find.text('安装已交给系统，可再次安装'), findsOneWidget);
    await tester.tap(find.text('再次安装'));
    await drainIO(tester, () => backend.installs == 2);
    expect(backend.downloads, 1);
    await tester.tap(find.byTooltip('关闭'));
    await tester.pumpAndSettle();
  });

  testWidgets(
      'visible download continues into installation; permission return is explicit',
      (tester) async {
    backend.permission = false;
    await mount(tester);
    await tester.tap(find.text('下载更新'));
    await drainIO(
        tester, () => controller.phase == UpdatePhase.permissionRequired);
    expect(find.text('允许安装'), findsOneWidget);
    await tester.tap(find.text('允许安装'));
    await tester.pump();
    expect(backend.settings, 1);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    backend.permission = true;
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await drainIO(tester, () => backend.installs == 1);
    expect(backend.downloads, 1);
    await tester.tap(find.byTooltip('关闭'));
    await tester.pumpAndSettle();
  });

  testWidgets(
      'download completing in background does not launch installer on resume',
      (tester) async {
    backend.downloadGate = Completer();
    await mount(tester);
    await tester.tap(find.text('下载更新'));
    await drainIO(tester, () => backend.progress != null);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    backend.downloadGate!.complete();
    await drainIO(tester, () => controller.phase == UpdatePhase.ready);
    expect(backend.installs, 0);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    expect(backend.installs, 0);
    await tester.tap(find.byTooltip('关闭'));
    await tester.pumpAndSettle();
  });

  testWidgets(
      'network failure offers retry and unknown size never shows bogus percentage',
      (tester) async {
    backend.unknownSize = true;
    backend.downloadGate = Completer();
    await mount(tester);
    await tester.tap(find.text('下载更新'));
    await drainIO(tester, () => backend.progress != null);
    expect(
        tester
            .widget<LinearProgressIndicator>(
                find.byType(LinearProgressIndicator))
            .value,
        isNull);
    expect(find.textContaining('%'), findsNothing);
    backend.failDownload = true;
    backend.downloadGate!.complete();
    await drainIO(tester, () => controller.phase == UpdatePhase.error);
    expect(find.text('重新下载'), findsOneWidget);
    expect(find.textContaining('网络'), findsOneWidget);
    await tester.tap(find.byTooltip('关闭'));
    await tester.pumpAndSettle();
  });
}
