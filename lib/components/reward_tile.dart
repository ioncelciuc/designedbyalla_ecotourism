import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:flutter/material.dart';

class RewardTile extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  RewardTile({this.image, this.title, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          elevation: 10,
          shape: roundedRectangleBorder(radius: 15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(this.image, width: 30),
          ),
        ),
        SizedBox(width: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            this.title != null
                ? Text(
                    this.title,
                    style: TextStyle(
                      color: Colors.orange[300],
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Container(),
            Text(
              this.subtitle,
              style: TextStyle(
                color: Color.fromARGB(255, 89, 188, 203),
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
