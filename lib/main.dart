import 'dart:async' show Future;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'NextDutyWidget.dart';

void main() => runApp(new WyobApp());

class WyobApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'WYOB',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("WYOB App v0.2"),
        ),
        body: new HomeWidget(),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new NextDutyWidget(),
        new DutiesWidget(),
      ],
    );
  }
}

class DutiesWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 7,
      child: new Container(
        child: new Text("DutiesWidget"),
        decoration: new BoxDecoration(
          color: Colors.redAccent,
        ),
      ),
    );
  }
}