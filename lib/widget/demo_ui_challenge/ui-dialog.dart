import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_study/widget/demo_ui_challenge/ui-listview.dart';

class AddEntryDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AddEntryDialogState();
  }
}

class AddEntryDialogState extends State<AddEntryDialog> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('New entry'),
        actions: <Widget>[
          new FlatButton(
              onPressed: () {
                Navigator.of(context).pop(new WeightSave(
                    new DateTime.now(), new Random().nextInt(100).toDouble()));
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
      body: new Text('Foo'),
    );
  }
}
