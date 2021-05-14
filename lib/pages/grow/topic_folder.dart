import 'package:flutter/material.dart';
import 'package:cxz/bean/topic_folder.dart';
import 'package:cxz/pages/grow/article_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';

class TopciFloder extends StatefulWidget {
  final int arrIndex;
  TopciFloder({@required this.arrIndex});
  @override
  State<StatefulWidget> createState() {
    return _StudyPageState(arrIndex: arrIndex);
  }
}

class _StudyPageState extends State<TopciFloder> {
  final int arrIndex;
  _StudyPageState({@required this.arrIndex});

  var logger;
  List<dynamic> subTitle = <dynamic>[];
  List<dynamic> title = <dynamic>[];
  List<dynamic> description = <dynamic>[];
  List<dynamic> imgUrl = <dynamic>[];
  List<dynamic> text = <dynamic>[];
  int length = 0;
  @override
  void initState() {
    logger = Logger();
    super.initState();
    _getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('主题列表')),
      body: DetailList(
          details: List.generate(
              length,
              (index) => TopicFolder(
                  '${title[index]}',
                  '${subTitle[index]}',
                  '${description[index]}',
                  '${imgUrl[index]}',
                  '${text[index]}'))),
    );
  }

  void _getHttp() async {
    EasyLoading.show(status: '亲！正在疯狂的请求后台服务器,不要着急');
    try {
      var response = await Dio().get('http://9hcqy7.natappfree.cc/topic_array');
      List<dynamic> array = response.data;

      dynamic obj = array[arrIndex];
      logger.i(obj);

      setState(() {
        title = obj['title'];
        subTitle = obj['subTitle'];
        imgUrl = obj['imgUrl'];
        description = obj['description'];
        text = obj['text'];
        length = title.length;
        EasyLoading.dismiss();
      });
      logger.i(title);
    } catch (e) {
      logger.e('请求过程中出错了:${e}');
      EasyLoading.showError('客官！请求过程中出现了神秘的错误');
      EasyLoading.dismiss();
    }
  }
}

class DetailList extends StatelessWidget {
  final List<TopicFolder> details; //<Study>[]
  DetailList({Key key, @required this.details}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: details.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(details[index].imgUrl), fit: BoxFit.fill),
            ),
          ),
          subtitle: Text(details[index].subTitle,
              maxLines: 3, overflow: TextOverflow.ellipsis),
          isThreeLine: true,
          trailing: Icon(Icons.sort),
          title: new Text(
            details[index].title,
            style: TextStyle(fontFamily: 'SansSerif'),
          ),
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) =>
                        new StudyDetail(detail: details[index])));
          },
        );
      },
    );
  }
}
