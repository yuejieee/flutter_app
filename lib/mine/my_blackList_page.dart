import 'package:flutter/material.dart';

class MyBlackListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyBlackListPageState();
    throw UnimplementedError();
  }
}

class MyBlackListPageState extends State<MyBlackListPage> {
  var dataList = ['', '', ''];

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
          '黑名单',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _getContentView(),
    );
  }

  _getContentView() {
    return ListView.separated(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 70,
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 15, bottom: 10, right: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network('https://fpoimg.com/210x210'),
                  ),
                ),
                Text('用户名'),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 1);
        });
  }
}
