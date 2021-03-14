import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final String iconPath;
  final String text;
  ProgressCard({this.iconPath, this.text});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        color: Color(0xFFEAECEF),
        shape: roundedRectangleBorder(radius: 10),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Image.asset(
                  iconPath,
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
