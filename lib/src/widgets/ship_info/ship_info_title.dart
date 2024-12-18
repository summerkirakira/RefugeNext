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


    final shipPicUrl ="https://image.biaoju.site/starcitizen/refuge_next/ship_info/ship_thumb/$shipThumbnail.thumb.png";


    return Container(
      padding: EdgeInsets.all(16),
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(chineseName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(englishName, style: TextStyle(fontSize: 16, color: Colors.grey)),
                // Spacer(),
              ],
            ),
            Spacer(),
            AdvancedAvatar(
                name: 'Hangar',
                size: 120,
                image: CachedNetworkImageProvider(shipPicUrl),
                margin: EdgeInsets.only(),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                )),
            // Text('船舶信息', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}