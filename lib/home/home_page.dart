import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  @override
  createState() => HomePageWidgetState();
}

class HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '首页',
          style: TextStyle(color: Colors.black),
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: _getContentView(),
    );
  }

  final titleList = ['列表', '自定义列表', '历史上的今天', '3'];

  _getContentView() {

  }
}