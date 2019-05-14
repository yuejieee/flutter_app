import 'package:flutter/material.dart';
import 'package:test_flutter/views/loan_list_item.dart';

class TestLayoutWidget extends StatefulWidget {
  @override
  createState() => ListLayoutState();
}

class ListLayoutState extends State<TestLayoutWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          '布局',
          textAlign: TextAlign.left,
        ),
      ),
      body: _getListView(),
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
