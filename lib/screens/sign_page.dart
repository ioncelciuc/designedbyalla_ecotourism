import 'package:designedbyalla_ecotourism/components/rounded_flat_button.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:flutter/material.dart';

class SignPage extends StatefulWidget {
  static const String id = 'SignPage';

  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  bool signInSelected = true;
  bool signUpSelected = false;

  String signInEmail;
  String signUpUsername;
  String signUpEmail;
  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signUpUsernameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 50,
                ),
                SizedBox(height: 16),
                Text(
                  'Let\'s get started!',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  shape: roundedRectangleBorder(radius: 10),
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RoundedFlatButton(
                          text: 'SIGN UP',
                          textStyle: TextStyle(
                            color: signInSelected ? Colors.white : Colors.black,
                          ),
                          color:
                              signInSelected ? Colors.cyan[200] : Colors.white,
                          borderRadius: 10,
                          onPressed: () {
                            setState(() {
                              signInSelected = true;
                              signUpSelected = false;
                            });
                          },
                        ),
                        SizedBox(width: 4),
                        RoundedFlatButton(
                          text: 'SIGN UP',
                          textStyle: TextStyle(
                              color:
                                  signUpSelected ? Colors.white : Colors.black),
                          color:
                              signUpSelected ? Colors.cyan[200] : Colors.white,
                          borderRadius: 10,
                          onPressed: () {
                            setState(() {
                              signInSelected = false;
                              signUpSelected = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Card(
                    shape: roundedRectangleBorder(radius: 10),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: signInSelected
                            ? [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  child: TextField(
                                    controller: signInEmailController,
                                    onChanged: (value) {
                                      signInEmail = value;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: textFieldDecoration.copyWith(
                                      hintText: 'email',
                                    ),
                                  ),
                                ),
                              ]
                            : [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  child: TextField(
                                    controller: signUpUsernameController,
                                    onChanged: (value) {
                                      signUpUsername = value;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: textFieldDecoration.copyWith(
                                      hintText: 'username',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  child: TextField(
                                    controller: signUpEmailController,
                                    onChanged: (value) {
                                      signUpEmail = value;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: textFieldDecoration.copyWith(
                                      hintText: 'email',
                                    ),
                                  ),
                                ),
                              ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                RoundedFlatButton(
                  text: signInSelected ? 'SIGN IN' : 'SIGN UP',
                  color: Colors.orange[300],
                  borderRadius: 45,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
