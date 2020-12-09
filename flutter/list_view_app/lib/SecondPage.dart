import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {

  final String subtitleText;
  final String imageText;

  SecondPage({Key key, @required this.subtitleText, @required this.imageText}) : super(key: key);

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
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  subtitleText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Image.asset(
                imageText,
              ),

            ],
          ),
        ),
      ),
    );
  }
}