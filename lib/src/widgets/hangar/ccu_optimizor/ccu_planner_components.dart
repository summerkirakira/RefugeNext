import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../datasource/models/ccu_plan.dart';

const _moneyFeatures = [FontFeature.tabularFigures()];

class CcuShipView {
  const CcuShipView(
      {required this.name,
      this.englishName = '',
      this.price,
      this.imageUrl,
      this.heroUrl});
  final String name;
  final String englishName;
  final int? price;
  final String? imageUrl;
  final String? heroUrl;
}

class CcuShipImage extends StatelessWidget {
  const CcuShipImage({super.key, this.url, this.fallbackUrl});
  final String? url;
  final String? fallbackUrl;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final placeholder = ColoredBox(
        color: colors.primary.withValues(alpha: .07),
        child: Center(
            child: Icon(Icons.rocket_launch_outlined,
                size: 32, color: colors.primary.withValues(alpha: .5))));
    final source = url?.isNotEmpty == true ? url : fallbackUrl;
    if (source == null || source.isEmpty) return placeholder;
    return CachedNetworkImage(
        imageUrl: source,
        fit: BoxFit.cover,
        fadeInDuration: MediaQuery.disableAnimationsOf(context)
            ? Duration.zero
            : const Duration(milliseconds: 160),
        placeholder: (context, url) => placeholder,
        errorWidget: (context, url, error) =>
            fallbackUrl != null && fallbackUrl != source
                ? CcuShipImage(url: fallbackUrl)
                : placeholder);
  }
}

class CcuPanel extends StatelessWidget {
  const CcuPanel(
      {super.key,
      required this.child,
      this.borderColor,
      this.onTap,
      this.padding = const EdgeInsets.all(20)});
  final Widget child;
  final Color? borderColor;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return Material(
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(
                color: borderColor ??
                    Theme.of(context)
                        .colorScheme
                        .outlineVariant
                        .withValues(alpha: .55))),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
            onTap: onTap, child: Padding(padding: padding, child: child)),
      );
    }
    return Container(
        padding: padding,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
                color: borderColor ??
                    Theme.of(context)
                        .colorScheme
                        .outlineVariant
                        .withValues(alpha: .55))),
        child: child);
  }
}

class CcuSourceOption extends StatelessWidget {
  const CcuSourceOption({
    super.key,
    required this.label,
    required this.icon,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final IconData icon;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Material(
        color: value
            ? colors.primary.withValues(alpha: .09)
            : colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: CheckboxListTile(
            value: value,
            activeColor: colors.primary,
            checkColor: colors.onPrimary,
            onChanged: onChanged == null ? null : (value) => onChanged!(value!),
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            minVerticalPadding: 12,
            minTileHeight: 48,
            minLeadingWidth: 19,
            horizontalTitleGap: 10,
            dense: true,
            secondary: Icon(icon,
                size: 19,
                color:
                    onChanged == null ? theme.disabledColor : colors.primary),
            title: Text(label,
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: onChanged == null
                        ? theme.disabledColor
                        : colors.onSurface))));
  }
}

class CcuShipSelector extends StatelessWidget {
  const CcuShipSelector(
      {super.key,
      required this.label,
      required this.ship,
      required this.onTap,
      this.compact = false,
      this.isTarget = false});
  final String label;
  final CcuShipView? ship;
  final VoidCallback? onTap;
  final bool compact;
  final bool isTarget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final hasPhoto = ship?.heroUrl != null || ship?.imageUrl != null;
    final foreground = !compact && hasPhoto ? Colors.white : colors.onSurface;
    final texts =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Icon(isTarget ? Icons.flag_outlined : Icons.flight_takeoff,
            size: 16, color: foreground),
        const SizedBox(width: 8),
        Text(label,
            style: theme.textTheme.labelMedium?.copyWith(color: foreground))
      ]),
      const SizedBox(height: 10),
      Text(ship?.name ?? '选择舰船',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleLarge
              ?.copyWith(color: foreground, fontWeight: FontWeight.w700)),
      if (ship != null &&
          ship!.englishName != ship!.name &&
          ship!.englishName.isNotEmpty)
        Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(ship!.englishName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: foreground.withValues(alpha: .78)))),
      const SizedBox(height: 12),
      Wrap(
          spacing: 12,
          runSpacing: 4,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            if (ship?.price != null)
              Text('价格 ${ccuMoney(ship!.price!)}',
                  style: theme.textTheme.labelLarge?.copyWith(
                      color: foreground, fontFeatures: _moneyFeatures)),
            Text(ship == null ? '点击选择 →' : '更换舰船 →',
                style: theme.textTheme.labelMedium
                    ?.copyWith(color: foreground.withValues(alpha: .8))),
          ]),
    ]);
    return Semantics(
        button: true,
        label: '$label：${ship?.name ?? '请选择'}',
        child: Material(
            color: colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(18),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
                onTap: onTap,
                child: compact
                    ? Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(children: [
                          SizedBox(
                              width: 90,
                              height: 90,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CcuShipImage(url: ship?.imageUrl))),
                          const SizedBox(width: 14),
                          Expanded(child: texts),
                        ]))
                    : Stack(children: [
                        Positioned.fill(
                            child: CcuShipImage(
                                url: ship?.heroUrl,
                                fallbackUrl: ship?.imageUrl)),
                        if (hasPhoto)
                          Positioned.fill(
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                            Colors.black.withValues(alpha: .8),
                            Colors.black.withValues(alpha: .2)
                          ])))),
                        ConstrainedBox(
                            constraints: const BoxConstraints(minHeight: 180),
                            child: Padding(
                                padding: const EdgeInsets.all(22),
                                child: texts)),
                      ]))));
  }
}

