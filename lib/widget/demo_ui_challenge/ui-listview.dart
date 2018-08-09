import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return new _ListViewState();
  }
}

class _ListViewState extends State<ListViewPage> {
  List<String> strings = new List();

  void _addWeightSave() {
    setState(() {
      strings.add("new string");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: strings.map((String string) {
          return new Row(
            children: [new Text(string)],
          );
        }).toList(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addWeightSave,
        tooltip: 'Add new weight entry',
        child: new Icon(Icons.add),
      ),
    );
  }
}
