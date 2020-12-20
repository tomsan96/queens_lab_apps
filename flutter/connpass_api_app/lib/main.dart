import 'dart:convert';

import 'package:connpass_api_app/Repository/ConnpassRepository.dart';
import 'package:connpass_api_app/Repository/EventsRepository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connpass API App',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Connpassイベント検索アプリ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _controller = TextEditingController();
  var _repository = new ConnpassRepository();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
            children: <Widget>[
              _searchInput(),
              _searchCount(),
              _searchResult(),
            ],
        ),


      ),

    );
  }

  Widget _searchInput() {

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
              ),
              controller: _controller,
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(100.0, 0.0, 100.0, 0.0),
            child:  RaisedButton(
              child: const Text('Search'),
              onPressed: _search,
            ),
          ),
      ],



    );

  }
  void _search() {
    _getRepository(_controller.text).then((repository) {
      setState(() {
        _repository = repository;
      });
    });
  }

  Future<ConnpassRepository> _getRepository(String searchWord) async {
    final response = await http.get('https://connpass.com/api/v1/event/?count=100&order=1&keyword=' + searchWord);
    if(response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<String, dynamic>();
        ConnpassRepository repository = ConnpassRepository.fromJson(parsed);
        return repository;
    } else {
      throw Exception('Fail to search repository');
    }
  }

  Widget _searchCount() {
    if(_repository.resultsReturned == null) {
      return Container();
    } else if(_repository.resultsReturned < 100) {
      return Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
            '検索結果は' + _repository.resultsReturned.toString() + '件です。'
        )
      );
    } else {
      return Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            '件数が多すぎるため全件を表示できません。\n'
            '上限である100件を表示しています。'
          ),
      );
    }
  }

//  Widget _searchResult() {
//    return ListView(
//      shrinkWrap: true,
//      physics: NeverScrollableScrollPhysics(),
//      children:  _repository.events?.map((event) => ListTile(
//        title: Text(event.title),
//      ))?.toList() ?? []
//    );
//  }

  Widget _searchResult() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final EventsRepository event = _repository.events[index];
        return _resultCard(event);
      },
      itemCount: _repository.events.length,
    );
  }

  Widget _resultCard(EventsRepository eventsRepository) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
                eventsRepository.title
            ),
          )
        ],
      ),
    );
  }
}
