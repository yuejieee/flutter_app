import 'package:flutter/material.dart';

class MinePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MinePageState();
    throw UnimplementedError();
  }
}

class MinePageState extends State<MinePageWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我的',
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
      body: _setupContentViews(),
    );
    throw UnimplementedError();
  }

  _setupContentViews() {
    return Center(
      child: Text(
        '我的',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 18,
        ),
      ),
    );
  }
}