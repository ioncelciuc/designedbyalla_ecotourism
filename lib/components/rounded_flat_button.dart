import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:flutter/material.dart';

class RoundedFlatButton extends StatefulWidget {
  RoundedFlatButton({
    @required this.text,
    this.textStyle,
    @required this.color,
    @required this.onPressed,
    @required this.borderRadius,
  });
  final String text;
  final Color color;
  final Function onPressed;
  final TextStyle textStyle;
  final double borderRadius;

  @override
  _RoundedFlatButtonState createState() => _RoundedFlatButtonState();
}

class _RoundedFlatButtonState extends State<RoundedFlatButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: widget.color,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        child: Text(
          widget.text,
          style: widget.textStyle,
        ),
      ),
      shape: roundedRectangleBorder(radius: widget.borderRadius),
      onPressed: widget.onPressed,
    );
  }
}
