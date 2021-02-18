import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/screens/choose_language_page.dart';
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  RoundedButton(
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
                              context, ChooseLanguagePage.id);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
