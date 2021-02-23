import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class RecoverPassword extends StatefulWidget {
  static const String id = 'RecoverPassword';
  @override
  _RecoverPasswordState createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
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
                  Strings.en
                      ? Strings.enForgotPassword
                      : Strings.cnForgotPassword,
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
                              controller: textEditingController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.emailAddress,
                              decoration: textFieldDecoration.copyWith(
                                  hintText: Strings.en
                                      ? Strings.enEmail
                                      : Strings.cnEmail),
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: RoundedButton(
                    title: Strings.en
                        ? Strings.enRecoverPassword
                        : Strings.cnRecoverPassword,
                    color: Colors.orange[300],
                    onPressed: () async {
                      bool foundUser = true;
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: textEditingController.text);
                      } catch (e) {
                        print(e);
                        foundUser = false;
                        Toast.show(
                          'No user found with this email. Make sure you have spelled the email correctly!',
                          context,
                          duration: 3,
                        );
                      } finally {
                        if (foundUser) {
                          textEditingController.clear();
                          Toast.show(
                            'An email was sent to you in order to recover your password!',
                            context,
                            duration: 3,
                          );
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
    );
  }
}
