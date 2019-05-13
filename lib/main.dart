import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp (
      title: '首页',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new HomeStateWidget('Hello World'),
        ),
      ),
    );
  }
}

class HomeStateWidget extends StatefulWidget {
  final String text;

  // 构造方法传值
  HomeStateWidget(this.text);

  @override
  // 创建state
  _HomeStateWidgetState createState() => _HomeStateWidgetState(text);
}

class _HomeStateWidgetState extends State<HomeStateWidget> {
  String text;

  _HomeStateWidgetState(this.text);

  @override
  void initState() {
    super.initState();
    // 定时两秒变值
    new Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          text = '这就变了';
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text ?? "这就是有状态DMEO"),
    );
  }
}
