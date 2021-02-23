import 'package:flutter/material.dart';

class ProgressBarItem extends StatefulWidget {
  final String text;
  final Widget body;

  ProgressBarItem({this.text, @required this.body});

  @override
  _ProgressBarItemState createState() => _ProgressBarItemState();
}

class _ProgressBarItemState extends State<ProgressBarItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.text ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 7,
            ),
          ),
          SizedBox(height: 4),
          widget.body,
        ],
      ),
    );
  }
}