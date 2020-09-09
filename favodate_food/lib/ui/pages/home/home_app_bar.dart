import 'package:flutter/material.dart';

class HomeAppBar extends AppBar {

  HomeAppBar(BuildContext context) : super(
    title: Text("美食广场"),
    leading: Builder(
      builder: (ctx) {
        return IconButton(
          icon: Icon(Icons.settings, color: Colors.white,),
          onPressed: () {
            Scaffold.of(ctx).openDrawer();
          },
        );
      },
    ),
  );
}
