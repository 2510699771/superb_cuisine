import 'package:flutter/material.dart';
import './count1.dart';
import './count2.dart';
import './count3.dart';
import './count4.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatefulWidget {
  const HYHomePage({super.key});

  @override
  State<HYHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  int _index = 0;

  final List<BottomNavigationBarItem> list = [
    BottomNavigationBarItem(
        icon: Icon(Icons.add_a_photo),
        activeIcon: Icon(Icons.access_alarm),
        label: '首页'),
    BottomNavigationBarItem(
        icon: Icon(Icons.ac_unit_outlined),
        activeIcon: Icon(Icons.account_balance_wallet_sharp),
        label: '次页'),
  ];

  final bodyList = [page1(), page2()];

  void add(int index) {
    setState(() {
      _index = index;
    });
  }

  // 控制器
  final PageController _pageCtr = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          items: list,
          onTap: add,
        ),
        body: bodyList[_index]);
  }
}

// 第一个tabbar
class _TabData {
  late final Widget tab;
  late final Widget body;

  _TabData({
    required this.tab,
    required this.body,
  });
}

final _tabDataList = <_TabData>[
  _TabData(tab: Text('推荐'), body: count1()),
  _TabData(tab: Text('VIP'), body: count2()),
  _TabData(tab: Text('小说'), body: count3()),
  _TabData(tab: Text('直播'), body: count4()),
];

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  final tabBarList = _tabDataList.map((item) => item.tab).toList();
  final tabBarViewList = _tabDataList.map((item) => item.body).toList();

  @override
  void initState() {
    print(tabBarList);
    print(tabBarViewList);
    print('第一个页面初始化');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabDataList.length,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              padding: EdgeInsets.fromLTRB(20, 24, 0, 0),
              alignment: Alignment.centerLeft,
              color: Colors.black,
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.red,
                unselectedLabelColor: Colors.blueAccent,
                unselectedLabelStyle: TextStyle(fontSize: 20),
                labelColor: Colors.red,
                labelStyle: TextStyle(fontSize: 20),
                tabs: tabBarList,
              ),
            ),
            Expanded(
                child: TabBarView(
              children: tabBarViewList,
            ))
          ],
        ));
  }
}

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  int num = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('第二个页面你初始化');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('页面2当前数字为$num'),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    num++;
                  });
                },
                child: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
