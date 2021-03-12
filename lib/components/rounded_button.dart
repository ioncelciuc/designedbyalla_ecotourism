import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    this.title,
    this.color,
    @required this.onPressed,
    this.textColor,
    this.elevation,
    this.borderRadius,
  });

  final Color color;
  final Color textColor;
  final String title;
  final Function onPressed;
  final double elevation;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
        elevation: elevation ?? 5,
        color: color,
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
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
