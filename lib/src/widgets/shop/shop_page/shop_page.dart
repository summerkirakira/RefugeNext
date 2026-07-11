import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart' show CatalogTypes;
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart' show MainDataModel;
import 'package:refuge_next/src/datasource/models/shop_search_property.dart';
import 'shop_item_widget.dart' show ShopItemWidget;


class CatalogPage extends StatefulWidget {
  final CatalogTypes catalogTypes;
  final Key? refreshKey;

  const CatalogPage({
    super.key,
    required this.catalogTypes,
    this.refreshKey,
  });

  @override
  State<CatalogPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<CatalogPage> {
  bool _autoRefreshTriggered = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_autoRefreshTriggered || !mounted) return;
      _autoRefreshTriggered = true;
      final model = context.read<MainDataModel>();
      if (model.getCataLog(widget.catalogTypes).isEmpty) {
        await model.refreshCatalog(widget.catalogTypes);
      }
    });
  }

  // —— 当前全局搜索条件的派生展示值 ——
  String get _sortLabel {
    final p = context.read<MainDataModel>().shopSearchProperty;
    if (p == null || !p.orderSelected) return '默认';
    return p.priceOrder ? '价格升序' : '价格降序';
  }

  int get _filterCount {
    final p = context.read<MainDataModel>().shopSearchProperty;
    if (p == null) return 0;
    var n = 0;
    n += p.priceRange.where((e) => e != 'all').length;
    n += p.itemFlags.where((e) => e != 'all').length;
    return n;
  }

  /// 取当前全局条件的可变副本;无则新建一份「全部」默认。
  ShopSearchProperty _currentOrDefault() {
    final p = context.read<MainDataModel>().shopSearchProperty;
    return ShopSearchProperty(
      searchType: p?.searchType ?? ['all'],
      priceRange: List<String>.from(p?.priceRange ?? ['all']),
      stockStatus: p?.stockStatus ?? ['all'],
      itemFlags: List<String>.from(p?.itemFlags ?? ['all']),
      searchText: p?.searchText,
      orderSelected: p?.orderSelected ?? false,
      priceOrder: p?.priceOrder ?? false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MainDataModel>(context);
    final items = model.getCataLog(widget.catalogTypes);
    return Column(
      children: [
        _toolbar(items.length),
        Expanded(
          child: RefreshIndicator(
            key: widget.refreshKey,
            onRefresh: () async {
              await Provider.of<MainDataModel>(context, listen: false)
                  .refreshCatalog(widget.catalogTypes);
            },
            child: items.isEmpty
                ? ListView(
                    children: const [
                      SizedBox(height: 80),
                      Center(
                        child: Text('无匹配结果',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) => ShopItemWidget(
                      catalogProperty: items[index],
                      catalogTypes: widget.catalogTypes,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _toolbar(int count) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: _showSortSheet,
                    icon: const Icon(Icons.swap_vert, size: 18),
                    label: Text('排序：$_sortLabel'),
                    style: OutlinedButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                  const SizedBox(width: 8),
                  badges.Badge(
                    showBadge: _filterCount > 0,
                    badgeContent: Text('$_filterCount',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10)),
                    child: OutlinedButton.icon(
                      onPressed: _showFilterSheet,
                      icon: const Icon(Icons.filter_list, size: 18),
                      label: const Text('筛选'),
                      style: OutlinedButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text('$count 项',
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  void _showSortSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          final p = this.context.read<MainDataModel>().shopSearchProperty;
          // 当前选中项:0=默认, 1=价格降序, 2=价格升序
          final current = (p == null || !p.orderSelected)
              ? 0
              : (p.priceOrder ? 2 : 1);

          void pick(int i) {
            final next = _currentOrDefault();
            if (i == 0) {
              next.orderSelected = false;
            } else {
              next.orderSelected = true;
              next.priceOrder = i == 2; // 2=升序
            }
            this.context.read<MainDataModel>().updateShopSearchProperty(next);
            Navigator.of(context).pop();
          }

          Widget tile(String label, int i) => ListTile(
                dense: true,
                title: Text(label),
                trailing: current == i
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : null,
                onTap: () => pick(i),
              );

          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text('排序',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                tile('默认', 0),
                tile('价格降序', 1),
                tile('价格升序', 2),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showFilterSheet() {
    const priceRanges = ['all', '0-100', '100-500', '500+'];
    const priceLabels = {
      'all': '全部',
      '0-100': '0-100',
      '100-500': '100-500',
      '500+': '500+',
    };

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          // 直接在草稿 property 上编辑,选完即写回全局。
          final draft = _currentOrDefault();

          void apply() =>
              this.context.read<MainDataModel>().updateShopSearchProperty(draft);

          // 单选价格区间(含「全部」);「全部」等价于清空过滤。
          bool priceSelected(String v) => v == 'all'
              ? draft.priceRange.where((e) => e != 'all').isEmpty
              : draft.priceRange.contains(v);

          void pickPrice(String v) {
            setSheet(() {
              draft.priceRange = v == 'all' ? ['all'] : [v];
            });
            apply();
          }

          bool warbondOn() => draft.itemFlags.contains('warbond');
          void toggleWarbond(bool on) {
            setSheet(() {
              draft.itemFlags = on ? ['warbond'] : ['all'];
            });
            apply();
          }

          Widget group(String title, List<Widget> chips) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4, top: 12, bottom: 6),
                    child: Text(title,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                  Wrap(spacing: 8, runSpacing: 4, children: chips),
                ],
              );

          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.6,
            maxChildSize: 0.92,
            builder: (context, controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                    child: Row(
                      children: [
                        const Text('筛选',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            setSheet(() {
                              draft.priceRange = ['all'];
                              draft.itemFlags = ['all'];
                            });
                            apply();
                          },
                          child: const Text('清除'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      children: [
                        group('价格区间', [
                          for (final v in priceRanges)
                            FilterChip(
                              label: Text(priceLabels[v]!),
                              selected: priceSelected(v),
                              onSelected: (_) => pickPrice(v),
                            ),
                        ]),
                        group('特殊标签', [
                          FilterChip(
                            label: const Text('战争债券'),
                            selected: warbondOn(),
                            onSelected: toggleWarbond,
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
