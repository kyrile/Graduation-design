import 'package:cxz/loading.dart';
import 'package:flutter/material.dart';
import 'package:cxz/pages/grow/topic.dart';
import 'package:cxz/model/graduate.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingPage(),
      theme: ThemeData.dark(),
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => new MyHomePage()
      },
      title: "陈晓忠",
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  GraduateModel model = new GraduateModel();
  List<Widget> _widgetOptions;
  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      GrowModule(model: model),
      GrowModule(model: model),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<GraduateModel>(
      model: model,
      child: ScopedModelDescendant<GraduateModel>(
        builder: (context, child, model) {
          return Scaffold(
            appBar: AppBar(title: Text('毕业设计')),
            body: _widgetOptions.elementAt(model.selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.group_add), label: '成长'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.folder_special), label: 'GitHub'),
              ],
              currentIndex: model.selectedIndex,
              fixedColor: Colors.pink,
              onTap: model.onItemTapped,
            ),
          );
        },
      ),
    );
  }
}

final ThemeData defaultTheme = ThemeData(
 
  primaryColor: Color(0xFF010101),
  
);
