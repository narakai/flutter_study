import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_study/widget/demo_ui_challenge/WeightListItem.dart';

class WeightSave {
  DateTime dateTime;
  double weight;

  WeightSave(this.dateTime, this.weight);
}

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return new _ListViewState();
  }
}

class _ListViewState extends State<ListViewPage> {
  List<WeightSave> weightSaves = new List();

  void _addWeightSave() {
    setState(() {
      weightSaves.add(new WeightSave(
          new DateTime.now(), new Random().nextInt(100).toDouble()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: weightSaves.map((WeightSave weightSave) {
          //calculating difference
          double difference = weightSaves.first == weightSave
              ? 0.0
              : weightSave.weight -
                  weightSaves[weightSaves.indexOf(weightSave) - 1].weight;
          return new WeightListItem(weightSave, difference);
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