/// One scroll view, including lazily built route steps in the desktop column.
class CcuPlannerLayout extends StatefulWidget {
  const CcuPlannerLayout(
      {super.key,
      required this.headerBuilder,
      required this.ships,
      required this.settings,
      required this.actions,
      required this.results,
      required this.stepCount,
      required this.stepBuilder});
  final Widget Function(BuildContext, VoidCallback? openSettings) headerBuilder;
  final Widget ships, settings, actions, results;
  final int stepCount;
  final IndexedWidgetBuilder stepBuilder;

  @override
  State<CcuPlannerLayout> createState() => _CcuPlannerLayoutState();
}

class _CcuPlannerLayoutState extends State<CcuPlannerLayout> {
  late final ValueNotifier<Widget> _sheetSettings;
  bool _sheetOpen = false;

  @override
  void initState() {
    super.initState();
    _sheetSettings = ValueNotifier(widget.settings);
  }

  @override
  void didUpdateWidget(CcuPlannerLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    // The modal is a separate route; keep its controls in sync with page state.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _sheetSettings.value = widget.settings;
    });
  }

  @override
  void dispose() {
    _sheetSettings.dispose();
    super.dispose();
  }

  Widget _settingsTitle(BuildContext context) => Text('规划设置',
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(fontWeight: FontWeight.w700));

  Future<void> _openSettings() async {
    if (_sheetOpen) return;
    _sheetOpen = true;
    try {
      await showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          showDragHandle: true,
          constraints: const BoxConstraints(maxWidth: 640),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
          builder: (sheetContext) => SafeArea(
              top: false,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(sheetContext).height * .85),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Row(children: [
                          Expanded(child: _settingsTitle(sheetContext)),
                          IconButton(
                              tooltip: '关闭规划设置',
                              onPressed: () => Navigator.pop(sheetContext),
                              icon: const Icon(Icons.close)),
                        ]),
                        const SizedBox(height: 12),
                        Flexible(
                            child: SingleChildScrollView(
                                child: ValueListenableBuilder<Widget>(
                                    valueListenable: _sheetSettings,
                                    builder: (context, settings, child) =>
                                        settings))),
                        const SizedBox(height: 12),
                        SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                                onPressed: () => Navigator.pop(sheetContext),
                                child: const Text('完成'))),
                      ])))));
    } finally {
      _sheetOpen = false;
    }
  }

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        final wide = constraints.maxWidth >= 1000;
        final padding = wide ? 24.0 : 16.0;
        final width = constraints.maxWidth.clamp(0.0, 1360.0);
        final margin = (constraints.maxWidth - width) / 2 + padding;
        final resultSlivers = <Widget>[
          SliverToBoxAdapter(child: widget.results),
          SliverList(
              delegate: SliverChildBuilderDelegate(widget.stepBuilder,
                  childCount: widget.stepCount)),
        ];
        return CustomScrollView(
            key: const PageStorageKey('ccu-planner-scroll'),
            slivers: [
              SliverPadding(
                  padding: EdgeInsets.fromLTRB(margin, 20, margin, 20),
                  sliver: SliverToBoxAdapter(
                      child: Column(children: [
                    widget.headerBuilder(context, wide ? null : _openSettings),
                    const SizedBox(height: 20),
                    widget.ships
                  ]))),
              SliverPadding(
                  padding: EdgeInsets.fromLTRB(margin, 0, margin, 28),
                  sliver: wide
                      ? SliverCrossAxisGroup(slivers: [
                          SliverConstrainedCrossAxis(
                              maxExtent: 324,
                              sliver: SliverPadding(
                                  padding: const EdgeInsets.only(right: 24),
                                  sliver: SliverToBoxAdapter(
                                      child: CcuPanel(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                        _settingsTitle(context),
                                        const SizedBox(height: 18),
                                        widget.settings,
                                        const SizedBox(height: 14),
                                        widget.actions,
                                      ]))))),
                          SliverCrossAxisExpanded(
                              flex: 1,
                              sliver:
                                  SliverMainAxisGroup(slivers: resultSlivers)),
                        ])
                      : SliverMainAxisGroup(slivers: [
                          SliverToBoxAdapter(
                              child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: widget.actions)),
                          ...resultSlivers,
                        ])),
            ]);
      });
}

