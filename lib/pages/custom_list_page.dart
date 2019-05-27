import 'package:flutter/material.dart';
import 'package:test_flutter/views/loan_list_item.dart';

class CustomListPageWidget extends StatefulWidget {
  @override
  createState() => CustomListPageWidgetState();
}

class CustomListPageWidgetState extends State<CustomListPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          '布局',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: _getListView(),
    );
  }

  Widget _getListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, i) {
        return LoanListItemWidget(i);
      },
    );
  }
}
