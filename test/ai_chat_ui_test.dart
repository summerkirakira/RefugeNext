import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/preview/ai_chat_preview.dart';
import 'package:refuge_next/src/datasource/ai_chat_model.dart';
import 'package:refuge_next/src/datasource/models/ai/ai_message.dart';
import 'package:refuge_next/src/datasource/models/ai/ai_stream_event.dart';
import 'package:refuge_next/src/widgets/ai_chat/ai_chat_components.dart';
import 'package:refuge_next/src/widgets/ai_chat/ai_chat_page.dart';

class ControlledRepo extends PreviewAiRepo {
  var events = StreamController<AiStreamEvent>();
  CancelToken? token;
  int requests = 0;
  @override
  Stream<AiStreamEvent> streamChat(
      {required String scene,
      required List<AiMessage> history,
      CancelToken? cancelToken}) {
    requests++;
    token = cancelToken;
    return events.stream;
  }
}

Future<void> showChat(WidgetTester tester, AiChatModel model,
    {double width = 390,
    Brightness brightness = Brightness.light,
    double scale = 1,
    double keyboard = 0}) async {
  tester.view.physicalSize = Size(width, 900);
  tester.view.devicePixelRatio = 1;
  tester.view.viewInsets = FakeViewPadding(bottom: keyboard);
  await tester.pumpWidget(MaterialApp(
    theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, brightness: brightness)),
    builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: TextScaler.linear(scale)),
        child: child!),
    home: ChangeNotifierProvider.value(value: model, child: const AiChatPage()),
  ));
  await tester.pumpAndSettle();
}

