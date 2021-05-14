import 'package:flutter/material.dart';

Widget appBar({@required BuildContext context}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(40),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
                margin: EdgeInsets.only(top: 40, left: 10),
                width: 20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/guanbi.png')))),
          ),
        ],
      ));
}
