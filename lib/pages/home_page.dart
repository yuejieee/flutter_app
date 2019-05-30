import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_page.dart';
import 'custom_list_page.dart';
import 'day_in_history_page.dart';

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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, i) {
        return GridTile(
          child: GestureDetector(
            child: Container(
              color: Colors.blue[100],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/ic_place.png'),
                    Text(
                      '${titleList[i]}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              if (i == 0) {
                _pushToListPage();
              } else if (i == 1) {
                _pushToLayoutTestPage();
              } else if (i == 2) {
                _pushToDayInHistoryPage();
              }
            },
          ),
        );
      },
      itemCount: titleList.length,
    );
  }

  // 列表页
  _pushToListPage() {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) {
        return ListPageWidget();
      }),
    );
  }

  _pushToLayoutTestPage() {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) {
        return CustomListPageWidget();
      }),
    );
  }

  _pushToDayInHistoryPage() {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) {
        return DayInHistoryWidget();
      }),
    );
  }
}
