import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superb_cuisine/core/model/category_model.dart';
import 'package:superb_cuisine/core/model/meal_model.dart';
import 'package:superb_cuisine/core/viewmodel/meal_view_model.dart';
import 'package:collection/collection.dart';
import 'package:superb_cuisine/ui/widgets/meal_item.dart';

// class HYMealContent extends StatelessWidget {
//   const HYMealContent({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // 获取参数（栈顶路由）
//     final category =
//         ModalRoute.of(context)!.settings.arguments as HYCategoryModel;
//
//     return Consumer<HYMealViewModel>(builder: (ctx, mealVM, child) {
//       print(mealVM.meals);
//       final mails = mealVM.meals
//           .where((meal) => meal.categories!.contains(category.id))
//           .toList();
//
//       return ListView.builder(
//         itemCount: mails.length,
//         itemBuilder: (ctx, index) {
//           return ListTile(
//             title: Text(mails[index].title!),
//           );
//         },
//       );
//     });
//   }
// }

class HYMealContent extends StatelessWidget {
  const HYMealContent({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取参数（栈顶路由）
    final category =
        ModalRoute.of(context)!.settings.arguments as HYCategoryModel;

    return Selector<HYMealViewModel, List<HYMealModel>>(
        builder: (ctx, meals, child) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              return HYMealItem(meal: meals[index]);
            },
            itemCount: meals.length,
          );
        },
        // 是否重新build  true重新build 反之;
        shouldRebuild: (prev, next) => !const ListEquality().equals(prev, next),
        // 将HYMealViewModel 转换成 List<HYMealModel>> 类型的函数（Selector会自动调用）
        selector: (ctx, mealVM) => mealVM.meals
            .where((meal) => meal.categories!.contains(category.id))
            .toList());
  }
}
