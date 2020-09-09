import 'package:flutter/material.dart';
import 'package:favodate_food/core/model/category_model.dart';
import 'package:favodate_food/core/services/json_parse.dart';
import 'package:favodate_food/core/extension/int_extension.dart';
import 'home_category_item.dart';

class HomeContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: JsonParse.getCategoryData(),
      builder: (ctx, snapshot) {

        if (!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
        if (snapshot.hasError) return Center(child: Text("请求失败"),);

        final categories = snapshot.data;
        return GridView.builder(
            padding: EdgeInsets.all(20.px),
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.px,
              mainAxisSpacing: 20.px,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (ctx, index) {
              return HomeCategoryItem(categories[index]);
            }
        );
      },
    );
  }
}

