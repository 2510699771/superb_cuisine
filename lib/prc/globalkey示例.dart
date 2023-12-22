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
      home: const HYHomePage(),
    );
  }
}

class HYHomePage extends StatefulWidget {
  const HYHomePage({super.key});

  @override
  State<HYHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  final GlobalKey<_ceshiState> ceshiKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('列表测试'),
      ),
      body: Center(
        child: Column(
          children: [

            Text('${ceshiKey.currentState!.value}'),
            // Text('${ceshiKey.currentContext}'),
            Text('${ceshiKey.currentState!.widget.name}'),
          ],
        ),
      ),
    );
  }
}

class ceshi extends StatefulWidget {
  final String name = '123';

  const ceshi({super.key});

  @override
  State<ceshi> createState() => _ceshiState();
}

class _ceshiState extends State<ceshi> {
  final String value = 'abc';

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
