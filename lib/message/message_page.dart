import 'package:flutter/material.dart';

class MessagePageWidget extends StatefulWidget {
  @override
  createState() => MessagePageState();
}

class MessagePageState extends State<MessagePageWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '消息',
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
    return Text(
      '消息',
      textAlign: TextAlign.center,
    );
  }
}