import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:favodate_food/core/model/meal_model.dart';
import 'package:favodate_food/core/viewmodel/favor_view_model.dart';

class DetailFloatingButton extends StatelessWidget {

  final MealModel _meal;

  DetailFloatingButton(this._meal);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavorViewModel>(
      builder: (ctx, favorVM, child) {
        // 1.判断是否是收藏状态
        final favorData = favorVM.isFavor(_meal) ? Icons.favorite: Icons.favorite_border;
        final favorColor = favorVM.isFavor(_meal) ? Colors.red: Colors.black;

        return FloatingActionButton(
          child: Icon(favorData, color: favorColor,),
          onPressed: () {
            favorVM.handleMeal(_meal);
          },
        );
      },
    );
  }
}
