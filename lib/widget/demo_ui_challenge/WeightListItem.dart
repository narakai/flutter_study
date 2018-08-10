import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_study/widget/demo_ui_challenge/ui-listview.dart';

class WeightListItem extends StatelessWidget {
  final WeightSave weightSave;
  final double weightDifference;

  WeightListItem(this.weightSave, this.weightDifference);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.all(16.0),
      child: new Row(
        children: [
          //expand 默认flex为1，平均分配
          new Expanded(
              child: new Column(
            children: [
              new Text(
                new DateFormat.yMMMMd().format(weightSave.dateTime),
                textScaleFactor: 0.9,
              ),
              new Text(
                new DateFormat.EEEE().format(weightSave.dateTime),
                textScaleFactor: 0.8,
                style: new TextStyle(color: Colors.grey),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )),
          new Expanded(
              child: new Text(
            weightSave.weight.toString(),
            textScaleFactor: 2.0,
            textAlign: TextAlign.center,
          )),
          new Expanded(
              child: new Text(
            weightDifference.toString(),
            textScaleFactor: 1.6,
            textAlign: TextAlign.right,
          ))
        ],
      ),
    );
  }
}
