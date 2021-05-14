import 'package:flutter/material.dart';

Widget buildCenter() {
  return Container(
    constraints: BoxConstraints.tightForFinite(width: 200),
    width: 300,
    height: 200,
    margin: EdgeInsets.only(
      top: 20,
      bottom: 25,
    ),
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                // "https://tse2-mm.cn.bing.net/th/id/OIP.5zCTU9NQ-odwHpkwWUXcYwHaHa?w=193&h=193&c=7&o=5&dpr=1.55&pid=1.7"
                "https://th.bing.com/th/id/R1d09771f98f4a2f3509f75c31d0ba2a3?rik=eO0RkvjPHoMjFA&riu=http%3a%2f%2fi0.hdslb.com%2fbfs%2farchive%2fdd9a837287bfd0745bb1ac3dc333a33b200ad0de.png&ehk=fk7VMXJmlgeFJ4t7w%2flH737XNeqUZfeITI8Q2nxRUXA%3d&risl=&pid=ImgRaw"),
            fit: BoxFit.cover),
        color: Colors.blue,
        shape: BoxShape.rectangle),
  );
}
