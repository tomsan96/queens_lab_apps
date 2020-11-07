import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp(
    items: List<ListItem>.generate(
      1000, (i) => MessageItem("Sender $i"),
    ),
  ));
}


class MyApp extends StatelessWidget {
  final List<ListItem> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'listView';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(

          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                    Expanded(
                      child:ListTile(
                        title: item.buildTitle(context),
                        subtitle: item.buildSubtitle(context),
                      ),
                    ),
                     Container(
                       padding: EdgeInsets.only(
                         right: 10,
                       ),
                       child: Icon(
                         Icons.add,
                       ),
                     ) ,
                ],

              ),
            );
          },
        ),
      ),
    );
  }
}


abstract class ListItem {

  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class MessageItem implements ListItem {
  String sender;
  String body;

  MessageItem(sender) {
    this.sender = sender;
    this.body = WordPair.random().asPascalCase;
  }

  Widget buildTitle(BuildContext context) => Text(sender);

  Widget buildSubtitle(BuildContext context) => Text(body);
}

