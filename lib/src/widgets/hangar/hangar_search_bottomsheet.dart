import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../datasource/data_model.dart';
import '../../datasource/models/hangar.dart';
import '../../datasource/models/searchProperty.dart';
import 'hangar_filter_options.dart';
import 'hangar_ship_picker.dart';

/// Owns an editor snapshot; no changes reach the model until confirmation.
class HangarSearchDraft extends ChangeNotifier {
  HangarSearchDraft(SearchProperty? initial)
      : value = (initial ?? SearchProperty.empty()).normalized(),
        text = TextEditingController(text: initial?.searchText ?? '') {
    // Both gift choices have always meant unrestricted; show that as one choice.
    if (value.reclaimStatus.contains('giftable') &&
        value.reclaimStatus.contains('non_giftable')) {
      value.reclaimStatus
          .removeWhere((item) => item == 'giftable' || item == 'non_giftable');
      if (value.reclaimStatus.isEmpty) value.reclaimStatus.add('all');
    }
  }

  SearchProperty value;
  final TextEditingController text;
  bool busy = false;
  bool closed = false;
  String? error;

  void change(VoidCallback edit) {
    if (busy || closed) return;
    edit();
    error = null;
    notifyListeners();
  }

  void reset() => change(() {
        value = SearchProperty.empty();
        text.clear();
      });

  Future<void> submit(MainDataModel model, VoidCallback onApplied) async {
    if (busy || closed) return;
    busy = true;
    error = null;
    value.searchText = text.text;
    notifyListeners();
    try {
      final applied =
          await model.applyHangarSearch(value, isCurrent: () => !closed);
      if (!closed && applied) onApplied();
    } catch (_) {
      if (!closed) error = '筛选未应用，CCU 数据读取失败，请重试';
    } finally {
      if (!closed) {
        busy = false;
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    closed = true;
    text.dispose();
    super.dispose();
  }
}

void showHangarSearch(BuildContext context) {
  WoltModalSheet.show<void>(
    context: context,
    pageListBuilder: (sheetContext) => [getSearchBottomSheet(sheetContext)],
  );
}

WoltModalSheetPage getSearchBottomSheet(BuildContext context) {
  final model = context.read<MainDataModel>();
  final draft = HangarSearchDraft(model.searchProperty);
  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text('机库搜索',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    ),
    trailingNavBarWidget: IconButton(
      tooltip: '关闭并放弃修改',
      icon: const Icon(Icons.close),
      onPressed: () {
        draft.closed = true;
        Navigator.of(context).pop();
      },
    ),
    child: PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) draft.closed = true;
      },
      child: HangarSearchFields(draft: draft, items: model.rawHangarItems),
    ),
    stickyActionBar: ListenableBuilder(
      listenable: draft,
      builder: (context, _) => Material(
        color: Theme.of(context).colorScheme.surface,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              if (draft.error != null)
                Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(draft.error!,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error))),
              Row(children: [
                TextButton(
                    onPressed: draft.busy ? null : draft.reset,
                    child: const Text('重置')),
                const SizedBox(width: 12),
                Expanded(
                    child: FilledButton(
                  onPressed: draft.busy
                      ? null
                      : () => draft.submit(
                          model, () => Navigator.of(context).pop()),
                  child: Text(draft.busy ? '正在应用…' : '应用筛选'),
                )),
              ]),
            ]),
          ),
        ),
      ),
    ),
  );
}

class HangarSearchFields extends StatefulWidget {
  const HangarSearchFields(
      {super.key, required this.draft, required this.items});
  final HangarSearchDraft draft;
  final List<HangarItem> items;

  @override
  State<HangarSearchFields> createState() => _HangarSearchFieldsState();
}

class _HangarSearchFieldsState extends State<HangarSearchFields> {
  bool _more = false;

  @override
  void dispose() {
    widget.draft.dispose();
    super.dispose();
  }

