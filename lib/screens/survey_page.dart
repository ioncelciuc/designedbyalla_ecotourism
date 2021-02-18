import 'package:designedbyalla_ecotourism/models/user_model.dart';
import 'package:designedbyalla_ecotourism/services/helper.dart';
import 'package:flutter/material.dart';

class SurveyPage extends StatefulWidget {
  static const id = 'SurveyPage';

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  UserModel user;

  void initialization() async {
    user = UserModel();
    UserModel existingUser = await Helper.instace.getCurrentUserInfo();
    setState(() {
      user = existingUser;
    });
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                user.avatar != null
                    ? Image.asset(
                        'images/avatar_${user.avatar}.png',
                        height: 70,
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
