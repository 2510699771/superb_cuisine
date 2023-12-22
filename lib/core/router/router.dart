import 'package:flutter/material.dart';
import 'package:superb_cuisine/ui/pages/detail/detail.dart';
import 'package:superb_cuisine/ui/pages/filter/filter.dart';
import 'package:superb_cuisine/ui/pages/main/main.dart';
import 'package:superb_cuisine/ui/pages/meal/meal.dart';

class HYRouter {
  // 启动页面路由
  static const String initialRoute = HYMainScreen.routerName;

  static final Map<String, WidgetBuilder> routes = {
    HYMainScreen.routerName: (ctx) => const HYMainScreen(),
    HYMealScreen.routeName: (ctx) => const HYMealScreen(),
    HYDetail.routeName: (ctx) => const HYDetail(),
    // HYFilterScreen.routerName: (ctx) => const HYFilterScreen()
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == HYFilterScreen.routerName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return HYFilterScreen();
          },
          fullscreenDialog: true);
    }
  };

  // 404页面
  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
