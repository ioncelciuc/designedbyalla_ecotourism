import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/models/user_info.dart';
import 'package:designedbyalla_ecotourism/screens/choose_language_page.dart';
import 'package:designedbyalla_ecotourism/services/helper.dart';
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
                    Strings.en ? Strings.enSignUp : Strings.cnSignUp,
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
                        padding: EdgeInsets.symmetric(horizontal: 64),
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
                                    hintText: Strings.en
                                        ? Strings.enHowShouldWeCallYou
                                        : Strings.cnHowShouldWeCallYou),
                              ),
                            ),
                            SizedBox(height: 64),
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
                                    hintText: Strings.en
                                        ? Strings.enRepeatPassword
                                        : Strings.cnRepeatPassword),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: RoundedButton(
                      title: Strings.en ? Strings.enSignUp : Strings.cnSignUp,
                      color: Colors.orange[300],
                      onPressed: () async {
                        if (email == null ||
                            username == null ||
                            password == null ||
                            repeatPassword == null) {
                          Toast.show(
                            Strings.en
                                ? Strings.enCompleteAllFields
                                : Strings.cnCompleteAllFields,
                            context,
                            duration: 2,
                          );
                        } else if (password.length < 6) {
                          Toast.show(
                            Strings.en
                                ? Strings.enPasswordTooShort
                                : Strings.cnPasswordTooShort,
                            context,
                            duration: 2,
                          );
                        } else if (password != repeatPassword) {
                          Toast.show(
                            Strings.en
                                ? Strings.enPasswordNotMatching
                                : Strings.cnPasswordNotMatching,
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
                              await _auth.currentUser.updateProfile(
                                displayName: username,
                              );
                              UserInformation userModel = UserInformation(
                                uid: _auth.currentUser.uid,
                                ecopoints: 0,
                                ecosupply: 0,
                                avatar: 1,
                                temperature: 7,
                                problem1: true,
                                problem2: true,
                                problem3: true,
                                problem4: true,
                                problem5: true,
                              );
                              Helper.instace.addUserInfo(userModel);
                              Navigator.pushReplacementNamed(
                                context,
                                ChooseLanguagePage.id,
                              );
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              Toast.show(
                                'Password to weak!',
                                context,
                                duration: 2,
                              );
                            } else if (e.code == 'email-already-in-use') {
                              Toast.show(
                                'Email already in use',
                                context,
                                duration: 2,
                              );
                            }
                          } catch (e) {
                            print(e);
                            Toast.show(
                              'Failed to Sign Up',
                              context,
                              duration: 2,
                            );
                          } finally {
                            setState(() {
                              loading = false;
                            });
                          }
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
