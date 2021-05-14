import 'package:cxz/pages/grow/article_content/appbar.dart';
import 'package:cxz/pages/grow/article_content/bottom.dart';
import 'package:cxz/pages/grow/article_content/center.dart';
import 'package:cxz/pages/grow/article_content/top.dart';
import 'package:flutter/material.dart';
import 'package:cxz/bean/topic_folder.dart';

class StudyDetail extends StatelessWidget {
  final TopicFolder detail;
  StudyDetail({Key key, @required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBar(context: context),
      body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              buildTop(detail: detail),
              buildCenter(),
              buildBottom(text: detail.text)],
          )),
    );
  }
}
