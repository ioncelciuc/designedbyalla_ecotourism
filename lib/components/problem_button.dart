import 'package:designedbyalla_ecotourism/screens/home/ecosite.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';

class ProblemButton extends StatefulWidget {
  double width;
  double bottomDivision;
  double leftDivision;
  double opacity;
  int buttonIndex;
  ProblemButton({
    this.opacity,
    this.width,
    this.bottomDivision,
    this.leftDivision,
    this.buttonIndex,
  });

  @override
  ProblemButtonState createState() => ProblemButtonState();
}

class ProblemButtonState extends State<ProblemButton> {

  @override
  Widget build(BuildContext context) {
    var ancestralState = context.findAncestorStateOfType<EcositeState>();
    return Opacity(
      opacity: widget.opacity,
      child: Container(
        margin: EdgeInsets.only(
          bottom: widget.width / widget.bottomDivision,
          left: widget.width / widget.leftDivision,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: widget.opacity != 1 || Strings.showTutorial
                  ? null
                  : () {
                      setState(() {
                        ancestralState.setProblemIndex(widget.buttonIndex);
                      });
                    },
              child: Image.asset(
                ancestralState.problemIndex == widget.buttonIndex
                    ? 'images/problemButtonRed.png'
                    : 'images/problemButton.png',
                height: 25,
              ),
            ),
            ancestralState.fixButton != widget.buttonIndex
                ? Container()
                : InkWell(
                    onTap: ancestralState.problemTextIndex > 1
                        ? null
                        : () {
                            ancestralState.showEcosupplyDialog();
                          },
                    child: Image.asset('images/fix.png', height: 25),
                  ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
