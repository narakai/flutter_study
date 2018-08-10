import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_study/widget/demo_ui_challenge/WeightListItem.dart';
import 'package:flutter_study/widget/demo_ui_challenge/ui-dialog.dart';

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

  void _addWeightSave(WeightSave save) {
    setState(() {
      weightSaves.add(save);
    });
  }

//  void _openAddEntryDialog() {
//    Navigator.of(context).push(new MaterialPageRoute<Null>(
//        builder: (BuildContext context) {
//          return new AddEntryDialog();
//        },
//        //Setting it up will provide out screen “close symbol” in top left corner instead of a default “back arrow”.
//        // On the iOS devices it also affects swipe back behavior.
//        fullscreenDialog: true
//    ));
//  }

  Future _openAddEntryDialog() async {
    WeightSave save =
        await Navigator.of(context).push(new MaterialPageRoute<WeightSave>(
            builder: (BuildContext context) {
              return new AddEntryDialog();
            },
            fullscreenDialog: true));
    if (save != null) {
      _addWeightSave(save);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: weightSaves.length,
          itemBuilder: (BuildContext ctx, int index) {
            var weightSave = weightSaves[index];
            var difference = weightSaves.first == weightSave
                ? 0.0
                : weightSave.weight -
                    weightSaves[weightSaves.indexOf(weightSave) - 1].weight;
            return new WeightListItem(weightSave, difference);
          }),
//      body: new ListView(
//        children: weightSaves.map((WeightSave weightSave) {
//          //calculating difference
//          double difference = weightSaves.first == weightSave
//              ? 0.0
//              : weightSave.weight -
//                  weightSaves[weightSaves.indexOf(weightSave) - 1].weight;
//          return new WeightListItem(weightSave, difference);
//        }).toList(),
//      ),
      floatingActionButton: new FloatingActionButton(
//        onPressed: _addWeightSave,
        onPressed: _openAddEntryDialog,
        tooltip: 'Add new weight entry',
        child: new Icon(Icons.add),
      ),
    );
  }
}
