import 'package:flutter/material.dart';
import 'package:superb_cuisine/core/extension/int_extension.dart';
import 'package:superb_cuisine/core/model/meal_model.dart';

class HYDetailContent extends StatelessWidget {
  final HYMealModel meal;

  const HYDetailContent({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildBannerImage(),
          buildMakeTitle(context, '制作材料'),
          buildMakeMaterial(context),
          buildMakeTitle(context, '步骤'),
          buildMakeStep(context),
        ],
      ),
    );
  }

//   1.横幅图片
  Widget buildBannerImage() {
    return Container(
        width: double.infinity, child: Image.network(meal.imageUrl!));
  }

//   2.制作材料
  Widget buildMakeMaterial(BuildContext context) {
    return buildMakeContent(
        context: context,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            return Card(
              color: Colors.orange,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 5.px, horizontal: 10.px),
                child: Text(meal.ingredients![index]),
              ),
            );
          },
          itemCount: meal.ingredients!.length,
        ));
  }

//   3.制作步骤
  Widget buildMakeStep(BuildContext context) {
    return buildMakeContent(
        context: context,
        child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text('#${index + 1}'),
                ),
                title: Text(meal.steps![index]),
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider();
            },
            itemCount: meal.steps!.length));
  }

//   公共方法
  Widget buildMakeTitle(BuildContext context, String title) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.px),
        child: Text(
          title,
          style: Theme.of(context).textTheme.displayLarge,
        ));
  }
}

//   公共边框
Widget buildMakeContent({BuildContext? context, Widget? child}) {
  return Container(
    width: MediaQuery.of(context!).size.width - 30.px,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.px),
        border: Border.all(color: Colors.grey)),
    padding: EdgeInsets.all(8.px),
    child: child,
  );
}
