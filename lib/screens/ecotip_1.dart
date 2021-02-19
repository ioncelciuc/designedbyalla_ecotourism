import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/screens/sign_in_and_register/sign_page.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Ecotip1 extends StatelessWidget {
  static const String id = 'Ecotip1';
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
                child: Container(
                  child: Image.asset('images/ecotip_1.png'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RoundedButton(
                      onPressed: () {
                        Toast.show(
                          'End of first part',
                          context,
                          duration: 2,
                        );
                      },
                      title: Strings.en ? Strings.enImReady : Strings.cnImReady,
                      textColor: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: RoundedButton(
                      onPressed: () async {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacementNamed(context, SignPage.id);
                      },
                      title: 'Log Out',
                      textColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
