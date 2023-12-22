import 'package:flutter/material.dart';

class count1 extends StatefulWidget {
  const count1({super.key});

  @override
  State<count1> createState() => _count1State();
}

class _count1State extends State<count1> with AutomaticKeepAliveClientMixin {
  int num = 0;

  @override
  void initState() {
    print('第一个子页面初始化');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('首页build');
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('页面一当前数字为$num'),
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
