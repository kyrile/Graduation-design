import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cxz/pages/grow/topic.dart';

class GraduateModel extends Model {
  int _selectedIndex = 0;
  int get selectedIndex => this._selectedIndex; //向外部提供一个读取内部属性的方法
  void onItemTapped(int index) {
    logger.i('onItemTapped进来了');
    changeUrl(
        newUrl:
            "http://wyx2d8.natappfree.cc/${index == 0 ? 'topic' : 'github'}",
        url: "${index == 0 ? 'topic' : 'github'}");
    _selectedIndex = index;
    notifyListeners();
  }

  List<dynamic> _topicTitle = [];
  List<dynamic> get topicTitle => this._topicTitle;
  List<dynamic> _topicSubTitle = [];
  List<dynamic> get topicSubTitle => this._topicSubTitle;
  void changeData({List<dynamic> topicTitle, List<dynamic> topicSubTitle}) {
    this._topicTitle = topicTitle;
    this._topicSubTitle = topicSubTitle;
    notifyListeners();
  }

  String _requestUrl = 'http://wyx2d8.natappfree.cc/topic';
  String get requestUrl => this._requestUrl;

  String _url1 = "topic";
  String get url1 => this._url1;

  void changeUrl({@required String newUrl, @required String url}) {
    logger.i('changeUrl进来了');
    _requestUrl = newUrl;
    _url1 = url;
    notifyListeners();
  }
}
