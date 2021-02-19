import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/models/user_model.dart';
import 'package:designedbyalla_ecotourism/screens/survey/survey_page.dart';
import 'package:designedbyalla_ecotourism/services/helper.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';

class ChooseAvatar extends StatefulWidget {
  static const String id = 'ChooseAvatar';

  @override
  _ChooseAvatarState createState() => _ChooseAvatarState();
}

class _ChooseAvatarState extends State<ChooseAvatar> {
  int avatar = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 16, left: 8, right: 8),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'images/logo_choose_avatar.png',
                  height: 70,
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        child: Image.asset(
                          avatar == 1
                              ? 'images/avatar_info_1.png'
                              : (avatar == 2
                                  ? 'images/avatar_info_2.png'
                                  : 'images/avatar_info_3.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              elevation: 10,
                              heroTag: 'FAB1',
                              backgroundColor: avatar == 1 ? Colors.teal[300] : Colors.orange[300],
                              onPressed: () {
                                setState(() {
                                  avatar = 1;
                                });
                              },
                              child: Image.asset(
                                'images/avatar_1.png',
                                height: 50,
                              ),
                            ),
                            SizedBox(width: 16),
                            FloatingActionButton(
                              elevation: 10,
                              heroTag: 'FAB2',
                              backgroundColor: avatar == 2 ? Colors.teal[300] : Colors.orange[300],
                              onPressed: () {
                                setState(() {
                                  avatar = 2;
                                });
                              },
                              child: Image.asset(
                                'images/avatar_2.png',
                                height: 50,
                              ),
                            ),
                            SizedBox(width: 16),
                            FloatingActionButton(
                              elevation: 10,
                              heroTag: 'FAB3',
                              backgroundColor: avatar == 3 ? Colors.teal[300] : Colors.orange[300],
                              onPressed: () {
                                setState(() {
                                  avatar = 3;
                                });
                              },
                              child: Image.asset(
                                'images/avatar_3.png',
                                height: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                RoundedButton(
                  onPressed: () async {
                    UserModel userModel =
                        await Helper.instace.getCurrentUserInfo();
                    userModel.avatar = avatar;
                    await Helper.instace.updateUserInfo(userModel);
                    Navigator.pushReplacementNamed(context, SurveyPage.id);
                  },
                  color: Colors.white,
                  title: Strings.en ? Strings.enBegin : Strings.cnBegin,
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
