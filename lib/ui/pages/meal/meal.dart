import 'package:flutter/material.dart';
import 'package:superb_cuisine/core/model/category_model.dart';
import 'package:superb_cuisine/ui/pages/meal/meal_content.dart';

class HYMealScreen extends StatelessWidget {
  static const String routeName = '/meal';

  const HYMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取参数
    final category =
        ModalRoute.of(context)!.settings.arguments as HYCategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title!),
      ),
      body: const HYMealContent(),
    );
  }
}
