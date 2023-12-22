import 'package:flutter/cupertino.dart';

import '../model/meal_model.dart';
import 'package:superb_cuisine/core/services/meal_request.dart';

class HYFavoViewModel extends ChangeNotifier {
  List<HYMealModel> _favoMeals = [];

  List<HYMealModel> get favoMeals {
    return _favoMeals;
  }

  bool isFavor(HYMealModel meal) {
    return _favoMeals.contains(meal);
  }

  void handerMeal(HYMealModel meal) {
    if (isFavor(meal)) {
      removeMel(meal);
    } else {
      addMel(meal);
    }
    notifyListeners();
  }

  void addMel(HYMealModel meal) {
    _favoMeals.add(meal);
    notifyListeners();
  }

  void removeMel(HYMealModel meal) {
    _favoMeals.remove(meal);
    notifyListeners();
  }
}
