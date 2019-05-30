import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/tab_bar_page.dart';
//import 'package:flutter/rendering.dart';

void main() {
  // UI可视化调试
//  debugPaintSizeEnabled = true;

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
