import 'package:flutter/material.dart';
import 'package:favodate_food/core/model/meal_model.dart';
import 'package:favodate_food/core/services/meal_request.dart';
import 'package:provider/provider.dart';

class MealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];

  List<MealModel> get meals {
    return _meals;
  }

  MealViewModel() {
    MealRequest.getMealData().then((res) {
      _meals = res;
      notifyListeners();
    });
  }

}