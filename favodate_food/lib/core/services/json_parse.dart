
import 'dart:convert';

import 'package:favodate_food/core/model/category_model.dart';
import 'package:flutter/services.dart';

class JsonParse {

  static Future<List<CategoryModel>> getCategoryData() async {
    
    // 1.加载json文件
    final jsonString = await rootBundle.loadString("assets/json/category.json");

    // 2.将JsonString转成Map或者List
    final result = json.decode(jsonString);

    // 3.将Map中的内容转成一个个的对象
    final resultList = result["category"];
    List<CategoryModel> categoryies = [];
    for (var json in resultList) {
      categoryies.add(CategoryModel.fromJson(json));
    }

    return categoryies;
  }
}