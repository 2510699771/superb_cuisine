import 'package:flutter/material.dart';

class count3 extends StatefulWidget {
  const count3({super.key});

  @override
  State<count3> createState() => _count3State();
}

class _count3State extends State<count3> with AutomaticKeepAliveClientMixin {
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
