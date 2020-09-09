import 'package:favodate_food/core/model/meal_model.dart';
import 'package:favodate_food/core/services/http_request.dart';

class MealRequest {

  static Future<List<MealModel>> getMealData() async {
    // 1.发送网络请求
    final url = "/meal";
    final result = await HttpRequest.request(url);

    // 2.json转model
    final meal_list = result["meal"];
    List<MealModel>  meals = [];

    for(var json in meal_list) {
      meals.add(MealModel.fromJson(json));
    }

    return meals;
  }

}