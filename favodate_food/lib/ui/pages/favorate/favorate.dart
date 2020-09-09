import 'package:flutter/material.dart';

import 'favor_content.dart';

class FavorateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏"),
      ),

      body: FavorContent(),
    );
  }
}
