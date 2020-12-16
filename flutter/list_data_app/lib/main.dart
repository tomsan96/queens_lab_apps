import 'package:flutter/material.dart';
import 'package:list_data_app/PersonModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListState();
  }
}

class ListState extends State<HomeWidget> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<PersonModel> personList = new List<PersonModel>();
    var tom = new PersonModel(1, "Tom","climbing");
    var taro = new PersonModel(2, "Taro","soccer");
    var hanako = new PersonModel(3, "Hanako","tennis");
    personList.add(tom);
    personList.add(taro);
    personList.add(hanako);


    return Scaffold(
      appBar: AppBar(title: Text('Self-Introduction Card'),),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38),
                ),
              ),
              child: ListTile(
                title: Text(personList[index].name),
                subtitle: Text('hobby:' + personList[index].hobby),
              ),
          );
        },
        itemCount: personList.length,
      ),
    );
  }
}
