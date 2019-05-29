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

  DayInHisotryModel model;
  String date = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(date),
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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, i) {
        return GridTile(
          child: Container(
            color: randomColor(),
            child: Center(),
          ),
        );
      },
    );
  }

  // 接口请求
  _loadData() async {
    String requestUrl = 'http://www.ipip5.com/today/api.php?type=json';
    http.Response response = await http.get(requestUrl);
    setState(() {
      Map modelMap = json.decode(response.body);
      model = DayInHisotryModel.from
      print(model);
    });
  }


}

Color randomColor() {
  return Color.fromARGB(255, Random().nextInt(256) + 0,
      Random().nextInt(256) + 0, Random().nextInt(256) + 0);
}