  Widget chip(
      {required String key,
      required String label,
      required bool selected,
      required ValueChanged<bool> onSelected}) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dark = theme.brightness == Brightness.dark;
    return FilterChip(
      key: ValueKey(key),
      label: Text(label,
          style: theme.textTheme.labelMedium!.copyWith(
              fontSize: 12,
              fontWeight: selected ? FontWeight.w500 : FontWeight.normal,
              color: selected ? colors.primary : colors.onSurfaceVariant)),
      selected: selected,
      backgroundColor: colors.surface,
      selectedColor: Color.alphaBlend(
          colors.primary.withValues(alpha: dark ? .14 : .08), colors.surface),
      checkmarkColor: colors.primary,
      side: BorderSide(
          color: selected
              ? colors.primary.withValues(alpha: dark ? .30 : .20)
              : colors.outlineVariant),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      visualDensity: VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      onSelected: widget.draft.busy ? null : onSelected,
    );
  }

  Widget section(String title, List<Widget> children) => Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 4),
          Wrap(spacing: 6, runSpacing: 2, children: children),
        ]),
      );

  Widget group(HangarFilterField field) {
    final draft = widget.draft;
    return section(hangarFilterTitles[field]!, [
      for (final option in hangarFilterOptions[field]!.entries)
        chip(
            key: 'filter-${field.name}-${option.key}',
            label: option.key == 'all' ? '不限' : option.value,
            selected: filterValues(draft.value, field).contains(option.key),
            onSelected: (_) => draft.change(
                () => toggleFilterValue(draft.value, field, option.key))),
    ]);
  }

  void setCapability({String? gift, bool? reclaimable}) {
    final values = widget.draft.value.reclaimStatus;
    final currentGift = values.contains('giftable')
        ? 'giftable'
        : values.contains('non_giftable')
            ? 'non_giftable'
            : 'all';
    final nextGift = gift ?? currentGift;
    final nextReclaim = reclaimable ?? values.contains('reclaimable');
    values.clear();
    if (nextGift != 'all') values.add(nextGift);
    if (nextReclaim) values.add('reclaimable');
    if (values.isEmpty) values.add('all');
  }

  Widget shipField(HangarFilterField field) {
    final from = field == HangarFilterField.from;
    final choices = hangarShipChoices(widget.items, from: from);
    final labels = {for (final choice in choices) choice.id: choice.label};
    final selected = filterValues(widget.draft.value, field)
        .where((id) => id != 'all')
        .toList();
    return ListTile(
      key: ValueKey('ship-field-${field.name}'),
      contentPadding: EdgeInsets.zero,
      title: Text(hangarFilterTitles[field]!,
          style: Theme.of(context).textTheme.bodyMedium),
      subtitle: Text(
          selected.isEmpty
              ? '不限'
              : selected.map((id) => labels[id] ?? 'ID $id').join('、'),
          maxLines: 2,
          overflow: TextOverflow.ellipsis),
      trailing: const Icon(Icons.chevron_right),
      onTap: widget.draft.busy
          ? null
          : () async {
              FocusScope.of(context).unfocus();
              final result = await showHangarShipPicker(context,
                  title: hangarFilterTitles[field]!,
                  choices: choices,
                  selected: selected);
              if (!mounted || result == null) return;
              widget.draft.change(() => filterValues(widget.draft.value, field)
                ..clear()
                ..addAll(result));
            },
    );
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: widget.draft,
        builder: (context, _) {
          final draft = widget.draft;
          final gift = draft.value.reclaimStatus.contains('giftable')
              ? 'giftable'
              : draft.value.reclaimStatus.contains('non_giftable')
                  ? 'non_giftable'
                  : 'all';
          final reclaim = draft.value.reclaimStatus.contains('reclaimable');
          const advanced = {
            HangarFilterField.status,
            HangarFilterField.insurance,
            HangarFilterField.slot
          };
          final summary = hangarFilterTokens(draft.value, widget.items)
              .where((token) => advanced.contains(token.field))
              .map((token) => token.label)
              .join(' · ');
          final sort =
              draft.value.orderSelected ? (draft.value.priceOrder ? 1 : 2) : 0;
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 112),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: draft.text,
                builder: (context, value, _) => TextField(
                  key: const ValueKey('hangar-search-text'),
                  controller: draft.text,
                  enabled: !draft.busy,
                  decoration: InputDecoration(
                    hintText: '搜索中英文名称',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: value.text.isEmpty
                        ? null
                        : IconButton(
                            tooltip: '清空名称',
                            icon: const Icon(Icons.close),
                            onPressed: draft.busy ? null : draft.text.clear),
                  ),
                ),
              ),
              group(HangarFilterField.type),
              section('价格', [
                for (final option
                    in hangarFilterOptions[HangarFilterField.price]!.entries)
                  chip(
                      key: 'filter-price-${option.key}',
                      label: option.value,
                      selected: draft.value.priceRange.contains(option.key),
                      onSelected: (selected) => draft.change(() {
                            draft.value.priceRange =
                                selected ? [option.key] : ['all'];
                          })),
              ]),
              section('赠送', [
                for (final option in const {
                  'all': '不限',
                  'giftable': '可礼物',
                  'non_giftable': '不可礼物'
                }.entries)
                  chip(
                      key: 'gift-${option.key}',
                      label: option.value,
                      selected: gift == option.key,
                      onSelected: (selected) => draft.change(() =>
                          setCapability(gift: selected ? option.key : 'all'))),
              ]),
              section('融船', [
                for (final allowed in [false, true])
                  chip(
                      key: 'reclaim-$allowed',
                      label: allowed ? '可融' : '不限',
                      selected: reclaim == allowed,
                      onSelected: (selected) => draft.change(() =>
                          setCapability(reclaimable: selected && allowed))),
              ]),
              const SizedBox(height: 8),
              shipField(HangarFilterField.from),
              shipField(HangarFilterField.to),
              const Divider(height: 16),
              ListTile(
                key: const ValueKey('hangar-more-filters'),
                contentPadding: EdgeInsets.zero,
                title: const Text('更多条件'),
                subtitle: Text(summary.isEmpty ? '状态、保险、CCU链' : summary,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                trailing: Icon(_more ? Icons.expand_less : Icons.expand_more),
                onTap: draft.busy ? null : () => setState(() => _more = !_more),
              ),
              if (_more) ...[
                group(HangarFilterField.status),
                group(HangarFilterField.insurance),
                section('保存的CCU链', [
                  for (final slot
                      in ({
                    ...List.generate(10, (i) => i),
                    ...draft.value.selectedCCUSlots
                  }.toList()
                        ..sort()))
                    chip(
                        key: 'slot-$slot',
                        label: '槽位${slot + 1}',
                        selected: draft.value.selectedCCUSlots.contains(slot),
                        onSelected: (selected) => draft.change(() {
                              if (selected) {
                                draft.value.selectedCCUSlots.add(slot);
                              } else {
                                draft.value.selectedCCUSlots.remove(slot);
                              }
                            })),
                ]),
                const SizedBox(height: 12),
              ],
              const SizedBox(height: 8),
              DropdownButtonFormField<int>(
                key: ValueKey('hangar-sort-$sort'),
                initialValue: sort,
                isExpanded: true,
                decoration: const InputDecoration(labelText: '排序'),
                items: const [
                  DropdownMenuItem(value: 0, child: Text('默认顺序')),
                  DropdownMenuItem(value: 1, child: Text('可融价从低到高')),
                  DropdownMenuItem(value: 2, child: Text('可融价从高到低')),
                ],
                onChanged: draft.busy
                    ? null
                    : (value) => draft.change(() {
                          draft.value.orderSelected = value != 0;
                          draft.value.priceOrder = value == 1;
                        }),
              ),
            ]),
          );
        },
      );
}
