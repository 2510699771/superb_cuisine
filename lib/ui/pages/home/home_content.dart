import 'package:flutter/material.dart';
import 'package:superb_cuisine/core/extension/int_extension.dart';

import 'package:superb_cuisine/core/services/json_parse.dart';
import 'package:superb_cuisine/core/services/meal_request.dart';
import 'package:superb_cuisine/core/model/category_model.dart';
import './home_category_item.dart';

class HYHomeContent extends StatefulWidget {
  const HYHomeContent({super.key});

  @override
  State<HYHomeContent> createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  //   // 接受json定义的数组
  // List<HYCategoryModel> _categorys = [];
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   // HYMealRequest.getMealData().then((value) {
  //   //   print(value);
  //   // });
  //
  //   // 异步获取json
  //   // JsonParse.getCategoryDate().then((value) {
  //   //   setState(() {
  //   //     _categorys = value;
  //   //   });
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HYCategoryModel>>(
        future: JsonParse.getCategoryDate(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.error != null) {
            return Center(child: Text('请求错误'));
          }

          final _categorys = snapshot.data;

          return GridView.builder(
              padding: EdgeInsets.all(15.px),
              itemCount: _categorys!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.px,
                  mainAxisSpacing: 20.px,
                  childAspectRatio: 1.5),
              itemBuilder: (BuildContext context, int index) {
                return HYHomeCategoryItem(category: _categorys[index]);
              });
        });
  }
}
