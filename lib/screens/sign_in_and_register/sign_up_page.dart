import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:designedbyalla_ecotourism/constants.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'SignUpPage';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email;
  String password;
  String repeatPassword;

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
                        SizedBox(height: 8),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                          elevation: 10,
                          child: TextField(
                            onChanged: (value) {
                              repeatPassword = value;
                            },
                            textAlign: TextAlign.center,
                            obscureText: true,
                            decoration: textFieldDecoration.copyWith(
                                hintText: 'repeat password'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                RoundedButton(
                  title: 'SIGN UP',
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
