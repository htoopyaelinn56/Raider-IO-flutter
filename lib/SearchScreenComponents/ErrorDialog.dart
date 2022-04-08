import 'package:flutter/material.dart';

class ErrorDialogRio extends StatelessWidget {
  const ErrorDialogRio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF0A0E21),
      title: Text(
        "Error!!",
        style: Theme.of(context).textTheme.headline5,
      ),
      content: const Text(
        "Invalid name or realm!",
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: const Icon(Icons.check),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
