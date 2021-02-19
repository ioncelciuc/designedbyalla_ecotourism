import 'package:designedbyalla_ecotourism/models/user_model.dart';
import 'package:designedbyalla_ecotourism/screens/steps_page/steps_page.dart';
import 'package:designedbyalla_ecotourism/services/helper.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class ChooseLanguagePage extends StatefulWidget {
  static const String id = 'ChooseLanguagePage';

  @override
  _ChooseLanguagePageState createState() => _ChooseLanguagePageState();
}

class _ChooseLanguagePageState extends State<ChooseLanguagePage> {
  UserModel userModel;

  void initialize() async {
    userModel = UserModel(uid: '', email: '', username: '', avatar: 1);
    UserModel newUser = await Helper.instace.getCurrentUserInfo();
    setState(() {
      userModel = newUser;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 100,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          ),
                          children: [
                            TextSpan(
                              text: 'Hello, ',
                              style: TextStyle(
                                color: Colors.orange[300],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '${userModel.username}!',
                            ),
                          ],
                        ),
                      ),
                      Text(Strings.enChooseLanguage),
                      Text(Strings.cnChooseLanguage),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // SharedPreferences sharedPreferences =
                          //     await SharedPreferences.getInstance();
                          // await sharedPreferences.setBool('EN', false);
                          // Strings.en = false;
                          // Navigator.pushReplacementNamed(context, StepsPage.id);
                          Toast.show('Chinese not yet implemented', context);
                        },
                        child: Image.asset(
                          'images/language_cn.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          await sharedPreferences.setBool('EN', true);
                          Strings.en = true;
                          Navigator.pushReplacementNamed(context, StepsPage.id);
                        },
                        child: Image.asset(
                          'images/language_en.png',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
