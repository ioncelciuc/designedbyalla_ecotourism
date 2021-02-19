import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/models/user_model.dart';
import 'package:designedbyalla_ecotourism/screens/survey/survey_container_page.dart';
import 'package:designedbyalla_ecotourism/services/helper.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';

class SurveyPage extends StatefulWidget {
  static const id = 'SurveyPage';

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  UserModel user;
  int question = 0;
  int buttonSelected = -1;
  List<int> responses = List<int>();
  bool loading = false;

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
        body: ModalProgressHUD(
          inAsyncCall: loading,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'images/logo.png',
                    height: 70,
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            user.avatar != null
                                ? Image.asset(
                                    'images/avatar_${user.avatar}.png',
                                    height: 100,
                                  )
                                : Container(),
                            SizedBox(height: 8),
                            Text(
                              Strings.en
                                  ? Strings.enSurveyQuestions[question]
                                  : Strings.cnSurveyQuestions[question],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    RoundedButton(
                                      onPressed: () {
                                        setState(() {
                                          buttonSelected =
                                              buttonSelected == 0 ? -1 : 0;
                                        });
                                      },
                                      title: Strings.en
                                          ? Strings.enSurveyAnswers[question][0]
                                          : Strings.cnSurveyAnswears[question]
                                              [0],
                                      textColor: Colors.black,
                                      color: buttonSelected == 0
                                          ? Colors.orange[300]
                                          : null,
                                    ),
                                    RoundedButton(
                                      onPressed: () {
                                        setState(() {
                                          buttonSelected =
                                              buttonSelected == 1 ? -1 : 1;
                                        });
                                      },
                                      title: Strings.en
                                          ? Strings.enSurveyAnswers[question][1]
                                          : Strings.cnSurveyAnswears[question]
                                              [1],
                                      textColor: Colors.black,
                                      color: buttonSelected == 1
                                          ? Colors.orange[300]
                                          : null,
                                    ),
                                    RoundedButton(
                                      onPressed: () {
                                        setState(() {
                                          buttonSelected =
                                              buttonSelected == 2 ? -1 : 2;
                                        });
                                      },
                                      title: Strings.en
                                          ? Strings.enSurveyAnswers[question][2]
                                          : Strings.cnSurveyAnswears[question]
                                              [2],
                                      textColor: Colors.black,
                                      color: buttonSelected == 2
                                          ? Colors.orange[300]
                                          : null,
                                    ),
                                    RoundedButton(
                                      onPressed: () {
                                        setState(() {
                                          buttonSelected =
                                              buttonSelected == 3 ? -1 : 3;
                                        });
                                      },
                                      title: Strings.en
                                          ? Strings.enSurveyAnswers[question][3]
                                          : Strings.cnSurveyAnswears[question]
                                              [3],
                                      textColor: Colors.black,
                                      color: buttonSelected == 3
                                          ? Colors.orange[300]
                                          : null,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: RoundedButton(
                      onPressed: () async {
                        if (buttonSelected == -1) {
                          Toast.show('Please select an option', context);
                        } else if (question ==
                            Strings.enSurveyQuestions.length - 1) {
                          responses.add(buttonSelected);
                          setState(() {
                            loading = true;
                          });
                          await Helper.instace.addUserSurveyResponse(
                            user,
                            question,
                            responses,
                          );
                          setState(() {
                            loading = false;
                          });
                          Navigator.pushReplacementNamed(
                            context,
                            SurveyContainerPage.id,
                          );
                        } else {
                          responses.add(buttonSelected);
                          setState(() {
                            buttonSelected = -1;
                            question++;
                          });
                        }
                      },
                      title: Strings.en ? Strings.enNext : Strings.cnNext,
                      textColor: Colors.black,
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
