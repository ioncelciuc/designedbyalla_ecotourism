import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInPage extends StatefulWidget {
  static const String id = 'SignInPage';

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 100,
                ),
                SizedBox(height: 32),
                Card(
                  elevation: 10,
                  shape: roundedRectangleBorder(radius: 10),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                          elevation: 10,
                          child: TextField(
                            onChanged: (value) {
                              email = value;
                            },
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.emailAddress,
                            decoration:
                                textFieldDecoration.copyWith(hintText: 'email'),
                          ),
                        ),
                        SizedBox(height: 8),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                          elevation: 10,
                          child: TextField(
                            onChanged: (value) {
                              password = value;
                            },
                            textAlign: TextAlign.center,
                            obscureText: true,
                            decoration: textFieldDecoration.copyWith(
                                hintText: 'password'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                RoundedButton(
                  title: 'SIGN IN',
                  color: Colors.orange[300],
                  onPressed: () {
                    print(email);
                    print(password);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
