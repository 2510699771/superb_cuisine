import 'package:flutter/material.dart';

class count2 extends StatefulWidget {
  const count2({super.key});

  @override
  State<count2> createState() => _count2State();
}

class _count2State extends State<count2> with AutomaticKeepAliveClientMixin {
  int num = 0;

  @override
  void initState() {
    print('第二个子页面初始化');
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
            Text('页面二当前数字为$num'),
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
