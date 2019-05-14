import 'package:flutter/material.dart';
import 'package:test_flutter/pages/detail_page.dart';

class LoanListItemWidget extends StatefulWidget {
  int index;

  LoanListItemWidget(this.index);

  createState() => LoanListItemWidgetState(index);
}

class LoanListItemWidgetState extends State<LoanListItemWidget> {
  int index;

  LoanListItemWidgetState(this.index);

  final textStyle = TextStyle(
    fontSize: 18,
    color: Colors.grey[500],
  );

  final amountTextStyle = TextStyle(
    fontSize: 20,
    color: Colors.red[400],
    fontWeight: FontWeight.bold,
  );

  final tipTextStyle = TextStyle(
    fontSize: 12,
    color: Colors.blueGrey,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('点击第$index行');
        _pushToDetail();
      },
      child: Card(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 12, left: 10, bottom: 10),
              width: 50,
              height: 50,
              child: Image.network('https://via.placeholder.com/150'),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 10),
              child: _getItemContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getItemContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text('这是一个标题', style: textStyle),
          alignment: Alignment.centerLeft,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text('100～1000', style: amountTextStyle),
          alignment: Alignment.centerLeft,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getTips(Icons.favorite, '标签'),
            _getTips(Icons.account_balance, '标签'),
            _getTips(Icons.wifi_tethering, '标签'),
          ],
        ),
      ],
    );
  }

  Widget _getTips(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, size: 17, color: Colors.grey[400]),
        Padding(
            padding: EdgeInsets.only(left: 5, right: 10),
            child: Text(text, style: tipTextStyle))
      ],
    );
  }

  void _pushToDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) {
            return DetailWidget();
          }
      ),
    );
  }
}
