import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_study/widget/demo_ui_challenge/ui-listview.dart';
import 'package:flutter_study/widget/demo_ui_challenge/ui-timePicker.dart';
import 'package:flutter_study/widget/demo_ui_challenge/weight_entry.dart';
import 'package:numberpicker/numberpicker.dart';

class AddEntryDialog extends StatefulWidget {
  final double initialWeight = 50.0;
  final WeightEntry weighEntryToEdit;

  @override
  State<StatefulWidget> createState() {
    if (weighEntryToEdit != null) {
      return new AddEntryDialogState(weighEntryToEdit.dateTime,
          weighEntryToEdit.weight, weighEntryToEdit.note);
    } else {
      return new AddEntryDialogState(new DateTime.now(), initialWeight, null);
    }
  }
}

class AddEntryDialogState extends State<AddEntryDialog> {
  DateTime _dateTime = new DateTime.now();
  double _weight;
  String _note;
  TextEditingController _textController;

  AddEntryDialogState(this._dateTime, this._weight, this._note);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('New entry'),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(new WeightSave(
                      _dateTime, new Random().nextInt(100).toDouble()));
                },
                child: new Text(
                  'SAVE',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: Colors.white),
                )),
          ],
        ),
        body: new Column(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.today, color: Colors.grey[500]),
              title: new DateTimeItem(
                dateTime: _dateTime,
                onChanged: (dateTime) => setState(() => _dateTime = dateTime),
              ),
            ),
            new ListTile(
              leading: new Image.asset(
                "images/scale-bathroom.png",
                color: Colors.grey[500],
                height: 24.0,
                width: 24.0,
              ),
              title: new Text(
                "$_weight kg",
              ),
              onTap: () => _showWeightPicker(context),
            ),
          ],
        ));
  }

  _showWeightPicker(BuildContext context) {
    showDialog(
      context: context,
      child: new NumberPickerDialog.decimal(
        minValue: 1,
        maxValue: 150,
        initialDoubleValue: _weight,
        title: new Text("Enter your weight"),
      ),
    ).then((value) {
      if (value != null) {
        setState(() => _weight = value);
      }
    });
  }
}
