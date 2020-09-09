import 'package:flutter/material.dart';

import 'package:favodate_food/core/model/meal_model.dart';
import 'package:favodate_food/core/extension/int_extension.dart';

class DetailContent extends StatelessWidget {

  final MealModel _meal;

  DetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildTitle(context, "制作材料"),
          buildMakeMaterial(context),
          buildTitle(context, "制作步骤"),
          buildMakeSteps(context),
        ],
      ),
    );
  }

  // 1.横幅图片
  Widget buildBannerImage() {
    return Container(
      width: double.infinity,
      child: Image.network(_meal.imageUrl),
    );
  }

  // 2.制作材料
  Widget buildMakeMaterial(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount:_meal.ingredients.length ,
        itemBuilder: (ctx, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.px, horizontal: 10.px),
              child: Text(_meal.ingredients[index]),
            ),
          );
        },
      ),
    );

  }

  // 3.制作过程
  Widget buildMakeSteps(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _meal.steps.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text("#${index}"),
            ),
            title: Text(_meal.steps[index]),
          );
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
      ),
    );

  }

  // 公共方法
  Widget buildTitle(BuildContext context, String _title) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Text(_title, style: Theme.of(context).textTheme.display3.copyWith(fontWeight: FontWeight.bold),),
    );
  }

  Widget buildMakeContent({BuildContext context, Widget child}) {
    return Container(
      width: MediaQuery.of(context).size.width - 30.px,
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.px)
      ),
      child: child,
    );
  }
}
