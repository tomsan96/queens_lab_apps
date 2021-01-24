import 'package:connpass_api_app/repository/event_repository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Detail extends StatelessWidget {
  EventRepository event;
  @override
  Widget build(BuildContext context) {
    event = ModalRoute.of(context).settings.arguments as EventRepository;
    return Scaffold(
      appBar: AppBar(
        title: const Text('イベント詳細'),
      ),
     body: Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           titleSection(),
           thumbnailSection(),
           detailSection(),
         ],
       ),
     ),
    );
  }

  // TODO サムネイルのスクレイピング？
  Widget thumbnailSection() {
    return Container(

    );
  }

  Widget titleSection () {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            event.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            event.catchMessage,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  Widget detailSection() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildDetail(),
          buildUrlLink(),
        ],
      ),
    );
  }

  Widget buildDetail() {
    final detailMap = {
      '開催日時': changeTimeFormat(event.startedAt),
      '終了日時': changeTimeFormat(event.endedAt),
      '会場': event.place,
      '会場の所在地': event.address,
    };

    return Container(
      child: buildDetailRow(detailMap)
    );
  }

  Widget buildDetailRow(Map<String, String> detailMap) {
    List<Widget> detailList = [];
    detailMap.forEach((key, value) {
      detailList.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                10,
                5,
                5,
                5,
              ),
              child: Text(key == null ? '' : key),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                10,
                5,
                10,
                5,
              ),
              child: Text(value == null ? '' : value),
            ),
          ),
        ],
      ));
    });
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: detailList,
    );
  }

  Widget buildUrlLink() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        10, 15, 0, 0
      ),
      width: double.infinity,
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: [
            const TextSpan(
              style: TextStyle(
                color: Colors.black,
              ),
              text: '公式サイトは',
            ),
            TextSpan(
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              text: 'こちらから',
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await launch(
                    event.eventUrl,
                    forceWebView: true,
                    forceSafariVC: true,
                  );
                }
            )
          ],
        ),
      ),
    );
  }

  // ISO-8601形式を「○○年○○月○○日○○時○○分」に変換
  String changeTimeFormat(String before) {
    initializeDateFormatting('ja_JP');

    final datetime = DateTime.parse(before);
    final formatter = DateFormat('yyyy年MM月dd日HH時mm分', 'ja_JP');
    final formatted = formatter.format(datetime);
    return formatted;
  }
}