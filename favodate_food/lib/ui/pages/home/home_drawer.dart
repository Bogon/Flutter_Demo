import 'package:flutter/material.dart';
import 'package:favodate_food/core/extension/int_extension.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buildHeaderView(context),
          buildListTitle(context, Icon(Icons.restaurant), "进餐", () {
            Navigator.of(context).pop();
          }),
          buildListTitle(context, Icon(Icons.settings), "过滤", () {

          }),
        ],
      ),
    );
  }

  Widget buildHeaderView (BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.px,
      color: Colors.orange,
      margin: EdgeInsets.only(bottom: 20.px),
      alignment: Alignment(0, 0.5),
      child: Text("开始动手", style: Theme.of(context).textTheme.display3.copyWith(fontWeight: FontWeight.bold),),
    );
  }

  Widget buildListTitle(BuildContext context, Widget icon, String title, Function heandler) {
    return ListTile(
      leading: icon,
      title: Text(title, style: Theme.of(context).textTheme.display2,),
      onTap: heandler,
    );
  }
}
