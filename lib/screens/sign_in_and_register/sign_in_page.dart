import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/screens/choose_language_page.dart';
import 'package:designedbyalla_ecotourism/screens/return_page.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';

class SignInPage extends StatefulWidget {
  static const String id = 'SignInPage';

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: loading,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'images/logo.png',
                    height: 70,
                  ),
                  SizedBox(height: 16),
                  Text(
                    Strings.en ? Strings.enSignIn : Strings.cnSignIn,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Card(
                      elevation: 10,
                      shape: roundedRectangleBorder(radius: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                    hintText: Strings.en
                                        ? Strings.enEmail
                                        : Strings.cnEmail),
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
                                    hintText: Strings.en
                                        ? Strings.enPassword
                                        : Strings.cnPassword),
                              ),
                            ),
                            SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                Toast.show(
                                  'Forgot password to be implemented',
                                  context,
                                  duration: 2,
                                );
                              },
                              child: Text(
                                Strings.en
                                    ? Strings.enForgotPassword
                                    : Strings.cnForgotPassword,
                                style: TextStyle(
                                  color: Colors.orange[300],
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: RoundedButton(
                      title: Strings.en ? Strings.enSignIn : Strings.cnSignIn,
                      color: Colors.orange[300],
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        try {
                          final existingUser =
                              await _auth.signInWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          if (existingUser != null) {
                            Navigator.pushReplacementNamed(
                              context,
                              ReturnPage.id,
                            );
                          }
                        } catch (error) {
                          print(error);
                          Toast.show(
                            'Failed to Sign In',
                            context,
                            duration: 2,
                          );
                        } finally {
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                    ),
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
