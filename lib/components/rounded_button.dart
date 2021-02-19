import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    this.title,
    this.color,
    @required this.onPressed,
    this.textColor,
  });

  final Color color;
  final Color textColor;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          minWidth: ButtonTheme.of(context).minWidth,
          onPressed: onPressed,
          child: Text(
            title ?? '',
            style: TextStyle(color: textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
