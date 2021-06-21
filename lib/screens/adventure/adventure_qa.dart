import 'package:flutter/material.dart';

class AdventureQA extends StatefulWidget {
  @override
  _AdventureQAState createState() => _AdventureQAState();
}

class _AdventureQAState extends State<AdventureQA> {

  TextEditingController controller = TextEditingController();
  
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Question'),
          TextField(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
