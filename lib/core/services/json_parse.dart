import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:superb_cuisine/core/model/category_model.dart';

class JsonParse {
  static Future<List<HYCategoryModel>> getCategoryDate() async {
    //   1.加载json数据   (jsonStr拿到的是完整的字符串)
    final jsonStr = await rootBundle.loadString('assets/json/category.json');

    //   2.将jsonStr 转成Map/List
    final result = json.decode(jsonStr);

    //   3.将Map中的类装换成一个个对象
    final resultList = result['category'];

    List<HYCategoryModel> categorys = [];
    for (var jsonitem in resultList) {
      categorys.add(HYCategoryModel.fromJson(jsonitem));
    }

    return categorys;
  }
}
