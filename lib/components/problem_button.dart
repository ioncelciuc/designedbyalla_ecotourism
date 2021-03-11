import 'package:designedbyalla_ecotourism/models/user_info.dart';
import 'package:designedbyalla_ecotourism/screens/home/ecosite.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProblemButton extends StatefulWidget {
  UserInformation userInfo;
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
    this.userInfo,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //CANCEL BUTTON
                ancestralState.fixButton != widget.buttonIndex
                    ? Container()
                    : InkWell(
                        onTap: () {
                          ancestralState.setOpacity(
                            image: 1,
                            problemButton1: widget.userInfo.problem1 ? 1 : 0,
                            problemButton2: widget.userInfo.problem2 ? 1 : 0,
                            problemButton3: widget.userInfo.problem3 ? 1 : 0,
                            problemButton4: widget.userInfo.problem4 ? 1 : 0,
                            problemButton5: widget.userInfo.problem5 ? 1 : 0,
                          );
                          ancestralState.setState(() {
                            ancestralState.problemIndex = null;
                            ancestralState.fixButton = 0;
                          });
                        },
                        child: Image.asset('images/cancel.png', height: 25),
                      ),
                //FIX BUTTON
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
