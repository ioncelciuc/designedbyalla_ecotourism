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
        'temperature': 7,
        'problem1': true,
        'problem2': true,
        'problem3': true,
        'problem4': true,
        'problem5': true,
      });

      await _firestore.collection('userinfo').doc(user.uid).update({
        'ecosuppliesAvailable': user.ecosuppliesAvailable,
        'missionsCompleted': user.missionsCompleted,
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
      userModel.temperature = doc.docs[0].data()['temperature'];
      userModel.problem1 = doc.docs[0].data()['problem1'];
      userModel.problem2 = doc.docs[0].data()['problem2'];
      userModel.problem3 = doc.docs[0].data()['problem3'];
      userModel.problem4 = doc.docs[0].data()['problem4'];
      userModel.problem5 = doc.docs[0].data()['problem5'];
      userModel.ecosuppliesAvailable =
          doc.docs[0].data()['ecosuppliesAvailable'];
      userModel.missionsCompleted = doc.docs[0].data()['missionsCompleted'];
    } catch (e) {
      print(e);
    }
    return userModel;
  }

  Future<void> updateUserInfo(UserInformation user) async {
    try {
      await _firestore.collection('userinfo').doc(user.uid).update({
        'ecopoints': user.ecopoints,
        'ecosupply': user.ecosupply,
        'avatar': user.avatar,
        'problem1': user.problem1,
        'problem2': user.problem2,
        'problem3': user.problem3,
        'problem4': user.problem4,
        'problem5': user.problem5,
        'temperature': user.temperature,
        'ecosuppliesAvailable': user.ecosuppliesAvailable,
        'missionsCompleted': user.missionsCompleted,
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
      await _firestore
          .collection('userinfo')
          .doc(_auth.currentUser.uid)
          .update({
        'ecopoints': currentUser.ecopoints + ecopoints,
        'last_daily_ecopoints': Timestamp.now(),
      });
    } catch (e) {
      print(e);
    }
  }
}
