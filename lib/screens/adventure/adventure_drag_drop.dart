import 'package:designedbyalla_ecotourism/components/drag_tile.dart';
import 'package:flutter/material.dart';

class AdventureDragDrop extends StatefulWidget {
  @override
  _AdventureDragDropState createState() => _AdventureDragDropState();
}

class _AdventureDragDropState extends State<AdventureDragDrop> {
  List<String> textList = [
    'Drag 1',
    'Drag 2',
    'Drag 3',
    'Drag 4',
    'Drag 5',
    'Drag 6',
    'Drag 7',
    'Drag 8',
    'Drag 9',
    'Drag 10',
  ];
  int indexList = 0;
  int indexLeft = -1;
  int indexRight = -1;

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
            'Drag and Drop',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          textList.length == indexList
              ? DragTile('')
              : Draggable(
                  data: indexList,
                  feedback: DragTile(textList[indexList]),
                  child: DragTile(textList[indexList]),
                  childWhenDragging: DragTile(
                    indexList < textList.length - 1
                        ? textList[indexList + 1]
                        : '',
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DragTarget(
                builder: (context, candidates, rejects) {
                  if (indexLeft == -1) {
                    return DragTile('');
                  }
                  return DragTile(textList[indexLeft]);
                },
                onAccept: (value) {
                  setState(() {
                    indexLeft = value;
                    indexList++;
                  });
                },
              ),
              DragTarget(
                builder: (context, candidates, rejects) {
                  if (indexRight == -1) {
                    return DragTile('');
                  }
                  return DragTile(textList[indexRight]);
                },
                onAccept: (value) {
                  setState(() {
                    indexRight = value;
                    indexList++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
