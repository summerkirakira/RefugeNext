import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';
import 'buyback_item.dart';

class BuybackPage extends StatefulWidget {
  @override
  _BuybackPageState createState() => _BuybackPageState();
}

class _BuybackPageState extends State<BuybackPage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Container(
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: Provider.of<MainDataModel>(context).buybackItems.length,
                    itemBuilder: (context, index) {
                      return BuybackItemWidget(
                        buybackItem: Provider.of<MainDataModel>(context).buybackItems[index],
                      );
                    },
                  )
              ),
            ],
          ),
        ),
        onRefresh: () async {
          await Provider.of<MainDataModel>(context, listen: false)
              .updateBuybackItems();
        });
  }
}
