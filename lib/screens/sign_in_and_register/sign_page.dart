import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/screens/sign_in_and_register/sign_in_page.dart';
import 'package:designedbyalla_ecotourism/screens/sign_in_and_register/sign_up_page.dart';
import 'package:flutter/material.dart';

class SignPage extends StatelessWidget {
  static const String id = 'SignPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 64),
                  child: Hero(
                    tag: 'mgeecologo',
                    child: Image.asset(
                      'images/mgeecologo.png',
                    ),
                  ),
                ),
                SizedBox(height: 48),
                Text(
                  'Let\'s get started!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 32),
                RoundedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignInPage.id);
                  },
                  title: 'SIGN IN',
                  color: Colors.teal[300],
                ),
                RoundedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpPage.id);
                  },
                  title: 'SIGN UP',
                  color: Colors.teal[300],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
