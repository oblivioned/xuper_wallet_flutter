import 'package:flutter/material.dart';

export 'package:flutter/material.dart';

abstract class StardardScene extends StatelessWidget {
  Widget get body;
  String get title;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
        child: body
      ),
      backgroundColor: Color.fromARGB(0xf8, 0xf8, 0xf8, 0xff));
}
