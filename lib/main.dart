import 'package:designedbyalla_ecotourism/screens/sign_page.dart';
import 'package:designedbyalla_ecotourism/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
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
      },
    );
  }
}