class CcuNotice extends StatelessWidget {
  const CcuNotice(
      {super.key,
      required this.message,
      this.error = false,
      this.icon = Icons.info_outline});
  final String message;
  final bool error;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final color = error ? colors.error : colors.primary;
    return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: color.withValues(alpha: .08),
            borderRadius: BorderRadius.circular(12)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 10),
          Expanded(
              child:
                  Text(message, style: TextStyle(color: color, height: 1.5))),
        ]));
  }
}

class CcuPlanChoice extends StatelessWidget {
  const CcuPlanChoice(
      {super.key,
      required this.plan,
      required this.number,
      required this.selected,
      required this.onSelected});
  final CcuPlan plan;
  final int number;
  final bool selected;
  final VoidCallback onSelected;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final sources = <String, int>{
      '机库中': 0,
      '回购中': 0,
      '可购买': 0,
      '不可购买': 0,
    };
    for (final step in plan.steps) {
      final category = step.isOwned
          ? '机库中'
          : step.source == 'buyback'
              ? '回购中'
              : (step.source == 'store' || step.source == 'store_wb') &&
                      step.availability == 'verified'
                  ? '可购买'
                  : '不可购买';
      sources.update(category, (n) => n + 1);
    }
    return Semantics(
        selected: selected,
        button: true,
        child: Material(
            color: selected
                ? colors.primary.withValues(alpha: .09)
                : colors.surface,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                    color: selected ? colors.primary : colors.outlineVariant)),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
                onTap: onSelected,
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Icon(
                                selected
                                    ? Icons.check_circle
                                    : Icons.radio_button_unchecked,
                                size: 17,
                                color: selected
                                    ? colors.primary
                                    : colors.onSurfaceVariant),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Text(
                                    '方案 $number · ${plan.steps.length} 步',
                                    style: theme.textTheme.labelLarge))
                          ]),
                          const SizedBox(height: 9),
                          Text('补入 ${ccuMoney(plan.additionalCost)}',
                              style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: selected
                                      ? colors.primary
                                      : colors.onSurface,
                                  fontFeatures: _moneyFeatures)),
                          const SizedBox(height: 3),
                          Text('总计 ${ccuMoney(plan.totalCost)}',
                              style: theme.textTheme.bodySmall),
                          const SizedBox(height: 8),
                          Text(
                              sources.entries
                                  .map((e) => '${e.key} ${e.value}')
                                  .join(' · '),
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(color: colors.onSurfaceVariant)),
                        ])))));
  }
}

class CcuCostSummary extends StatelessWidget {
  const CcuCostSummary(
      {super.key, required this.plan, this.objective = 'additional'});
  final CcuPlan plan;
  final String objective;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final additional = objective != 'total';
    Widget metric(String label, int value) =>
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label,
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: colors.onSurfaceVariant)),
          const SizedBox(height: 5),
          Text(ccuMoney(value),
              style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600, fontFeatures: _moneyFeatures)),
        ]);
    return CcuPanel(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(additional ? '补入金额' : 'CCU链可融价值',
          style: theme.textTheme.labelLarge?.copyWith(color: colors.primary)),
      const SizedBox(height: 6),
      Text(ccuMoney(additional ? plan.additionalCost : plan.totalCost),
          style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.primary,
              fontFeatures: _moneyFeatures)),
      const SizedBox(height: 18),
      Wrap(spacing: 32, runSpacing: 16, children: [
        metric('可用信用点', plan.creditEligibleCost),
        metric('仅现金', plan.cashOnlyCost),
      ]),
      const SizedBox(height: 18),
      Wrap(spacing: 32, runSpacing: 16, children: [
        metric('机库已有', plan.ownedCost),
        metric(additional ? 'CCU链可融价值' : '补入金额',
            additional ? plan.totalCost : plan.additionalCost),
        metric(plan.savings < 0 ? '高于普通价差' : '节省', plan.savings.abs())
      ]),
    ]));
  }
}

