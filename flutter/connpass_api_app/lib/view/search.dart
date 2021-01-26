import 'package:connpass_api_app/repository/connpass_repository.dart';
import 'package:connpass_api_app/model/connpass_model.dart';
import 'package:connpass_api_app/model/event_model.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _controller = TextEditingController();
  var _connpassModel = ConnpassModel();


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
    ConnpassRepository().getSearchModel(_controller.text).then((model) {
      setState(() {
        _connpassModel = model;
      });
    });
  }

  Widget _searchCount() {
    if(_connpassModel.resultsReturned == null) {
      return Container();
    } else if(_connpassModel.resultsReturned < 100) {
      return Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
              '検索結果は${_connpassModel.resultsReturned.toString()}件です。'
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
        if(_connpassModel.events != null) {
          final event = _connpassModel.events[index];
          return _resultCard(event);
        } else {
          return null;
        }
      },
      itemCount: _connpassModel.resultsReturned,
    );
  }

  Widget _resultCard(EventModel eventModel) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
              context,
              '/detail',
              arguments: eventModel,

          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                  eventModel.title
              ),
            )
          ],
        ),
      ),
    );
  }
}
