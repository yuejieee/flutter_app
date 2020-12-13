import 'package:flutter/material.dart';
import 'package:flutter_app/base/tab_bar_page.dart';
import 'package:flutter_app/base/network/network.dart';
import 'package:flutter_app/base/network/network_config.dart';

void main() {
  runApp(MyApp());
}

// 无状态widget
class MyApp extends StatelessWidget {
  @override
  StatelessElement createElement() {
    _setupNetwork();
    return super.createElement();
  }

  @override
  // 重写默认构造方法
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: Colors.white,
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      title: 'flutter_app',
      home: TabBarWidget(),
    );
  }

  _setupNetwork() {
    NetworkConfig config = NetworkConfig(
        domain: "https://web81.kaboy.net",
        staticKey: "ABCDEFGHIJK12345",
        appVersion: "5.22.0",
        appType: "3");
    Network.instance.config = config;
  }
}
