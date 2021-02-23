import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designedbyalla_ecotourism/models/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Helper {
  Helper._privateConstructor();
  static final Helper _instance = Helper._privateConstructor();
  static Helper get instace => _instance;

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  void addUserInfo(UserInformation user) async {
    try {
      await _firestore.collection('userinfo').doc(user.uid).set({
        'uid': user.uid,
        'avatar': user.avatar,
        'ecopoints': 0,
        'last_daily_ecopoints': null,
        'ecosupply': 0,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<UserInformation> getCurrentUserInfo() async {
    UserInformation userModel = UserInformation();
    try {
      userModel.uid = _auth.currentUser.uid;
      final doc = await _firestore
          .collection('userinfo')
          .where('uid', isEqualTo: _auth.currentUser.uid)
          .get();
      userModel.avatar = doc.docs[0].data()['avatar'];
      userModel.ecopoints = doc.docs[0].data()['ecopoints'];
      userModel.lastDailyEcopoints = doc.docs[0].data()['last_daily_ecopoints'];
      userModel.ecosupply = doc.docs[0].data()['ecosupply'];
    } catch (e) {
      print(e);
    }
    return userModel;
  }

  Future<void> updateUserInfo(UserInformation user) async {
    try {
      await _firestore.collection('userinfo').doc(user.uid).update({
        'avatar': user.avatar,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> addUserSurveyResponse(
    String uid,
    int question,
    List<int> responses,
  ) async {
    try {
      await _firestore.collection('survey_response').doc(uid).set({
        'uid': uid,
        'question_0': responses[0],
        'question_1': responses[1],
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> addEcopoints(int ecopoints) async {
    UserInformation currentUser = await getCurrentUserInfo();
    try {
      await _firestore.collection('userinfo').doc(_auth.currentUser.uid).update({
        'ecopoints': currentUser.ecopoints + ecopoints,
        'last_daily_ecopoints': Timestamp.now(),
      });
    } catch (e) {
      print(e);
    }
  }
}
