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
  final titleList = ['我的漂流瓶', '黑名单', '意见反馈', '设置'];

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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => GestureDetector(
              onTap: () {
                _didSelectedRow(index);
              },
              child: Container(
                height: 75,
                padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                child: Card(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        titleList[index],
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            childCount: titleList.length,
          ),
        ),
      ],
    );
  }

  _didSelectedRow(int index) {
    switch (index) {
      case 0:
        print('111');
        break;
      case 1:
        print('222');
        break;
      case 2:
        print('333');
        break;
      case 3:
        print('444');
        break;
    }
  }
}
