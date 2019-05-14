import 'package:flutter/material.dart';

class DetailWidget extends StatefulWidget {

  @override
  createState() => DetailWidgetState();

}

class DetailWidgetState extends State<DetailWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
      ),
      body: _getMainView(),
    );
  }

  Widget _getMainView() {
    return Column(

    );
  }

}