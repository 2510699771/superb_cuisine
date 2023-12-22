import 'package:flutter/material.dart';
import 'package:superb_cuisine/ui/pages/filter/filter_content.dart';

class HYFilterScreen extends StatelessWidget {
  const HYFilterScreen({super.key});

  static const routerName = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('过滤'),
      ),
      body: HYFilterContent(),
    );
  }
}
