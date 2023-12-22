import 'package:flutter/material.dart';
import 'package:superb_cuisine/core/extension/int_extension.dart';
import 'package:superb_cuisine/ui/pages/filter/filter.dart';

class HYHomeDrawer extends StatelessWidget {
  HYHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buildHeardView(context),
          buildListTitle(Icon(Icons.restaurant), '进餐', () {
            Navigator.of(context).pop();
          }),
          buildListTitle(Icon(Icons.settings), '过滤', () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(HYFilterScreen.routerName);
          }),
        ],
      ),
    );
  }

  // 标题
  Widget buildHeardView(context) {
    return Container(
      width: double.infinity,
      alignment: const Alignment(0, 0.5),
      color: Colors.red,
      height: 150.px,
      child: Text(
        '开始动手',
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(fontWeight: FontWeight.w900),
      ),
    );
  }

  // 操作列
  Widget buildListTitle(Widget icon, String title, void Function() handler) {
    return ListTile(
      onTap: handler,
      leading: icon,
      title: Text(title),
    );
  }
}
