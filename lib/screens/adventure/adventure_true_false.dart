import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:flutter/material.dart';

class AdventureTrueFalse extends StatefulWidget {
  @override
  _AdventureTrueFalseState createState() => _AdventureTrueFalseState();
}

class _AdventureTrueFalseState extends State<AdventureTrueFalse> {
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
            'True or False',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'It\'s been a while',
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'True',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'False',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
