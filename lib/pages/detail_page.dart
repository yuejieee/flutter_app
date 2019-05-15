import 'package:flutter/material.dart';

class DetailWidget extends StatefulWidget {
  @override
  createState() => DetailWidgetState();
}

class DetailWidgetState extends State<DetailWidget> {
  final String content =
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
      ),
      body: ListView(
        children: <Widget>[
          _getMainView(),
        ],
      ),
    );
  }

  Widget _getMainView() {
    return Column(
      children: <Widget>[
        Container(
          child: Image.network(
            'https://via.placeholder.com/414x200',
            fit: BoxFit.fill,
          ),
        ),
        _getOutlineSection(),
        _getActionSection(),
        _getContentSection(content),
      ],
    );
  }

  Widget _getOutlineSection() {
    return Padding(
      padding: EdgeInsets.only(top: 30.0, left: 30, right: 30),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '这是一个标题',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  '这是一个副标题',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text('42', style: TextStyle(fontSize: 17)),
        ],
      ),
    );
  }

  Widget _getActionSection() {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Row(
        children: <Widget>[
          _getActionItem(Icons.phone, 'CALL'),
          _getActionItem(Icons.place, 'ROUTE'),
          _getActionItem(Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  Widget _getActionItem(IconData icon, String text) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Icon(icon, color: Colors.blue[300]),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue[300],
            ),
          )
        ],
      ),
    );
  }

  Widget _getContentSection(String content) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
