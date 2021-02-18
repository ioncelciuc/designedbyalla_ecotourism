import 'package:flutter/material.dart';

class StepPage extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String text;

  StepPage({this.imgUrl, this.text, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? '',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Image.asset(
                imgUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 16),
            Text(
              text ?? '',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
