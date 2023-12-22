import 'package:flutter/material.dart';
import 'package:superb_cuisine/core/model/category_model.dart';
import 'package:superb_cuisine/ui/pages/meal/meal.dart';

class HYHomeCategoryItem extends StatelessWidget {
  final HYCategoryModel category;

  const HYHomeCategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final bgColor = category.cColor;

    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              color: bgColor,
              gradient: LinearGradient(colors: [
                bgColor!.withOpacity(0.5),
                bgColor,
              ]),
              borderRadius: BorderRadius.circular(12)),
          alignment: Alignment.center,
          child: Text(
            category.title!,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontWeight: FontWeight.bold),
          )),
      onTap: () {
        // 跳转并传参
        Navigator.of(context)
            .pushNamed(HYMealScreen.routeName, arguments: category);
      },
    );
  }
}
