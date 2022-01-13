import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.circle, color: Colors.green, size: 30,),
            Icon(Icons.clear, color: Colors.red,size: 30),
            Text('ゲーム')
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(FontAwesomeIcons.circle,),
                  Text('のターンです'),
                ],
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide()
                ),
                onPressed: () {

                },
                child: Text('クリア')
              )
            ],
          ),
          buildField(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Column buildField() {
    // 縦の3列を作成するためのリスト
    List<Widget> _columnChildren = [Divider(height: 0.0, color: Colors.black,)];
    // 横の3行を作成するためのリスト
    List<Widget> _rowChildren = [];

    for(int h = 0; h < 3; h++) {
      // 横の3行を生成
      for (int i = 0; i < 3; i++) {
        _rowChildren.add(
            Expanded(
                child: InkWell(
                  child: AspectRatio(
                      aspectRatio: 1.0,
                      child: i == 2
                          ? Container()
                          : Row(
                        children: [
                          Expanded(child: Container()),
                          VerticalDivider(width: 0.0, color: Colors.black,),
                        ],
                      )
                  ),
                )
            )
        );
      }
      _columnChildren.add(Row(children: _rowChildren,));
      _columnChildren.add(Divider(height: 0.0, color: Colors.black,));
      _rowChildren = [];
    }
    return Column(children: _columnChildren,);
  }
}

//todo マス目をタップ可能にして、タップ時にターン切り替え
//todo マス目をタップで〇✕を表示
//todo ゲームの勝敗のパターンを書き出す
//todo ゲームの勝敗を判定可能に
//todo リセットボタンタップでリスタート可能に
