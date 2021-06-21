import 'package:flutter/material.dart';

class AdventureChecklist extends StatefulWidget {
  @override
  _AdventureChecklistState createState() => _AdventureChecklistState();
}

class _AdventureChecklistState extends State<AdventureChecklist> {
  List<ListTile> checkboxList = [];
  List<bool> isTicked = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  void createList() {
    for (int i = 0; i < 6; i++) {
      checkboxList.add(
        ListTile(
          leading: Checkbox(
            value: isTicked[i],
            onChanged: (newVal) {
              setState(() {
                isTicked[i] = newVal;
              });
            },
          ),
          title: Text('For my next ecotourism visit, I will:'),
        ),
      );
    }
  }

  @override
    void initState() {
      super.initState();
      createList();
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Travel Checklist',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Lorem Ipsum'),
            ],
          ),
          Column(
            children: checkboxList,
          )
        ],
      ),
    );
  }
}
