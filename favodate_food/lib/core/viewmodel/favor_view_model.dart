import 'package:favodate_food/core/model/meal_model.dart';
import 'package:flutter/material.dart';

class FavorViewModel extends ChangeNotifier {
  List<MealModel> _favorMeals = [];


  List<MealModel> get favorMeals {
    return _favorMeals;
  }

  void addMeal(MealModel meal) {
    _favorMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(MealModel meal) {
    _favorMeals.remove(meal);
    notifyListeners();
  }
  
  void handleMeal(MealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }

  bool isFavor(MealModel meal) {
    return _favorMeals.contains(meal);
  }
}
