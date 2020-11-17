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

              } else if (i == 1) {

              } else if (i == 2) {

              }
            },
          ),
        );
      },
      itemCount: titleList.length,
    );
  }
}