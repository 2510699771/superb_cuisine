import 'package:flutter/material.dart';
import 'package:superb_cuisine/ui/pages/home/home_content.dart';

class HYHomeScreen extends StatelessWidget {
  const HYHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('美食钢厂'),
        centerTitle: true,
      ),
      body: const HYHomeContent(),
    );
  }
}
