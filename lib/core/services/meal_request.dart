import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:superb_cuisine/core/model/meal_model.dart';

import 'http_request.dart';

// class HYMealRequest {
//   static Future<List<HYMealModel>> getMealData() async {
//     // 1.发送网络请求
//     final url = "/meal";
//     final result = await HttpRequest.request(url);
//
//     // 2.json转modal
//     final mealArray = result["meal"];
//     List<HYMealModel> meals = [];
//     for (var json in mealArray) {
//       meals.add(HYMealModel.fromJson(json));
//     }
//     return meals;
//   }
// }

class HYMealRequest {
  static Future<List<HYMealModel>> getMealData() async {
    //   1.
    final mealStr = await rootBundle.loadString('assets/json/meal.json');
    //   2.
    final result = json.decode(mealStr);
    //   3.
    final resultList = result['meal'];
    List<HYMealModel> mealList = [];
    for (var i in resultList) {
      mealList.add(HYMealModel.fromJson(i));
    }
    return mealList;
  }
}
