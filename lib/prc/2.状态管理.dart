import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) {
        return CountProvider();
      })
    ],
    child: MyApp(),
  ));
}

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
  int data = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('列表测试'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CountProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  '当前计数为${value.counter}',
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (contest) {
                    return SecondPage();
                  }));
                },
                child: Text(
                  '跳转',
                  style: TextStyle(fontSize: 23),
                ))
          ],
        ),
      ),
      floatingActionButton: Consumer<CountProvider>(
          builder: (BuildContext context, CountProvider value, Widget? child) {
            return FloatingActionButton(
              onPressed: () {
                setState(() {
                  value.counter += 1;
                });
              },
              child: child,
            );
          },
          child: Icon(Icons.fourteen_mp)),
    );
  }
}

// 第二个页面
class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第二个页面'),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<CountProvider>(
              builder: (BuildContext context, value, Widget? child) {
                print('第二个页面builder调用');
                return Text(
                  '第二个页面的数据 ${value.counter}',
                  style: TextStyle(color: Colors.red, fontSize: 23),
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
                child: Text(
                  '返回',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
      floatingActionButton: Selector<CountProvider, CountProvider>(
        builder: (BuildContext context, CountProvider value, Widget? child) {
          print('静态按钮builder调用');
          return FloatingActionButton(
              onPressed: () {
                value.counter += 1;
              },
              child: Icon(Icons.add));
        },
        selector: (BuildContext, CountProvider) {
          return CountProvider;
        },
        shouldRebuild: (previous, next) {
          return false;
        },
      ),
    );
  }
}

// InheritedWidget 实现共享状态
class HYDataWidget extends InheritedWidget {
  late final int count;

  HYDataWidget({required this.count, required super.child});

  static HYDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return oldWidget != this.count;
  }
}

// provide 实现共享状态
class CountProvider extends ChangeNotifier {
  int _count = 100;

  int get counter {
    return _count;
  }

  set counter(int value) {
    print(value);
    _count = value;
    // 通知所有的Consumer进行更新
    notifyListeners();
  }
}
