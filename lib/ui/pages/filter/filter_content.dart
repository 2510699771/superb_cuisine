import 'package:flutter/material.dart';
import 'package:superb_cuisine/core/extension/int_extension.dart';

class HYFilterContent extends StatelessWidget {
  const HYFilterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [buildTitle(context), buildChoseSelect()],
    );
  }

  Widget buildTitle(context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.px),
      child: Center(
        child: Text(
          '展示你的选择',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget buildChoseSelect() {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          buildListTitle('无谷蛋白', '无谷蛋白', (value) {}),
          buildListTitle('不含乳糖', '不含乳糖', (value) {}),
          buildListTitle('素食主义', '素食主义', (value) {}),
          buildListTitle('严格素食主义', '严格素食主义', (value) {}),
        ],
      ),
    );
  }

  Widget buildListTitle(
      String title, String subtitle, void Function(bool) onChange) {
    return ListTile(
      title: Text(title),
      // 首部
      subtitle: Text(subtitle),
      // 尾部
      trailing: Switch(
        value: false,
        onChanged: onChange,
      ),
    );
  }
}
