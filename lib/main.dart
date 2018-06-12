import 'package:flutter/material.dart';

void main() => runApp(new WyobApp());

class WyobApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'WYOB App',
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

class NextDutyWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 3,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new NextDutyTopWidget(),
          new NextDutyBottomWidget(),
        ],
      ),
    );
  }
}

class NextDutyTopWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Container(
          child: new Text("DUTY LOGO\nDUTY LOGO\nDUTY LOGO\nDUTY LOGO"),
          color: Colors.lightBlueAccent,
        ),
        new Expanded(
          child: new Container(
            color: Colors.blue,
            child: new Text("DUTY DESCRIPTION"),
          ),
        ),
      ],
    );
  }
}

class NextDutyBottomWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child:new Center(child: new Text("DATE")),
        ),
        new Expanded(
          child: new Center(child: new Text("START")),
        ),
        new Expanded(
          child: new Center(child: new Text("END")),
        ),
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