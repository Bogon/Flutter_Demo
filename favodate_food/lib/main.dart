import 'package:favodate_food/core/services/meal_request.dart';
import 'package:favodate_food/core/viewmodel/favor_view_model.dart';
import 'package:favodate_food/core/viewmodel/meal_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './core/route/route.dart';
import './ui/shared/app_theme.dart';
import './ui/shared/size_fit.dart';

main() {
  // provider -> ViewModel/Provider/Consumer(Selector)
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => MealViewModel(),),
        ChangeNotifierProvider(create: (ctx) => FavorViewModel(),)
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SizeFit.initialize();

    // 1.对SizeFit进行初始化
    return MaterialApp(
      title: "咿呀美食",

      /// 1.主题
      theme: AppTheme.normalTheme,

      /// 2.路由
      initialRoute: Router.initialRoute,
      routes: Router.routers,
      onGenerateRoute: Router.generateRoute,
      onUnknownRoute: Router.unknownRoute,
    );
  }
}