import 'package:flutter/material.dart';
import '../home/home_appbar.dart';
import '../home/home_drawer.dart';
import './initialize_items.dart';

class HYMainScreen extends StatefulWidget {
  static const String routerName = '/';

  const HYMainScreen({super.key});

  @override
  State<HYMainScreen> createState() => _HYMainScreenState();
}

class _HYMainScreenState extends State<HYMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: items,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      appBar: HYHomeAppBar(context),
      drawer: HYHomeDrawer(),
    );
  }
}
