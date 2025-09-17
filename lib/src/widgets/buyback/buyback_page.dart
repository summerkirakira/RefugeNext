import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';
import 'buyback_item.dart';

class BuybackPage extends StatefulWidget {
  final Key? refreshKey;
  final Function(VoidCallback)? onScrollControllerReady;

  const BuybackPage({
    Key? key,
    this.refreshKey,
    this.onScrollControllerReady,
  }) : super(key: key);

  @override
  _BuybackPageState createState() => _BuybackPageState();
}

class _BuybackPageState extends State<BuybackPage> {
  final ScrollController _buybackScrollController = ScrollController();

  @override
  void dispose() {
    _buybackScrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    if (_buybackScrollController.hasClients) {
      _buybackScrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.onScrollControllerReady != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onScrollControllerReady!(_scrollToTop);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        key: widget.refreshKey,
        child: Container(
          child: Column(
            children: [
              if (Provider.of<MainDataModel>(context).isSearched)
                SizedBox(
                  height: 25,
                  width: double.infinity,
                  child: Container(
                    width: double.infinity,
                    color: Colors.red,
                    child: Stack(
                        children: [
                          Center(
                            child: Text(
                              '回购筛选中',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                              right: 5,
                              top: 3,
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<MainDataModel>(context, listen: false).clearSearch();
                                },
                                child: Text('取消',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                          ),
                        ]
                    ),
                  ),
                ),
              Expanded(
                  child: ListView.builder(
                    controller: _buybackScrollController,
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
