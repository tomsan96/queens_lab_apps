import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {

  final String paramText;

  SecondPage({Key key, @required this.paramText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(paramText),
            ],
          ),
        ),
      ),
    );
  }
}