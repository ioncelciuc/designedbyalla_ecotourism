import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:flutter/material.dart';

class AdventureMultipleChoice extends StatefulWidget {
  @override
  _AdventureMultipleChoiceState createState() =>
      _AdventureMultipleChoiceState();
}

class _AdventureMultipleChoiceState extends State<AdventureMultipleChoice> {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Multiple choice',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'It\'s been a while',
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoundedButton(
                title: 'Answer 1',
                textColor: Colors.black,
                onPressed: () {},
              ),
              RoundedButton(
                title: 'Answer 2',
                textColor: Colors.black,
                onPressed: () {},
              ),
              RoundedButton(
                title: 'Answer 3',
                textColor: Colors.black,
                onPressed: () {},
              ),
              RoundedButton(
                title: 'Answer 4',
                textColor: Colors.black,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
