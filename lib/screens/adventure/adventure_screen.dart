import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/screens/adventure/adventure_cards.dart';
import 'package:designedbyalla_ecotourism/screens/adventure/adventure_checklist.dart';
import 'package:designedbyalla_ecotourism/screens/adventure/adventure_drag_drop.dart';
import 'package:designedbyalla_ecotourism/screens/adventure/adventure_introduction.dart';
import 'package:designedbyalla_ecotourism/screens/adventure/adventure_multiple_choice.dart';
import 'package:designedbyalla_ecotourism/screens/adventure/adventure_qa.dart';
import 'package:designedbyalla_ecotourism/screens/adventure/adventure_scale.dart';
import 'package:designedbyalla_ecotourism/screens/adventure/adventure_true_false.dart';
import 'package:flutter/material.dart';

class AdventureScreen extends StatefulWidget {
  static const String id = 'AdventureScreen';
  @override
  _AdventureScreenState createState() => _AdventureScreenState();
}

class _AdventureScreenState extends State<AdventureScreen> {
  PageController controller = PageController(initialPage: 0);
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEAECEF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
        elevation: 10,
        shape: roundedRectangleBorder(radius: 15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/marker.png',
                    color: Colors.blueAccent,
                    height: 30,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Lorem Ipsum',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  onPageChanged: (pageIndex) {
                    setState(() {
                      page = pageIndex;
                    });
                  },
                  children: [
                    AdventureIntroduction(
                      onPressed: () {
                        print('hi');
                      },
                    ),
                    AdventureCards(),
                    AdventureMultipleChoice(),
                    AdventureTrueFalse(),
                    AdventureDragDrop(),
                    AdventureMultipleChoice(),
                    AdventureScale(),
                    AdventureQA(),
                    AdventureChecklist(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  page == 0
                      ? Container()
                      : IconButton(
                          icon: Icon(Icons.skip_previous),
                          iconSize: 40,
                          onPressed: () {
                            controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear,
                            );
                          },
                        ),
                  IconButton(
                    icon: Icon(Icons.skip_next),
                    iconSize: 40,
                    onPressed: () {
                      controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