class CcuRouteStep extends StatelessWidget {
  const CcuRouteStep(
      {super.key,
      required this.edge,
      required this.index,
      required this.from,
      required this.to,
      required this.last,
      required this.pinned,
      required this.onPin,
      required this.onExclude,
      this.onTap});
  final CcuOffer edge;
  final int index;
  final CcuShipView from, to;
  final bool last, pinned;
  final VoidCallback? onPin;
  final VoidCallback? onExclude;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    // Use the same reference ship prices as the planner; owned CCUs still
    // contribute their book cost rather than counting as a free upgrade.
    final savings = from.price != null && to.price != null
        ? to.price! - from.price! - edge.cost
        : null;
    final expired =
        edge.availability == 'verified' && !edge.freshAt(DateTime.now());
    final unavailableEstimate = edge.source == 'standard';
    final estimateColor = theme.brightness == Brightness.dark
        ? const Color(0xFFFFD54F)
        : const Color(0xFF8A5A00);
    final icon = edge.isOwned
        ? Icons.inventory_2_outlined
        : edge.source == 'buyback'
            ? Icons.history
            : edge.isPending
                ? Icons.schedule
                : Icons.shopping_bag_outlined;
    final color = unavailableEstimate
        ? estimateColor
        : edge.isOwned
            ? colors.tertiary
            : edge.isPending || expired
                ? colors.secondary
                : colors.primary;
    return IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(
          width: 32,
          child: Column(children: [
            Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: unavailableEstimate
                        ? Colors.amber.withValues(alpha: .22)
                        : color.withValues(alpha: .12),
                    shape: BoxShape.circle),
                child: Text('${index + 1}',
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: color, fontWeight: FontWeight.bold))),
            if (!last)
              Expanded(
                  child: Container(width: 2, color: colors.outlineVariant)),
          ])),
      const SizedBox(width: 10),
      Expanded(
          child: Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: CcuPanel(
                  onTap: edge.isOwned ? onTap : null,
                  padding: const EdgeInsets.all(14),
                  borderColor: unavailableEstimate
                      ? Colors.amber.withValues(alpha: .65)
                      : null,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 68,
                                  height: 54,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(9),
                                      child: CcuShipImage(url: to.imageUrl))),
                              const SizedBox(width: 12),
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Text('从 ${from.name}',
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                                color:
                                                    colors.onSurfaceVariant)),
                                    const SizedBox(height: 4),
                                    Text(to.name,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600)),
                                  ])),
                              IconButton(
                                  tooltip:
                                      '排除［${edge.tagLabel}］：${from.name} → ${to.name}',
                                  onPressed: onExclude,
                                  icon: const Icon(Icons.block, size: 19)),
                            ]),
                        const SizedBox(height: 12),
                        Wrap(
                            spacing: 8,
                            runSpacing: 6,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: unavailableEstimate
                                          ? Colors.amber.withValues(alpha: .18)
                                          : color.withValues(alpha: .09),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(icon, size: 14, color: color),
                                        const SizedBox(width: 5),
                                        Text(edge.tagLabel,
                                            style: theme.textTheme.labelSmall
                                                ?.copyWith(color: color))
                                      ])),
                              if (pinned)
                                Text('已固定',
                                    style: theme.textTheme.labelSmall
                                        ?.copyWith(color: colors.primary)),
                            ]),
                        Row(children: [
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(ccuMoney(edge.cost),
                                    style: theme.textTheme.titleLarge?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontFeatures: _moneyFeatures)),
                                if (savings != null && savings > 0)
                                  Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text('节约 ${ccuMoney(savings)}',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                  color: colors.tertiary,
                                                  fontWeight: FontWeight.w600,
                                                  fontFeatures:
                                                      _moneyFeatures))),
                              ])),
                          IconButton(
                              tooltip: pinned ? '取消固定' : '固定该升级包或来源',
                              onPressed: onPin,
                              icon: Icon(
                                  pinned
                                      ? Icons.push_pin
                                      : Icons.push_pin_outlined,
                                  size: 19)),
                        ]),
                      ])))),
    ]));
  }
}
