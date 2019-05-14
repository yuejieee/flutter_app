import 'package:flutter/material.dart';
import 'package:test_flutter/pages/list_page.dart';
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
    return new MaterialApp (
      title: 'flutter_app',
      home: HomeStateWidget()
    );
  }
}
