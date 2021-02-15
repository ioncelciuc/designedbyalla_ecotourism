import 'package:designedbyalla_ecotourism/screens/part1/choose_language_page.dart';
import 'package:designedbyalla_ecotourism/screens/sign_in_and_register/sign_in_page.dart';
import 'package:designedbyalla_ecotourism/screens/sign_in_and_register/sign_page.dart';
import 'package:designedbyalla_ecotourism/screens/sign_in_and_register/sign_up_page.dart';
import 'package:designedbyalla_ecotourism/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecotourism Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignPage.id: (context) => SignPage(),
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),
        ChooseLanguagePage.id: (context) => ChooseLanguagePage(),
      },
    );
  }
}
