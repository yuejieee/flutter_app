import 'package:flutter/material.dart';
import 'package:flutter_app/base/tab_bar_page.dart';

import '../base/tab_bar_page.dart';
import '../main.dart';

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
    return FlatButton(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 15, bottom: 10),
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [BoxShadow(color: Color(0x33999999), blurRadius: 3, spreadRadius: 2)],
        ),
        child: Text(
          '在这里，开始你的第一次美丽邂逅吧💗',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 16,
          ),
        ),
      ),
      onPressed: () {
        _pressEvent();
      },
    );
  }

  _pressEvent() {
    print('123123');
  }
}