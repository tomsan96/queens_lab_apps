import 'package:connpass_api_app/repository/events_repository.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final EventsRepository event;

  Detail({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('イベント詳細'),
      ),
      body: Container(
        child: Text(
          event.title
        ),
      ),
    );
  }
}