import 'package:flutter/material.dart';

import './favor_content.dart';

class HYFavorScreen extends StatefulWidget {
  const HYFavorScreen({super.key});

  @override
  State<HYFavorScreen> createState() => _HYFavorScreenState();
}

class _HYFavorScreenState extends State<HYFavorScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: HYFavorContent(),
    );
  }
}
