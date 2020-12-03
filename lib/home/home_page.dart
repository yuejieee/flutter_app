import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  @override
  createState() => HomePageWidgetState();
}

class HomePageWidgetState extends State<HomePageWidget>
    with SingleTickerProviderStateMixin {
  Animation movement;
  AnimationController controller;

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 30), vsync: this);
    //图片宽高从0变到300
    movement =
        new Tween(begin: Alignment(-1.1, -0.85), end: Alignment(1.5, -0.85))
            .animate(controller)
              ..addListener(() {
                setState(() => {});
              });
    //启动动画(正向执行)
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
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
    return Stack(
      children: [
        Container(
          color: Color(0xFF46A4DE),
        ),
        Image(
          image: AssetImage('images/main_top.jpg'),
        ),
        Align(
          alignment: Alignment(0, 1.0),
          child: Image(
            image: AssetImage('images/main_bottom.jpg'),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.7),
          child: Image(
            image: AssetImage('images/beach_lang.png'),
          ),
        ),
        Align(
          alignment: Alignment(-1, 0.9),
          child: GestureDetector(
            onTap: () {
              _sendBottleEvent();
            },
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image(
                image: AssetImage('images/throw_pz.png'),
              ),
            ),
          ),
        ),
        Align(
          alignment: movement.value,
          child: Image(
            image: AssetImage('images/balloon (1).png'),
            width: 60,
            height: 60,
          ),
        ),
      ],
    );
  }

  _sendBottleEvent() {
    print('扔瓶子');
  }
}
