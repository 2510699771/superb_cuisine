import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superb_cuisine/core/model/meal_model.dart';
import 'package:superb_cuisine/core/viewmodel/favo_view_model.dart';

class HYDetailFloatingButton extends StatelessWidget {
  final HYMealModel meal;

  const HYDetailFloatingButton({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Consumer<HYFavoViewModel>(
      builder: (context, favoVM, child) {
        // 判断是否是收藏状态
        final iconData =
            favoVM.isFavor(meal) ? Icons.favorite : Icons.favorite_border;
        final colorData = favoVM.isFavor(meal) ? Colors.red[900] : Colors.black;
        return FloatingActionButton(
          onPressed: () {
            favoVM.handerMeal(meal);
          },
          child: Icon(
            iconData,
            color: colorData,
          ),
        );
      },
    );
  }
}
