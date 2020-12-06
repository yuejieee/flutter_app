import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FeedbackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FeedbackPageState();
    throw UnimplementedError();
  }
}

class FeedbackPageState extends State<FeedbackPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '意见反馈',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          //导航栏右侧菜单
          FlatButton(
            child: Text(
              '发送',
              style: TextStyle(
                fontSize: 18,
                color: Colors.lightBlue,
              ),
            ),
            onPressed: () {
              _sendEvent();
            },
          )
        ],
      ),
      body: _getContentView(),
    );
    throw UnimplementedError();
  }

  _getContentView() {
    return  Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 200,
      color: Color(0xFFEFEFEF),
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
          hintText: '请输入您的反馈意见',
          border: InputBorder.none,
        ),
      ),
    );
  }

  _sendEvent() {
    print('发送成功');
    Navigator.pop(context);
  }
}
