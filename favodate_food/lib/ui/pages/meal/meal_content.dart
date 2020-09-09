import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

import 'package:favodate_food/core/model/category_model.dart';
import 'package:favodate_food/core/model/meal_model.dart';
import 'package:favodate_food/core/viewmodel/meal_view_model.dart';
import 'package:favodate_food/ui/widget/meal_item.dart';

class MealContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context).settings.arguments as CategoryModel;

    return Selector<MealViewModel, List<MealModel>>(
      selector: (ctx, mealVM) => mealVM.meals.where((element) => element.categories.contains(category.id)).toList(),
      shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
      builder: (ctx, meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return MealItem(meals[index]);
          }

        );
      },
    );
  }
}

/*


class MealContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context).settings.arguments as CategoryModel;

    return Consumer<MealViewModel>(
      builder: (ctx, mealVM, child) {
        final meals = mealVM.meals.where((element) => element.categories.contains(category.id)).toList();

        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return ListTile(title: Text(meals[index].title),);
          }
        );
      },
    );
  }
}


* */