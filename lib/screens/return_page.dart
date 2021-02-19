import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designedbyalla_ecotourism/components/rounded_button.dart';
import 'package:designedbyalla_ecotourism/constants.dart';
import 'package:designedbyalla_ecotourism/models/user_model.dart';
import 'package:designedbyalla_ecotourism/screens/ecotip_1.dart';
import 'package:designedbyalla_ecotourism/services/helper.dart';
import 'package:designedbyalla_ecotourism/strings.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ReturnPage extends StatefulWidget {
  static const String id = 'ReturnPage';
  @override
  _ReturnPageState createState() => _ReturnPageState();
}

class _ReturnPageState extends State<ReturnPage> {
  Future<void> initialization() async {
    UserModel user = await Helper.instace.getCurrentUserInfo();
    if (user.lastDailyEcopoints == null) {
      Strings.firstTimeClaimingEcopoints = true;
    } else {
      Strings.firstTimeClaimingEcopoints = false;
      DateTime now = Timestamp.now().toDate();
      DateTime lastClaim = user.lastDailyEcopoints.toDate();
      if (now.difference(lastClaim).inDays < 1) {
        Navigator.pushReplacementNamed(context, Ecotip1.id);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Strings.firstTimeClaimingEcopoints = false;
    initialization();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialization(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
                      child: Card(
                        elevation: 10,
                        shape: roundedRectangleBorder(radius: 30),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                Strings.firstTimeClaimingEcopoints
                                    ? (Strings.en
                                        ? Strings.enOnGoodPath
                                        : Strings.cnOnGoodPath)
                                    : (Strings.en
                                        ? Strings.enGoodToSeeYouBack
                                        : Strings.cnGoodToSeeYouBack),
                                style: TextStyle(fontSize: 24),
                                textAlign: TextAlign.center,
                              ),
                              Image.asset('images/ecopoints.png'),
                              Text(
                                '+${Strings.firstTimeClaimingEcopoints ? 20 : 10} ${Strings.en ? Strings.enEcopoints : Strings.cnEcopoints}',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange[300],
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                Strings.firstTimeClaimingEcopoints
                                    ? (Strings.en
                                        ? Strings.enReturnPageCongrats1
                                        : Strings.cnReturnPageCongrats1)
                                    : (Strings.en
                                        ? Strings.enReturnPageCongrats2
                                        : Strings.cnReturnPageCongrats2),
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                      child: RoundedButton(
                        title: Strings.en ? Strings.enClaim : Strings.cnClaim,
                        textColor: Colors.black,
                        onPressed: () async {
                          await Helper.instace.addDailyEcopoints();
                          // if (Strings.firstTimeClaimingEcopoints) {
                          //   await Helper.instace.addDailyEcopoints(20);
                          //   SharedPreferences sharedPreference =
                          //       await SharedPreferences.getInstance();
                          //   sharedPreference.setBool('FIRST_TIME_ECOPOINTS', false);
                          // } else {
                          //   await Helper.instace.addDailyEcopoints(10);
                          // }
                          Navigator.pushReplacementNamed(context, Ecotip1.id);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: ModalProgressHUD(
              inAsyncCall: true,
              child: Container(
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }
}
