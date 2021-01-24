import 'package:connpass_api_app/view/detail.dart';
import 'package:connpass_api_app/view/search.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    title: 'Connpass API App',
    theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    initialRoute: '/',
    routes: {
      '/': (context) => Search(title: 'Connpassイベント検索アプリ'),
      '/detail': (context) => Detail(),
    },

  ));
}

