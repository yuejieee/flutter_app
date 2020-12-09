import 'package:flutter/material.dart';
import 'package:flutter_app/base/network/network.dart';

class LoginPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageWidgetState();
    throw UnimplementedError();
  }
}

class LoginPageWidgetState extends State<LoginPageWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getContentView(),
    );
    throw UnimplementedError();
  }

  _getContentView() {
    Network.instance.post('', {'':''}, success: () {

    }, failure: () {

    });
  }

}