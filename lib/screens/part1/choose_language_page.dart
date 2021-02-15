import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';

class ChooseLanguagePage extends StatelessWidget {
  static const String id = 'ChooseLanguagePage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Text('Hello, ${Strings.username}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
