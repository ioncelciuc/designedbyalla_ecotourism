import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/screens/return_page.dart';
import 'package:flutter/material.dart';

class SurveyContainerPage extends StatefulWidget {
  static const String id = 'SurveyContainerPage';
  @override
  _SurveyContainerPageState createState() => _SurveyContainerPageState();
}

class _SurveyContainerPageState extends State<SurveyContainerPage> {
  int container = 0;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'images/logo.png',
                height: 70,
              ),
              SizedBox(height: 16),
              Expanded(
                child: Image.asset(
                  container == 0
                      ? 'images/survey_container_1.png'
                      : 'images/survey_container_2.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 64),
                child: RoundedButton(
                  title: 'Next',
                  textColor: Colors.black,
                  onPressed: () {
                    print(container);
                    if (container == 0) {
                      setState(() {
                        container = 1;
                      });
                    } else {
                      Navigator.pushReplacementNamed(context, ReturnPage.id);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
