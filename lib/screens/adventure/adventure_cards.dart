import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class AdventureCards extends StatefulWidget {
  @override
  _AdventureCardsState createState() => _AdventureCardsState();
}

class _AdventureCardsState extends State<AdventureCards> {
  @override
  Widget build(BuildContext context) {
    return TinderSwapCard(
      cardBuilder: (context, index) => Card(
        elevation: 10,
        shape: roundedRectangleBorder(radius: 15),
        child: Center(
          child: Text(
            'Info nr. $index',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      totalNum: 5,
      minWidth: 1,
      maxWidth: MediaQuery.of(context).size.width,
      minHeight: 3,
      maxHeight: MediaQuery.of(context).size.height,
    );
  }
}
