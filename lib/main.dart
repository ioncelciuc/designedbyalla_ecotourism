import 'package:designedbyalla_ecotourism/screens/choose_avatar.dart';
import 'package:designedbyalla_ecotourism/screens/choose_language_page.dart';
import 'package:designedbyalla_ecotourism/screens/ecotip_1.dart';
import 'package:designedbyalla_ecotourism/screens/return_page.dart';
import 'package:designedbyalla_ecotourism/screens/sign_in_and_register/sign_in_page.dart';
import 'package:designedbyalla_ecotourism/screens/sign_in_and_register/sign_page.dart';
import 'package:designedbyalla_ecotourism/screens/sign_in_and_register/sign_up_page.dart';
import 'package:designedbyalla_ecotourism/screens/steps_page/steps_page.dart';
import 'package:designedbyalla_ecotourism/screens/survey/survey_container_page.dart';
import 'package:designedbyalla_ecotourism/screens/survey/survey_page.dart';
import 'package:designedbyalla_ecotourism/screens/welcome_screen.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Strings.en = sharedPreferences.getBool('EN') ?? true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecotourism Demo',
      theme: ThemeData(
        backgroundColor: Color(0xFFEAECEF),
        fontFamily: 'Roboto',
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignPage.id: (context) => SignPage(),
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),
        ChooseLanguagePage.id: (context) => ChooseLanguagePage(),
        StepsPage.id: (context) => StepsPage(),
        ChooseAvatar.id: (contex) => ChooseAvatar(),
        SurveyPage.id: (context) => SurveyPage(),
        SurveyContainerPage.id: (context) => SurveyContainerPage(),
        ReturnPage.id: (context) => ReturnPage(),
        Ecotip1.id: (context) => Ecotip1(),
      },
    );
  }
}
