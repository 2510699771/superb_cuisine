import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superb_cuisine/core/model/meal_model.dart';
import 'package:superb_cuisine/core/viewmodel/favo_view_model.dart';
import 'package:superb_cuisine/ui/pages/detail/detail_content.dart';
import 'package:superb_cuisine/ui/pages/detail/detail_floating_button.dart';

class HYDetail extends StatelessWidget {
  static const String routeName = '/detail';

  const HYDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as HYMealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title!),
      ),
      body: Container(
        child: HYDetailContent(
          meal: meal,
        ),
      ),
      floatingActionButton: HYDetailFloatingButton(meal: meal),
    );
  }
}
