import 'package:flutter/material.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart'
    show CatalogTypes;
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart' show MainDataModel;
import '../shop_filter_bar.dart';
import '../shop_search_bottomsheet.dart';
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

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MainDataModel>(context);
    final items = model.getCataLog(widget.catalogTypes);
    return Column(
      children: [
        if (model.shopSearchProperty case final property?)
          ShopFilterBar(
            property: property,
            onApply: model.updateShopSearchProperty,
            onClear: model.clearShopSearch,
            onEdit: () => showShopSearch(context),
          ),
        Expanded(
          child: RefreshIndicator(
            key: widget.refreshKey,
            onRefresh: () async {
              await Provider.of<MainDataModel>(context, listen: false)
                  .refreshCatalog(widget.catalogTypes);
            },
            child: items.isEmpty
                ? ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: 80),
                      const Center(
                        child:
                            Text('无匹配结果', style: TextStyle(color: Colors.grey)),
                      ),
                      if (model.isShopSearched) ...[
                        Center(
                            child: TextButton(
                                onPressed: () => showShopSearch(context),
                                child: const Text('修改筛选'))),
                        Center(
                            child: TextButton(
                                onPressed: model.clearShopSearch,
                                child: const Text('清除筛选'))),
                      ],
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
}
