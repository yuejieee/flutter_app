import 'package:flutter/material.dart';
import 'package:flutter_app/home/TestModel.dart';

class HomePageWidget extends StatefulWidget {
  @override
  createState() => HomePageWidgetState();
}

class HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  Animation ballonMovement;
  AnimationController ballonController;

  Animation boatMovement;
  AnimationController boatController;

  dispose() {
    //路由销毁时需要释放动画资源
    ballonController.dispose();
    boatController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getBallonAnimation();
    _getBoatAnimation();
  }

  // 热气球动画
  _getBallonAnimation() {
    ballonController = new AnimationController(
        duration: const Duration(seconds: 60), vsync: this);
    ballonMovement =
        new Tween(begin: Alignment(-1.3, -0.85), end: Alignment(1.3, -0.85))
            .animate(ballonController)
              ..addListener(() {
                setState(() => {});
              });
    //启动动画(正向执行)
    ballonController.repeat();
  }

  _getBoatAnimation() {
    boatController = new AnimationController(
        duration: const Duration(seconds: 30), vsync: this);
    boatMovement =
        new Tween(begin: Alignment(-1.3, -0.2), end: Alignment(1.3, -0.2))
            .animate(boatController)
              ..addListener(() {
                setState(() => {});
              });
    //启动动画(正向执行)
    boatController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '首页',
          style: TextStyle(color: Colors.black),
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
          alignment: ballonMovement.value,
          child: Image(
            image: AssetImage('images/balloon (1).png'),
            width: 60,
            height: 60,
          ),
        ),
        Align(
          alignment: boatMovement.value,
          child: Image(
            image: AssetImage('images/boat.png'),
            width: 70,
            height: 70,
          ),
        )
      ],
    );
  }

  _sendBottleEvent() {
    print('扔瓶子');
    TestModel model = TestModel();
    model.requestData(() {}, () {});
  }
}
