import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superb_cuisine/core/extension/double_extension.dart';
import 'package:superb_cuisine/core/extension/int_extension.dart';
import 'package:superb_cuisine/core/model/meal_model.dart';
import 'package:superb_cuisine/core/viewmodel/favo_view_model.dart';
import 'package:superb_cuisine/ui/pages/detail/detail.dart';
import 'package:superb_cuisine/ui/widgets/operation_item.dart';

class HYMealItem extends StatelessWidget {
  final HYMealModel meal;

  const HYMealItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
        child: Column(
          children: [buildBasicInfo(context), buildOperationInfo()],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(HYDetail.routeName, arguments: meal);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    final cardRadius = 12.px;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cardRadius),
            topRight: Radius.circular(cardRadius),
          ),
          child: Image.network(
            meal.imageUrl!,
            width: double.infinity,
            height: 250.px,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            width: 300.px,
            padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(5.px)),
            child: Text(
              meal.title!,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w100),
            ),
          ),
        )
      ],
    );
  }

  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.all(0.0.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HYOperationItem(
              title: '${meal.duration} 分钟', icon: const Icon(Icons.schedule)),
          HYOperationItem(
              title: '${meal.complexity} 难度',
              icon: const Icon(Icons.restaurant)),
          buildFavoItem(),
        ],
      ),
    );
  }

  Widget buildFavoItem() {
    return Consumer<HYFavoViewModel>(builder: (ctx, favoVm, child) {
      // 判断商品是否已经收藏

      // 判断是否是收藏状态
      final iconData =
          favoVm.isFavor(meal) ? Icons.favorite : Icons.favorite_border;

      final title = favoVm.isFavor(meal) ? '已收藏' : '未收藏';

      final colorData = favoVm.isFavor(meal) ? Colors.red : Colors.black;

      return Consumer<HYFavoViewModel>(
        builder: (BuildContext context, HYFavoViewModel value, Widget? child) {
          return GestureDetector(
              onTap: () {
                value.handerMeal(meal);
              },
              child: HYOperationItem(
                  title: title,
                  textColor: colorData,
                  icon: Icon(
                    iconData,
                    color: colorData,
                  )));
        },
      );
    });
  }
}

// operation_item
