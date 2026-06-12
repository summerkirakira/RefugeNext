import 'dart:convert';
import 'dart:io';

import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

/// 复现载具详情页结构部件树的徽章渲染
/// (与 vehicle_detail_test_page.dart 的 _partsCard 同构)。
void main() {
  testWidgets('结构部件树:Nose/Body 均应显示关键徽章', (tester) async {
    final json = jsonDecode(
            File('test/fixtures/avenger_parts.json').readAsStringSync())
        as List;
    var parts = json
        .map((e) => GameVehiclePart.fromJson(e as Map<String, dynamic>))
        .toList();
    if (parts.length == 1 && (parts.first.children?.isNotEmpty ?? false)) {
      parts = parts.first.children!;
    }

    final tree = TreeNode<GameVehiclePart>.root();
    void attach(TreeNode<GameVehiclePart> parent, List<GameVehiclePart> list) {
      for (final part in list) {
        final node = TreeNode<GameVehiclePart>(data: part);
        parent.add(node);
        final children = part.children;
        if (children != null && children.isNotEmpty) {
          attach(node, children);
        }
      }
    }

    attach(tree, parts);

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: TreeView.simple<GameVehiclePart>(
            tree: tree,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            showRootNode: false,
            expansionBehavior: ExpansionBehavior.none,
            onTreeReady: (controller) => controller.expandAllChildren(tree),
            builder: (context, node) {
              final part = node.data;
              final name = part?.displayName ?? part?.name ?? '未知';
              final isCritical = part?.destructionDamage != null;
              final isDetachable = part?.detachDamage != null;
              return Row(children: [
                Text(name),
                if (isCritical) const Text('关键'),
                if (isDetachable) const Text('可脱落'),
              ]);
            },
          ),
        ),
      ),
    ));
    await tester.pumpAndSettle();

    // 顶层 Nose/Body 可见
    expect(find.text('Nose'), findsOneWidget);
    expect(find.text('Body'), findsOneWidget);
    // 两者均为关键部件
    expect(find.text('关键'), findsNWidgets(2));
  });
}
