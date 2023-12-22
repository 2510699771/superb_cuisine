import 'package:flutter/material.dart';

class count4 extends StatefulWidget {
  const count4({super.key});

  @override
  State<count4> createState() => _count4State();
}

class _count4State extends State<count4> with AutomaticKeepAliveClientMixin {
  int num = 0;

  @override
  void initState() {
    print('第三个子页面初始化');
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
            Text('页面三当前数字为$num'),
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
