import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'my_bottle_page.dart';

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
  final nickName = '用户名';
  final avatarUrl = 'http://fpoimg.com/210x210';
  final memberID = '683471';

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
          flexibleSpace: _getAppBar(),
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

  _getAppBar() {
    return Column(
      children: [
        // 头像
        Container(
          margin: EdgeInsets.only(top: 35),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.all(Radius.circular(35)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Image.network(avatarUrl),
          ),
        ),
        // 用户名
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            nickName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // memberID
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            '用户ID: $memberID',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFEFEFEF),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // 跳转我的漂流瓶
  _goToMyBottlePage() {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) {
          return MyBottleWidget();
        },
      ),
    );
  }

  _didSelectedRow(int index) {
    switch (index) {
      case 0:
        _goToMyBottlePage();
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
