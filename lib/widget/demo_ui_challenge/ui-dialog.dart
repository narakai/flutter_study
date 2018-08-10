import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_study/widget/demo_ui_challenge/ui-listview.dart';
import 'package:flutter_study/widget/demo_ui_challenge/ui-timePicker.dart';

class AddEntryDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AddEntryDialogState(new DateTime.now());
  }
}

class AddEntryDialogState extends State<AddEntryDialog> {
  DateTime _dateTime = new DateTime.now();

  AddEntryDialogState(this._dateTime);

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
      body: new ListTile(
        leading: new Icon(Icons.today, color: Colors.grey[500]),
        title: new DateTimeItem(
          dateTime: _dateTime,
          onChanged: (dateTime) => setState(() => _dateTime = dateTime),
        ),
      ),
    );
  }
}
