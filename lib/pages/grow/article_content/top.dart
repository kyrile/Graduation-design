import 'package:cxz/bean/topic_folder.dart';
import 'package:flutter/material.dart';

Widget buildTop({@required TopicFolder detail}) {
  return Container(
      padding: EdgeInsets.only(top: 15),
      child: Text('${detail.title}',
          style:
              new TextStyle(fontFamily: 'ShangShouYuSongTi-2', fontSize: 23)));
}
