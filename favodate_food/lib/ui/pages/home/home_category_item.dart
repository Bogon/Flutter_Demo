import 'package:flutter/material.dart';
import '../../../core/model/category_model.dart';
import '../../../core/extension/int_extension.dart';
import '../meal/meal.dart';

class HomeCategoryItem extends StatelessWidget {

  final CategoryModel _category_model;

  HomeCategoryItem(this._category_model);

  @override
  Widget build(BuildContext context) {

    final bgColor =  _category_model.cColor;

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10.px),
            gradient: LinearGradient(
                colors: [
                  bgColor.withOpacity(0.5),
                  bgColor,
                ]
            )
        ),
        alignment: Alignment.center,
        child: Text(
          _category_model.title,
          style: Theme.of(context).textTheme.display2.copyWith(
            fontWeight:  FontWeight.bold,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(MealScreen.routeName, arguments: _category_model);
      },
    );
  }
}
