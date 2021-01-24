import 'dart:convert';

import 'package:connpass_api_app/view/detail.dart';
import 'package:connpass_api_app/repository/connpass_repository.dart';
import 'package:connpass_api_app/repository/event_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  Search({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _controller = TextEditingController();
  var _repository = ConnpassRepository();

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
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
              ),
              controller: _controller,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
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
    final response = await http.get('https://connpass.com/api/v1/event/?count=100&order=1&keyword=$searchWord');
    if(response.statusCode == 200) {
      final parsed =
      json.decode(response.body).cast<String, dynamic>()
      as Map<String, dynamic>;
      final repository = ConnpassRepository.fromJson(parsed);
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
          padding: const EdgeInsets.all(12),
          child: Text(
              '検索結果は${_repository.resultsReturned.toString()}件です。'
          )
      );
    } else {
      return const Padding(
        padding: EdgeInsets.all(12),
        child: Text(
            '件数が多すぎるため全件を表示できません。\n'
                '上限である100件を表示しています。'
        ),
      );
    }
  }

  Widget _searchResult() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        if(_repository.events != null) {
          final event = _repository.events[index];
          return _resultCard(event);
        } else {
          return null;
        }
      },
      itemCount: _repository.resultsReturned,
    );
  }

  Widget _resultCard(EventRepository eventRepository) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
              context,
              '/detail',
              arguments: eventRepository,

          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                  eventRepository.title
              ),
            )
          ],
        ),
      ),
    );
  }
}
