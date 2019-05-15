import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/views/loan_list_item.dart';

class TestLayoutWidget extends StatefulWidget {
  @override
  createState() => ListLayoutState();
}

class ListLayoutState extends State<TestLayoutWidget> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey[200],
      navigationBar: CupertinoNavigationBar(
        middle: Text('布局', style: TextStyle(fontSize: 19)),
        backgroundColor: Colors.white,
      ),
      child: _getListView(),
    );
  }

  Widget _getListView() {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, i) {
        return LoanListItemWidget(i);
      },
    );
  }
}
