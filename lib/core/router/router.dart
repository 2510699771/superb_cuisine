import 'package:flutter/material.dart';
import 'package:superb_cuisine/ui/pages/detail/detail.dart';
import 'package:superb_cuisine/ui/pages/main/main.dart';
import 'package:superb_cuisine/ui/pages/meal/meal.dart';

class HYRouter {
  // 启动页面路由
  static const String initialRoute = HYMainScreen.routerName;

  static final Map<String, WidgetBuilder> routes = {
    HYMainScreen.routerName: (ctx) => const HYMainScreen(),
    HYMealScreen.routeName: (ctx) => const HYMealScreen(),
    HYDetail.routeName: (ctx) => const HYDetail(),
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  // 404页面
  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
