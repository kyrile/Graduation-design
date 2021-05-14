import 'package:cxz/pages/grow/topic.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(LoadingPage());

class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() => new _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration(seconds: 3), () {
      logger.i("三秒后进入主页面");
        Navigator.of(context).pushReplacementNamed("app");
      logger.i("????????????");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset(
      "images/loading.jpeg",
      fit: BoxFit.cover,
    ));
  }
}
