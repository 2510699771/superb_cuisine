import 'package:flutter/material.dart';
import 'package:superb_cuisine/ui/pages/home/home_content.dart';

class HYHomeScreen extends StatelessWidget {
  const HYHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Scaffold.of(context);

    return const Scaffold(
      body: HYHomeContent(),
    );
  }
}
