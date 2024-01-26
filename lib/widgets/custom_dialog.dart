import 'package:flutter/material.dart';

Future<void> showCustomDialog(
    BuildContext context, Function() onPressed) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Suroolor buttu!'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Kayradan bashta'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onPressed,
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
