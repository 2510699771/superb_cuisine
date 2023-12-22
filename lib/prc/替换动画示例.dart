import 'dart:ffi';

import 'package:flutter/material.dart';

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
  IconData _actionIcon = Icons.delete;
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('列表测试'),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedSwitcher(

                ///动画执行切换时间
                duration: const Duration(milliseconds: 600),

                ///动画构建器 构建指定动画类型
                transitionBuilder: (Widget child, Animation<double> animation) {
                  //执行缩放动画
                  return ScaleTransition(child: child, scale: animation);
                },

                ///执行动画的子 Widget
                ///只有子 Widget 被切换时才会触发动画
                child: IconButton(
                  //显示指定key，不同的key会被认为是不同的Text
                  key: ValueKey(_actionIcon),
                  onPressed: () {
                    setState(() {
                      if (_actionIcon == Icons.delete) {
                        _actionIcon = Icons.done;
                      } else {
                        _actionIcon = Icons.delete;
                      }
                    });
                  },
                  icon: Icon(
                    _actionIcon,
                    size: 60,
                  ),
                )),
            Container(
              height: 60,
            ),
            ElevatedButton(
                child: const Text(
                  '+1',
                ),
                onPressed: () {
                  setState(() {
                    _count += 1;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
