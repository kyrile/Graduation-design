import 'dart:convert';
import 'package:cxz/model/graduate.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cxz/pages/grow/topic_folder.dart';
import 'package:logger/logger.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Logger logger = Logger();

class GrowModule extends StatefulWidget {
  final GraduateModel model;

  GrowModule({@required this.model});
  @override
  State<StatefulWidget> createState() {
    return _GrowMoudleState(model: model);
  }
}

class _GrowMoudleState extends State<GrowModule> {
  final GraduateModel model;
  _GrowMoudleState({@required this.model});
  int length;
  @override
  void initState() {
    logger.i("topic:initState");
    super.initState();
    length = 0;
    _getHttp1();
  }

  @override
  void didUpdateWidget(covariant GrowModule oldWidget) {
    logger.i("topic:didUpdateWidget");
    super.didUpdateWidget(oldWidget);
    _getHttp1();
  }

  @override
  Widget build(BuildContext context) {
    logger.i("topic:build");
    return ListView.builder(
        itemCount: model.topicTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              model.topicTitle[index],
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  fontFamily: 'SansSerif'),
            ),
            subtitle: Text(
              model.topicSubTitle[index],
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(fontFamily: "SansSerif"),
            ),
            leading: Icon(Icons.fastfood, color: Colors.orange),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TopciFloder(
                            arrIndex: index,
                          )));
            },
          );
        });
  }

  _getHttp1() async {
    try {
      EasyLoading.show(status: '正在玩命的请求后台服务器😊');
      Response response;
      response = await Dio().get(model.requestUrl);
      Map<dynamic, dynamic> map = json.decode(response.toString());
      logger.i(map['topicTitle']);
      logger.i(map['topicSubTitle']);
      setState(() {
        model.changeData(
            topicTitle: map['${model.url1}Title'],
            topicSubTitle: map['${model.url1}SubTitle']);
      });

      logger.i(model.topicTitle);
      logger.i(model.topicSubTitle);
      EasyLoading.dismiss();
    } catch (e) {
      logger.e('请求过程中出错了:${e}');
    }
  }
}
