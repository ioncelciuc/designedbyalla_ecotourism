import 'package:designedbyalla_ecotourism/screens/home/adventure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Marker extends StatefulWidget {
  double width;
  double bottomDivision;
  double leftDivision;
  int markerIndex;
  String text;

  Marker({
    this.width,
    this.bottomDivision,
    this.leftDivision,
    this.markerIndex,
    this.text,
  });

  @override
  _MarkerState createState() => _MarkerState();
}

class _MarkerState extends State<Marker> {
  @override
  Widget build(BuildContext context) {
    var ancestralState = context.findAncestorStateOfType<AdventureState>();
    return Container(
      margin: EdgeInsets.only(
        bottom: widget.width / widget.bottomDivision,
        left: widget.width / widget.leftDivision,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ancestralState.selectedMarker != widget.markerIndex
              ? Container()
              : Card(
                  color: Color(0xFFEAECEF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
          InkWell(
            onTap: (){
              ancestralState.selectMarkerIndex(widget.markerIndex);
            },
            child: Image.asset(
              'images/marker.png',
              height: 30,
              color: ancestralState.selectedMarker == widget.markerIndex ? Colors.teal : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
