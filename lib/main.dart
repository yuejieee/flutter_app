import 'package:flutter/material.dart';
import 'package:flutter_app/base/tab_bar_page.dart';

void main() {
  runApp(MyApp());
}

// 无状态widget
class MyApp extends StatelessWidget {
  @override
  // 重写默认构造方法
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      title: 'flutter_app',
      home: TabBarWidget(),
    );
  }
}
