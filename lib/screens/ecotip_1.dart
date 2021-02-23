import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/screens/home/home.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';

class Ecotip1 extends StatelessWidget {
  static const String id = 'Ecotip1';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'images/logo.png',
                height: 70,
              ),
              SizedBox(height: 16),
              Expanded(
                child: Container(
                  child: Image.asset('images/ecotip_1.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 64),
                child: RoundedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Home.id);
                  },
                  title: Strings.en ? Strings.enImReady : Strings.cnImReady,
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
