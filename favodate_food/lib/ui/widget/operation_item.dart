import 'package:flutter/material.dart';
import 'package:favodate_food/core/extension/int_extension.dart';

class OperationItem extends StatelessWidget {

  final Widget _icon;
  final String _title;
  final Color favorColor;

  OperationItem(this._icon, this._title, {this.favorColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 100.px,
      padding: EdgeInsets.symmetric(vertical: 14.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon,
          SizedBox(width: 3.px,),
          Text(_title, style: TextStyle(color: favorColor),),
        ],
      ),
    );
  }

}