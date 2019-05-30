import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_flutter/models/day_in_history_model.dart';

class DayInHistoryWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DayInHistoryWidgetState();
  }
}

class DayInHistoryWidgetState extends State<DayInHistoryWidget> {
  DayInHistoryModel model;
  String date = '';
  List<DayInHistoryItem> dataList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          date,
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
      body: _getContentWidget(),
    );
  }

  _getContentWidget() {
    return RefreshIndicator(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, i) {
          return GridTile(
            child: _getGridItem(i),
          );
        },
        itemCount: dataList.length,
      ),
      onRefresh: () => _loadData(),
    );
  }

  _getGridItem(index) {
    return Container(
      color: randomColor(),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                dataList[index].year + '年',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Expanded(
              child: Text(
                dataList[index].title,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  // 接口请求
  _loadData() async {
    String requestUrl = 'http://www.ipip5.com/today/api.php?type=json';
    http.Response response = await http.get(requestUrl);
    setState(() {
      Map modelMap = json.decode(response.body);
      model = DayInHistoryModel.fromJson(modelMap);
      date = model.today;
      dataList = model.result;
    });
  }
}

Color randomColor() {
  return Color.fromARGB(255, Random().nextInt(256) + 0,
      Random().nextInt(256) + 0, Random().nextInt(256) + 0);
}
