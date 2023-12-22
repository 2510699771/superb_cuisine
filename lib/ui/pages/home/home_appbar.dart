import 'package:flutter/material.dart';

class HYHomeAppBar extends AppBar {
  HYHomeAppBar(BuildContext context, {super.key})
      : super(
          title: const Text('美食钢厂'),
          leading: Builder(builder: (ctx) {
            return IconButton(
              icon: const Icon(Icons.build),
              onPressed: () {
                Scaffold.of(ctx).openDrawer();
              },
            );
          }),
          centerTitle: true,
        );
}
