import 'package:designedbyalla_ecotourism/screens/return_page.dart';
import 'package:designedbyalla_ecotourism/screens/sign_in_and_register/sign_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'WelcomeScreen';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (FirebaseAuth.instance.currentUser == null) {
          Navigator.pushReplacementNamed(context, SignPage.id);
        }else{
          Navigator.pushReplacementNamed(context, ReturnPage.id);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Hero(
                    tag: 'mgeecologo',
                    child: Image.asset('images/mgeecologo.png'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      'images/logo 1.png',
                      height: 50,
                    ),
                    Image.asset(
                      'images/logo 2.png',
                      height: 50,
                    ),
                    Image.asset(
                      'images/logo 3.png',
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
