import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';

class AdventureIntroduction extends StatelessWidget {
  final Function onPressed;
  AdventureIntroduction({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Lorem Ipsum',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Card(
              elevation: 5,
              color: Color(0xFFEAECEF),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Text(Strings.enAdventureInfoBox[3]),
                ),
              ),
            ),
          ),
          RoundedButton(
            onPressed: onPressed,
            color: Colors.orange[300],
            title: 'BRING IT ON',
            textColor: Colors.black,
            borderRadius: 0,
          ),
        ],
      ),
    );
  }
}
