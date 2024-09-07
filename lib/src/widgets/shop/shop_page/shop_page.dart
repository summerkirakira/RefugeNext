import 'package:flutter/material.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart' show CatalogTypes;
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart' show MainDataModel;
import 'shop_item_widget.dart' show ShopItemWidget;


class CatalogPage extends StatefulWidget {

  CatalogTypes catalogTypes;

  @override
  _ShopPageState createState() => _ShopPageState();
  CatalogPage({super.key, required this.catalogTypes});
}

class _ShopPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Container(
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: Provider.of<MainDataModel>(context).getCataLog(widget.catalogTypes).length,
                    itemBuilder: (context, index) {
                      return ShopItemWidget(
                        catalogProperty: Provider.of<MainDataModel>(context).getCataLog(widget.catalogTypes)[index],
                        catalogTypes: widget.catalogTypes
                      );
                    },
                  )
              ),
            ],
          ),
        ),
        onRefresh: () async {
          await Provider.of<MainDataModel>(context, listen: false)
              .refreshCatalog(widget.catalogTypes);
        });
  }
}