void main() {
  for (final width in [390.0, 768.0, 1280.0]) {
    for (final brightness in Brightness.values) {
      testWidgets(
          'chat layout $width $brightness with enlarged text and keyboard',
          (tester) async {
        final model = AiChatModel(repo: PreviewAiRepo());
        await model.loadFromDisk();
        addTearDown(model.dispose);
        addTearDown(tester.view.reset);
        await showChat(tester, model,
            width: width, brightness: brightness, scale: 1.8, keyboard: 240);
        expect(tester.takeException(), isNull);
        expect(
            tester
                .getSize(find.byKey(const ValueKey('ai-composer-surface')))
                .width,
            lessThanOrEqualTo(776));
        await model.newSession();
        await tester.pumpAndSettle();
        expect(find.text('你好，我是小九'), findsNothing);
        expect(find.text('星际公民 AI 助手 · Beta'), findsNothing);
        expect(tester.takeException(), isNull);
        await tester.tap(find.byTooltip('会话'));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      });
    }
  }
  testWidgets('send ignores whitespace and supports stop', (tester) async {
    final repo = ControlledRepo();
    final model = AiChatModel(repo: repo);
    await model.loadFromDisk();
    await model.newSession();
    addTearDown(model.dispose);
    addTearDown(tester.view.reset);
    await showChat(tester, model);
    await tester.enterText(find.byType(TextField), '   ');
    await tester.tap(find.byTooltip('发送'));
    expect(repo.requests, 0);
    await tester.enterText(find.byType(TextField), 'hello');
    await tester.pump();
    await tester.tap(find.byTooltip('发送'));
    await tester.pump();
    expect(repo.requests, 1);
    expect(find.byTooltip('停止'), findsOneWidget);
    repo.events.add(const AiStreamEvent.token('partial'));
    await tester.pump();
    await tester.tap(find.byTooltip('停止'));
    expect(repo.token!.isCancelled, isTrue);
    await repo.events.close();
    await tester.pumpAndSettle();
    expect(model.messages.last.content, 'partial');
    expect(find.byTooltip('发送'), findsOneWidget);
  });
  testWidgets('tool expansion survives updates and session switches',
      (tester) async {
    final model = AiChatModel(repo: PreviewAiRepo());
    await model.loadFromDisk();
    addTearDown(model.dispose);
    addTearDown(tester.view.reset);
    await showChat(tester, model, width: 768);
    await tester.ensureVisible(find.byType(AiToolGroup));
    await tester.tap(find.byType(ExpansionTile));
    await tester.pumpAndSettle();
    expect(find.text('检索资料：探索舰对比'), findsOneWidget);
    await model.refreshUsage();
    await tester.pumpAndSettle();
    expect(find.text('检索资料：探索舰对比'), findsOneWidget);
    await model.switchSession('empty');
    await tester.pumpAndSettle();
    await model.switchSession('preview');
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byType(AiToolGroup));
    await tester.pumpAndSettle();
    expect(find.text('检索资料：探索舰对比'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets(
      'long conversation does not force reader to latest during streaming',
      (tester) async {
    final repo = ControlledRepo();
    final model = AiChatModel(repo: repo);
    await model.loadFromDisk();
    await model.switchSession('long');
    addTearDown(model.dispose);
    addTearDown(tester.view.reset);
    await showChat(tester, model, width: 768);
    model.send('new question');
    await tester.pump();
    await tester.pump();
    repo.events.add(const AiStreamEvent.token('starting'));
    await tester.pump();
    final list = tester.widget<ListView>(find.byType(ListView).first);
    list.controller!.jumpTo(600);
    await tester.pump();
    final visibleUser = find
        .byType(AiMessageView)
        .evaluate()
        .map((e) => e.widget as AiMessageView)
        .where((w) => w.user)
        .last;
    final anchor = find.byWidgetPredicate(
        (w) => w is AiMessageView && w.text == visibleUser.text);
    final before = tester.getTopLeft(anchor).dy;
    repo.events.add(AiStreamEvent.token('\nmore text' * 20));
    await tester.pump();
    await tester.pump();
    expect(tester.getTopLeft(anchor).dy, closeTo(before, 2));
    expect(list.controller!.offset, greaterThan(80));
    expect(find.byTooltip('回到最新'), findsOneWidget);
    await tester.tap(find.byTooltip('回到最新'));
    await tester.pump();
    expect(list.controller!.offset, 0);
    repo.events.add(const AiStreamEvent.done({}));
    await repo.events.close();
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
  testWidgets('retry and session deletion preserve the intended conversation',
      (tester) async {
    final repo = ControlledRepo();
    final model = AiChatModel(repo: repo);
    await model.loadFromDisk();
    await model.newSession();
    final sessionId = model.currentSessionId;
    addTearDown(model.dispose);
    addTearDown(tester.view.reset);
    await showChat(tester, model);
    model.send('retry me');
    await tester.pump();
    repo.events.add(const AiStreamEvent.error('暂时不可用', retryable: true));
    await repo.events.close();
    await tester.pump();
    await tester.pump();
    expect(model.isGenerating, isFalse);
    await tester.pumpAndSettle();
    repo.events = StreamController<AiStreamEvent>();
    await tester.tap(find.text('重试'));
    await tester.pump();
    expect(repo.requests, 2);
    repo.events.add(const AiStreamEvent.token('retried'));
    repo.events.add(const AiStreamEvent.done({}));
    await repo.events.close();
    await tester.pumpAndSettle();
    expect(model.messages.where((m) => m.role == 'user').length, 1);
    await tester.tap(find.byTooltip('会话'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('删除').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('取消'));
    await tester.pumpAndSettle();
    expect(model.sessions.any((s) => s.id == sessionId), isTrue);
    await tester.tap(find.byTooltip('删除').first);
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(TextButton, '删除'));
    await tester.pumpAndSettle();
    expect(model.sessions.any((s) => s.id == sessionId), isFalse);
    await repo.events.close();
    expect(tester.takeException(), isNull);
  });

  testWidgets('clicking selectable prose keeps its position after scrolling',
      (tester) async {
    final scroll = ScrollController();
    addTearDown(scroll.dispose);
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: ListView.builder(
      key: const PageStorageKey('prose-timeline'),
      controller: scroll,
      itemCount: 40,
      itemBuilder: (context, index) => AiChatWidth(
          child: AiMessageView(
              user: index.isEven,
              text: '第 $index 段正文。点击和滚动时保持位置。\n\n第二段可以选择和复制。')),
    ))));
    await tester.pumpAndSettle();
    scroll.jumpTo(400);
    await tester.pumpAndSettle();
    final prose = find.text('第二段可以选择和复制。').hitTestable().first;
    final before = tester.getTopLeft(prose);
    final offset = scroll.offset;
    await tester.tap(prose);
    await tester.pump();
    expect(tester.getTopLeft(prose), before);
    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.getTopLeft(prose), before);
    expect(scroll.offset, offset);
    // 正文通过 SelectionArea 选择，不再创建段落自己的滚动视口。
    expect(find.byType(SelectionArea), findsWidgets);
    expect(find.byType(Scrollable), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('wide Markdown tables and code stay inside a narrow chat pane',
      (tester) async {
    addTearDown(tester.view.reset);
    tester.view.physicalSize = const Size(390, 900);
    tester.view.devicePixelRatio = 1;
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
      child: AiChatWidth(
          child: AiMessageView(
              user: false,
              text: '| 舰船 | 制造商 | 任务 | 说明 |\n| --- | --- | --- | --- |\n'
                  '| Carrack | Anvil Aerospace | 长途探索 | 多人协作与补给支持 |\n\n'
                  '```text\n${'long_command_' * 25}\n```')),
    ))));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.byType(SelectionArea), findsWidgets);
    expect(find.byType(Table), findsOneWidget);
  });
}
