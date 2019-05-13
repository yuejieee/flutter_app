import 'package:flutter/material.dart';
import 'list.dart';

void main() => runApp(MyApp());

// 无状态widget
class MyApp extends StatelessWidget {
  @override
  // 重写默认构造方法
  Widget build(BuildContext context) {
    return new MaterialApp (
      title: 'flutter_app',
      home: HomeStateWidget()
    );
  }
}
