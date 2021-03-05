import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:flutter/material.dart';

class GuideCard extends StatelessWidget {
  GuideCard({@required this.imagePath, this.boxFit});
  final String imagePath;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: roundedRectangleBorder(radius: 16),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Image.asset(
          this.imagePath,
          fit: boxFit ?? BoxFit.fitHeight,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
