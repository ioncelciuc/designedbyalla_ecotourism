import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';

class AdventureScale extends StatefulWidget {
  @override
  _AdventureScaleState createState() => _AdventureScaleState();
}

class _AdventureScaleState extends State<AdventureScale> {
  double val = 0;

  Widget rating(String text) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 32,
          width: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
        ),
      ],
    );
  }

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Question'),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    rating('Bad'),
                    rating('Unsure'),
                    rating('Good'),
                    rating('Great'),
                  ],
                ),
              ),
              Slider(
                value: val,
                onChanged: (value) {
                  setState(() {
                    val = value;
                  });
                },
                divisions: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
