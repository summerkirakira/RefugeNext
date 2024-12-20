import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';

class ShipInfoTitle extends StatefulWidget {

  const ShipInfoTitle({Key? key}) : super(key: key);

  @override
  _ShipInfoTitleState createState() => _ShipInfoTitleState();
}

class _ShipInfoTitleState extends State<ShipInfoTitle> {
  @override
  Widget build(BuildContext context) {

    final currentShipInfo = Provider.of<MainDataModel>(context).currentShipInfo!;
    final chineseName = currentShipInfo.chineseName ?? currentShipInfo.name;
    final englishName = currentShipInfo.name;
    final shipThumbnail = currentShipInfo.shipNameBinding?.shipPicName;


    final shipPicUrl ="https://image.biaoju.site/refuge/data/ship_render/$shipThumbnail.thumb.png";


    return Container(
      padding: EdgeInsets.all(16),
      child: Expanded(
        child: Stack(
          children: [
            Expanded(
              child: Row(
                children: [
                  Spacer(),
                  CachedNetworkImage(
                    imageUrl: shipPicUrl,
                    width: 240,
                    height: 120,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 200,
                      ),
                      child: Text(chineseName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    Text(englishName, style: TextStyle(fontSize: 16, color: Colors.grey)),
                    // Spacer(),
                  ],
                ),
                // Text('船舶信息', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}