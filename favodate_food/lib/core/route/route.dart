import 'package:flutter/material.dart';

import 'package:favodate_food/ui/pages/meal/meal.dart';
import 'package:favodate_food/ui/pages/main/main.dart';
import 'package:favodate_food/ui/pages/detail/detail.dart';

class Router {

  static final String initialRoute = MainScreen.routeName;

  static final Map<String, WidgetBuilder> routers = {
    MainScreen.routeName: (ctx) => MainScreen(),
    MealScreen.routeName: (ctx) => MealScreen(),
    DetailScreen.routeName: (ctx) => DetailScreen(),
  };

  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}