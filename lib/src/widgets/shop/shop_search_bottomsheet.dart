import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../datasource/data_model.dart';
import '../../datasource/models/shop_search_property.dart';
import 'shop_filter_options.dart';

class ShopSearchDraft extends ChangeNotifier {
  ShopSearchDraft(ShopSearchProperty? initial)
      : value = (initial ?? ShopSearchProperty.empty()).normalized(),
        text = TextEditingController(text: initial?.searchText ?? '');

  ShopSearchProperty value;
  final TextEditingController text;
  bool applied = false;

  void change(VoidCallback edit) {
    if (applied) return;
    edit();
    notifyListeners();
  }

  void reset() => change(() {
        value = ShopSearchProperty.empty();
        text.clear();
      });

  ShopSearchProperty snapshot() =>
      (value.copy()..searchText = text.text).normalized();

  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }
}

Future<void> showShopSearch(BuildContext context) {
  final model = context.read<MainDataModel>();
  return WoltModalSheet.show<void>(
    context: context,
    pageListBuilder: (sheetContext) => [
      getShopSearchBottomSheet(sheetContext, model),
    ],
  );
}

WoltModalSheetPage getShopSearchBottomSheet(
    BuildContext context, MainDataModel model) {
  final draft = ShopSearchDraft(model.shopSearchProperty);
  void apply() {
    if (draft.applied || !context.mounted) return;
    draft.applied = true;
    model.updateShopSearchProperty(draft.snapshot());
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }

  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text('商店搜索',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    ),
    trailingNavBarWidget: IconButton(
      tooltip: '关闭并放弃修改',
      icon: const Icon(Icons.close),
      onPressed: () => Navigator.of(context).pop(),
    ),
    child: ShopSearchFields(draft: draft, onApply: apply),
    stickyActionBar: Material(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: Row(children: [
            TextButton(onPressed: draft.reset, child: const Text('重置')),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton(
                key: const ValueKey('shop-search-apply'),
                onPressed: apply,
                child: const Text('应用筛选'),
              ),
            ),
          ]),
        ),
      ),
    ),
  );
}

class ShopSearchFields extends StatefulWidget {
  const ShopSearchFields(
      {super.key, required this.draft, required this.onApply});
  final ShopSearchDraft draft;
  final VoidCallback onApply;

  @override
  State<ShopSearchFields> createState() => _ShopSearchFieldsState();
}

class _ShopSearchFieldsState extends State<ShopSearchFields> {
  @override
  void dispose() {
    widget.draft.dispose();
    super.dispose();
  }

  Widget _chip(String key, String label, bool selected, VoidCallback select) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dark = theme.brightness == Brightness.dark;
    return ChoiceChip(
      key: ValueKey(key),
      label: Text(label,
          style: theme.textTheme.labelMedium?.copyWith(
              fontSize: 12,
              fontWeight: selected ? FontWeight.w500 : FontWeight.normal,
              color: selected ? colors.primary : colors.onSurfaceVariant)),
      selected: selected,
      showCheckmark: true,
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
      onSelected: (_) => widget.draft.change(select),
    );
  }

  Widget _section(String title, List<Widget> children) => Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 4),
          Wrap(spacing: 6, runSpacing: 2, children: children),
        ]),
      );

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: widget.draft,
        builder: (context, _) {
          final draft = widget.draft;
          final value = draft.value;
          final sort = value.orderSelected ? (value.priceOrder ? 1 : 2) : 0;
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 112),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: draft.text,
                builder: (context, text, _) => TextField(
                  key: const ValueKey('shop-search-text'),
                  controller: draft.text,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (_) => widget.onApply(),
                  decoration: InputDecoration(
                    hintText: '搜索中英文名称',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: text.text.isEmpty
                        ? null
                        : IconButton(
                            tooltip: '清空名称',
                            icon: const Icon(Icons.close),
                            onPressed: draft.text.clear),
                  ),
                ),
              ),
              _section('价格区间', [
                for (final option in shopPriceLabels.entries)
                  _chip(
                      'shop-price-${option.key}',
                      option.value,
                      value.priceRange.contains(option.key),
                      () => value.priceRange = [option.key]),
              ]),
              _section('商品版本', [
                for (final option
                    in const {'all': '不限', 'warbond': '战争债券'}.entries)
                  _chip(
                      'shop-version-${option.key}',
                      option.value,
                      value.itemFlags.contains(option.key),
                      () => value.itemFlags = [option.key]),
              ]),
              const SizedBox(height: 20),
              DropdownButtonFormField<int>(
                key: ValueKey('shop-sort-$sort'),
                initialValue: sort,
                isExpanded: true,
                decoration: const InputDecoration(labelText: '排序'),
                items: const [
                  DropdownMenuItem(value: 0, child: Text('默认顺序')),
                  DropdownMenuItem(value: 1, child: Text('价格从低到高')),
                  DropdownMenuItem(value: 2, child: Text('价格从高到低')),
                ],
                onChanged: (sort) => draft.change(() {
                  value.orderSelected = sort != 0;
                  value.priceOrder = sort == 1;
                }),
              ),
            ]),
          );
        },
      );
}
