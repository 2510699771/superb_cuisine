import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // 再pushName时候，当没找到routers中映射关系时候会进入钩子内
      onGenerateRoute: (settings) {
        print(settings.name);
        return null;
      },
      theme: ThemeData(
        // 亮度   dark or light
          brightness: Brightness.light,
          // 2.primarySwatch: primaryColor/accentColor的结合体
          primarySwatch: Colors.blue,
          // 3.主要颜色: 导航/底部TabBar
          primaryColor: Colors.pink,
          // 4.卡片主题
          cardTheme: CardTheme(
              color: Colors.greenAccent,
              elevation: 10,
              shape: Border.all(width: 3, color: Colors.red),
              margin: EdgeInsets.all(10)),
          // 5.按钮主题
          buttonTheme: ButtonThemeData(
            minWidth: 90,
            height: 50,
          ),
          textTheme: TextTheme(),
          splashColor: Colors.green),
      home: HYHomePage(),
      routes: {
        '/home': (ctx) => HYHomePage(),
        '/details': (ctx) => HYdetails('77'),
        '/details1': (ctx) => HYdetails1(),
      },
    );
  }
}

class HYHomePage extends StatefulWidget {
  const HYHomePage({super.key});

  @override
  State<HYHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('首页初始化');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('主页路卸载');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('列表测试'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('999'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/details', arguments: '5233')
                      .then((value) => {});
                  // Navigator.of(context)
                  //     .pushReplacement(MaterialPageRoute(builder: (context) {
                  //   return HYdetails1();
                  // }));
                },
                child: Text('b')),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              child: Text('c'),
            ),
            Container(
              width: 80,
              child: SubmenuButton(
                menuChildren: [Text('11111'), Text('wwwwwwwwwwwwwww')],
                child: Text('66'),
              ),
            ),
            Card(
              child: Text('内容'),
            )
          ],
        ),
      ),
    );
  }
}

class HYdetails extends StatefulWidget {
  final message;

  HYdetails(
      this.message, {
        super.key,
      });

  @override
  State<HYdetails> createState() => _HYdetailsState();
}

class _HYdetailsState extends State<HYdetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('详情初始化');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('详情页路由卸载');
  }

  @override
  Widget build(BuildContext context) {
    final String message1 =
    ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
                child: Text('返回主页')),
            Padding(padding: EdgeInsets.all(16)),
            Text(message1),
            Padding(padding: EdgeInsets.all(16)),
            ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(builder: (BuildContext context) {
                  //   return HYdetails1();
                  // }), (route) => route == null);
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return HYdetails1();
                  }));
                },
                child: Text('进入下一个页面'))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('详情页面1'),
        leading: IconButton(
          onPressed: () {
            print('点击了返回');
          },
          icon: Icon(Icons.saved_search_rounded),
        ),
      ),
    );
  }
}

class HYdetails1 extends StatefulWidget {
  const HYdetails1({super.key});

  @override
  State<HYdetails1> createState() => _HYdetailsState1();
}

class _HYdetailsState1 extends State<HYdetails1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('详情页2初始化');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('详情页2路由卸载');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
                child: Text('返回上一个页面')),
            // Padding(padding: EdgeInsets.all(16)),
            // ElevatedButton(onPressed: () {}, child: Text('直接返回到首页'))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('详情页面2'),
      ),
    );
  }
}
