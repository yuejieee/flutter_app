import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingPageState();
    throw UnimplementedError();
  }
}

class SettingPageState extends State<SettingPage> {
  var dataList = ['清除缓存', '关于我们', '版本号'];

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
          '设置',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _getContentView(),
    );
    throw UnimplementedError();
  }

  _getContentView() {
    return ListView.separated(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print(dataList[index]);
            },
            child: Container(
              height: 70,
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 10, left: 15, bottom: 10, right: 15),
                    child: Text(
                      dataList[index],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 1);
        });
  }
}
