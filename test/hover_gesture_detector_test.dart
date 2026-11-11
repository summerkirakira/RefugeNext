import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:refuge_next/src/widgets/common/hover_gesture_detector.dart';

void main() {
  const primary = Colors.teal;

  Future<void> pumpTarget(WidgetTester tester, {VoidCallback? onTap}) {
    return tester.pumpWidget(MaterialApp(
      // 与 App 一致使用 Material 2，波纹才是可绘制断言的 InkSplash。
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: const ColorScheme.light(primary: primary),
      ),
      home: Center(
        child: HoverGestureDetector(
          onTap: onTap,
          child: const SizedBox(
            width: 100,
            height: 100,
            child: ColoredBox(color: Colors.red),
          ),
        ),
      ),
    ));
  }

  Color overlayColor(WidgetTester tester) {
    final overlay = tester.widget<AnimatedContainer>(find.descendant(
      of: find.byType(HoverGestureDetector),
      matching: find.byType(AnimatedContainer),
    ));
    return (overlay.decoration! as BoxDecoration).color!;
  }

  Future<TestGesture> hoverTarget(WidgetTester tester) async {
    final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
    addTearDown(mouse.removePointer);
    await mouse.addPointer(location: Offset.zero);
    await mouse.moveTo(tester.getCenter(find.byType(HoverGestureDetector)));
    await tester.pumpAndSettle();
    return mouse;
  }

  testWidgets('tints like the navigation rail on hover and restores on exit',
      (tester) async {
    await pumpTarget(tester, onTap: () {});
    expect(overlayColor(tester).a, 0);

    final mouse = await hoverTarget(tester);
    expect(overlayColor(tester), primary.withValues(alpha: 0.04));
    expect(
      RendererBinding.instance.mouseTracker.debugDeviceActiveCursor(1),
      SystemMouseCursors.basic,
    );

    await mouse.moveTo(Offset.zero);
    await tester.pumpAndSettle();
    expect(overlayColor(tester).a, 0);
  });

  testWidgets('shows no hover effect when disabled', (tester) async {
    await pumpTarget(tester);

    await hoverTarget(tester);
    expect(overlayColor(tester).a, 0);
  });

  testWidgets('overlay uses the shared border radius', (tester) async {
    await pumpTarget(tester, onTap: () {});

    final overlay = tester.widget<AnimatedContainer>(find.descendant(
      of: find.byType(HoverGestureDetector),
      matching: find.byType(AnimatedContainer),
    ));
    expect(
      (overlay.decoration! as BoxDecoration).borderRadius,
      hoverBorderRadius,
    );
  });

  RenderObject inkLayer(WidgetTester tester) {
    return tester.allRenderObjects.firstWhere(
      (object) => object.runtimeType.toString() == '_RenderInkFeatures',
    );
  }

  testWidgets('shows a ripple on press', (tester) async {
    await pumpTarget(tester, onTap: () {});

    final press =
        await tester.startGesture(tester.getCenter(find.byType(SizedBox)));
    await tester.pump(const Duration(milliseconds: 200));
    expect(inkLayer(tester), paints..circle());

    await press.up();
    await tester.pumpAndSettle();
    expect(inkLayer(tester), isNot(paints..circle()));
  });

  testWidgets('shows no ripple when disabled', (tester) async {
    await pumpTarget(tester);

    final press =
        await tester.startGesture(tester.getCenter(find.byType(SizedBox)));
    await tester.pump(const Duration(milliseconds: 200));
    expect(inkLayer(tester), isNot(paints..circle()));

    await press.up();
    await tester.pumpAndSettle();
  });

  testWidgets('can be removed while a ripple is running', (tester) async {
    await pumpTarget(tester, onTap: () {});

    await tester.tap(find.byType(HoverGestureDetector));
    await tester.pump(const Duration(milliseconds: 50));

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('cancels the ripple when disabled during a press',
      (tester) async {
    await pumpTarget(tester, onTap: () {});
    final press =
        await tester.startGesture(tester.getCenter(find.byType(SizedBox)));
    await tester.pump(const Duration(milliseconds: 200));
    expect(inkLayer(tester), paints..circle());

    await pumpTarget(tester);
    await tester.pumpAndSettle();
    expect(inkLayer(tester), isNot(paints..circle()));

    await press.up();
    await tester.pumpAndSettle();
  });

  testWidgets('supports keyboard focus and activation', (tester) async {
    var taps = 0;
    await pumpTarget(tester, onTap: () => taps++);

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pumpAndSettle();
    expect(overlayColor(tester).a, closeTo(0.12, 0.001));

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(taps, 1);
  });

  testWidgets('disabled targets are skipped by keyboard focus', (tester) async {
    await pumpTarget(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pumpAndSettle();
    expect(overlayColor(tester).a, 0);
  });

  testWidgets('overlay honours custom radius and margin', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Center(
        child: HoverGestureDetector(
          onTap: () {},
          borderRadius: hoverCircleBorderRadius,
          overlayMargin: hoverCardMargin,
          child: const SizedBox(
            width: 100,
            height: 100,
            child: ColoredBox(color: Colors.red),
          ),
        ),
      ),
    ));

    final overlay = find.descendant(
      of: find.byType(HoverGestureDetector),
      matching: find.byType(AnimatedContainer),
    );
    expect(tester.getSize(overlay), const Size(92, 92));
    expect(
      (tester.widget<AnimatedContainer>(overlay).decoration! as BoxDecoration)
          .borderRadius,
      hoverCircleBorderRadius,
    );
  });

  testWidgets('forwards taps', (tester) async {
    var taps = 0;
    await tester.pumpWidget(MaterialApp(
      home: Center(
        child: HoverGestureDetector(
          onTap: () => taps++,
          child: const SizedBox(
            width: 100,
            height: 100,
            child: ColoredBox(color: Colors.red),
          ),
        ),
      ),
    ));

    await tester.tap(find.byType(HoverGestureDetector));
    expect(taps, 1);
  });

  testWidgets('lets taps through transparent gaps', (tester) async {
    var behindTaps = 0;
    await tester.pumpWidget(MaterialApp(
      home: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => behindTaps++,
            ),
          ),
          Center(
            child: HoverGestureDetector(
              onTap: () {},
              child: const SizedBox(width: 100, height: 100),
            ),
          ),
        ],
      ),
    ));

    await tester.tapAt(tester.getCenter(find.byType(HoverGestureDetector)));
    expect(behindTaps, 1);
  });

  testWidgets('does not intercept taps on interactive children',
      (tester) async {
    var outerTaps = 0;
    var innerTaps = 0;
    await tester.pumpWidget(MaterialApp(
      home: Center(
        child: HoverGestureDetector(
          onTap: () => outerTaps++,
          child: TextButton(
            onPressed: () => innerTaps++,
            child: const Text('inner'),
          ),
        ),
      ),
    ));

    await tester.tap(find.text('inner'));
    await tester.pump();
    expect(innerTaps, 1);
    expect(outerTaps, 0);
  });

  testWidgets('passes tight constraints through to the child', (tester) async {
    const childKey = Key('child');
    await tester.pumpWidget(MaterialApp(
      home: Center(
        child: SizedBox(
          width: 200,
          height: 150,
          child: HoverGestureDetector(
            onTap: () {},
            child: const ColoredBox(key: childKey, color: Colors.red),
          ),
        ),
      ),
    ));

    expect(tester.getSize(find.byKey(childKey)), const Size(200, 150));
  });
}
