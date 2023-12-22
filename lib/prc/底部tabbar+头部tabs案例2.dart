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

  final pageController = PageController();

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
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
          onTap: onTap,
        ),
        body: PageView(
          controller: pageController,
          children: bodyList,
        ));
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
        child: Scaffold(
          appBar: AppBar(
            primary: true,
            //为false的时候会影响leading，actions、titile组件，导致向上偏移

            actionsIconTheme: IconThemeData(color: Colors.blue, opacity: 0.6),
            //设置导航右边图标的主题色，此时iconTheme对于右边图标颜色会失效
            iconTheme: IconThemeData(color: Colors.black, opacity: 0.6),
            //设置AppBar上面Icon的主题颜色

            //设置导航条上面的状态栏显示字体颜色
            backgroundColor: Colors.amber,
            //设置背景颜色
            //shape: CircleBorder(side: BorderSide(color: Colors.red, width: 5, style: BorderStyle.solid)),//设置appbar形状
            //automaticallyImplyLeading: true,//在leading为null的时候失效

            // title: TextField(),
            bottom: TabBar(
              unselectedLabelColor: Colors.grey,
              //设置未选中时的字体颜色，tabs里面的字体样式优先级最高
              unselectedLabelStyle: TextStyle(fontSize: 20),
              //设置未选中时的字体样式，tabs里面的字体样式优先级最高
              labelColor: Colors.black,
              //设置选中时的字体颜色，tabs里面的字体样式优先级最高
              labelStyle: TextStyle(fontSize: 20.0),
              //设置选中时的字体样式，tabs里面的字体样式优先级最高
              isScrollable: true,
              //允许左右滚动
              indicatorColor: Colors.red,
              //选中下划线的颜色
              indicatorSize: TabBarIndicatorSize.label,
              //选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
              indicatorWeight: 6.0,
              //选中下划线的高度，值越大高度越高，默认为2。0
              //indicator: BoxDecoration(),//用于设定选中状态下的展示样式

              tabs: tabBarList,
            ),
            centerTitle: true,
            title: Text('AppBar Demo'),
            leading: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  print('add click....');
                }),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print('search....');
                  }),
              IconButton(
                  icon: Icon(Icons.history),
                  onPressed: () {
                    print('history....');
                  }),
            ],
          ),
          body: TabBarView(
            children: tabBarViewList,
          ),
        ));
  }
}

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> with AutomaticKeepAliveClientMixin {
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
