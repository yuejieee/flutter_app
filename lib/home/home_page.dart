import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  @override
  createState() => HomePageWidgetState();
}

class HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '首页',
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
      body: _getContentView(),
    );
  }

  _getContentView() {
    return Column(
      children: [
        Container(
          child: Image(
            image: AssetImage('images/main_top.jpg'),
          ),
        ),
        Expanded(
          child: Container(
            color: Color(0xFF46A4DE),
          ),
        ),
        Container(
          child: Stack(
            children: [
              Image(
                image: AssetImage('images/main_bottom.jpg'),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image(
                    image: AssetImage('images/throw_pz.png'),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
