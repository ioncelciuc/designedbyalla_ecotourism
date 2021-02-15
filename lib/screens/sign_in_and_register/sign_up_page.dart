import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/screens/part1/choose_language_page.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'SignUpPage';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  String email;
  String username;
  String password;
  String repeatPassword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: loading,
          child: Padding(
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
                  SizedBox(height: 16),
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
                              decoration: textFieldDecoration.copyWith(
                                  hintText: 'email'),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45),
                            ),
                            elevation: 10,
                            child: TextField(
                              onChanged: (value) {
                                username = value;
                              },
                              textAlign: TextAlign.center,
                              decoration: textFieldDecoration.copyWith(
                                  hintText: 'how should we call you?'),
                            ),
                          ),
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
                  RoundedButton(
                    title: 'SIGN UP',
                    color: Colors.orange[300],
                    onPressed: () async {
                      if (email == null ||
                          password == null ||
                          username == null ||
                          repeatPassword == null) {
                        Toast.show(
                          'Please complete all fields',
                          context,
                          duration: 2,
                        );
                      } else if (password != repeatPassword) {
                        Toast.show(
                          'Passwords must match',
                          context,
                          duration: 2,
                        );
                      } else if (password.length < 6) {
                        Toast.show(
                          'Password must be at least 6 characters',
                          context,
                          duration: 2,
                        );
                      } else {
                        setState(() {
                          loading = true;
                        });
                        try {
                          final user =
                              await _auth.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          if (user != null) {
                            Strings.username = username;
                            Navigator.pushReplacementNamed(
                              context,
                              ChooseLanguagePage.id,
                            );
                            setState(() {
                              loading = false;
                            });
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
