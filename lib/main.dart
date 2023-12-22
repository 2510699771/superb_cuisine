import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superb_cuisine/core/router/router.dart';
import 'package:superb_cuisine/core/viewmodel/favo_view_model.dart';
import 'package:superb_cuisine/core/viewmodel/meal_view_model.dart';
import 'package:superb_cuisine/ui/shared/app_theme.dart';
import 'package:superb_cuisine/ui/shared/size_fit.dart';

void main() {
  // provider => ViewMedal/Provider/Consumer(Selector)

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => HYMealViewModel()),
      ChangeNotifierProvider(create: (ctx) => HYFavoViewModel())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();

    return MaterialApp(
      title: '美食广场',
      // 主题
      theme: HYAppTheme.norTheme,
      // 暗黑主题
      darkTheme: HYAppTheme.darkTheme,
      // 初始化路由
      initialRoute: HYRouter.initialRoute,
      // 所有路由
      routes: HYRouter.routes,
      // 路由拦截
      onGenerateRoute: HYRouter.generateRoute,
      // 404页面
      onUnknownRoute: HYRouter.unknownRoute,
    );
  }
}
