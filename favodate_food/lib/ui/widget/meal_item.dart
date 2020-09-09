import 'package:favodate_food/core/viewmodel/favor_view_model.dart';
import 'package:favodate_food/ui/pages/detail/detail.dart';
import 'package:favodate_food/ui/widget/operation_item.dart';
import 'package:flutter/material.dart';

import 'package:favodate_food/core/model/meal_model.dart';
import 'package:favodate_food/core/extension/int_extension.dart';
import 'package:provider/provider.dart';

final cardRadius = 12.px;

class MealItem extends StatelessWidget {

  final MealModel meal;
  MealItem(this.meal);

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardRadius)),
        child: Column(
          children: [
            buildBasicInfo(context),
            buildOperationInfo(),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(DetailScreen.routeName, arguments: meal);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cardRadius),
            topRight: Radius.circular(cardRadius),
          ),
          child: Image.network(meal.imageUrl, width: double.infinity, height: 250.px, fit: BoxFit.cover,),
        ),
        Positioned(
          right: 10.px,
          bottom: 5.px,
          child: Container(
            width: 300.px,
            padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(6.px),
            ),
            child: Text(meal.title, style: Theme.of(context).textTheme.display3.copyWith(color: Colors.white),),
          ),
        ),
      ],
    );
  }

  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.all(16.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OperationItem(Icon(Icons.schedule), "${meal.duration}分钟"),
          OperationItem(Icon(Icons.restaurant), "${meal.complexStr}"),
          buildFavorItem(),
        ],
      ),
    );
  }

  Widget buildFavorItem() {
    return Consumer<FavorViewModel>(
      builder: (ctx, favorVM, child) {
        // 1.判断是否是收藏状态
        final iconData = favorVM.isFavor(meal) ? Icons.favorite : Icons.favorite_border;
        final favorColor = favorVM.isFavor(meal) ? Colors.red : Colors.black;
        final _title = favorVM.isFavor(meal) ? "已收藏" : "未收藏";

        return GestureDetector(
          child: OperationItem(
            Icon(iconData, color: favorColor,),
            _title,
            favorColor: favorColor,
          ),
          onTap: () {
            favorVM.handleMeal(meal);
          },
        );
      },
    );
  }

}
