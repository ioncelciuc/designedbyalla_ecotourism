import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DragTile extends StatelessWidget {
  final String text;
  DragTile(this.text);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        height: 100,
        width: 100,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
