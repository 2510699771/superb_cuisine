// 共享

import 'package:flutter/foundation.dart';

import '../model/meal_model.dart';
import 'package:superb_cuisine/core/services/meal_request.dart';

class HYMealViewModel extends ChangeNotifier {
  List<HYMealModel> _meals = [];

  List<HYMealModel> get meals {
    return _meals;
  }

  HYMealViewModel() {
    HYMealRequest.getMealData().then((value) {
      _meals = value;
      // 让依赖重新构建
      notifyListeners();
    });
  }
}
