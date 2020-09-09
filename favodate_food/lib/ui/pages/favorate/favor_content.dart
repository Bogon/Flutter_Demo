import 'package:favodate_food/core/viewmodel/favor_view_model.dart';
import 'package:favodate_food/ui/widget/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavorViewModel>(
      builder: (ctx, favorVM, child) {

        if (favorVM.favorMeals.length == 0) {
          return Center(
            child: Text("未收藏美食"),
          );
        }

        return ListView.builder(
          itemCount: favorVM.favorMeals.length,
          itemBuilder: (itemCtx, index){
            return MealItem(favorVM.favorMeals[index]);
          },
        );
      },
    );
  }
}
