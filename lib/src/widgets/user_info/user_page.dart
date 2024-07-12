import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../datasource/data_model.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainDataModel>(
      builder: (context, model, child) {
        return model.currentUser == null ?
          const Center(child: Text('No user data')) :
          Text('User: ${model.currentUser!.email}');
      },
    );
  }
}
