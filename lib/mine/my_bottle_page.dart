import 'package:flutter/material.dart';

class MyBottleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyBottleWidgetState();
    throw UnimplementedError();
  }
}

class MyBottleWidgetState extends State<MyBottleWidget> {
  final dataList = ['', '', ''];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我的漂流瓶',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _setupContentViews(),
    );
    throw UnimplementedError();
  }

  _setupContentViews() {
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
                Text('漂流瓶内容'),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 1);
        });
  }
}
