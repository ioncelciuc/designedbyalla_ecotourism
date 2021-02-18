import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designedbyalla_ecotourism/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Helper {
  Helper._privateConstructor();
  static final Helper _instance = Helper._privateConstructor();
  static Helper get instace => _instance;

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  void addUserInfo(UserModel userModel) async {
    try {
      await _firestore.collection('userinfo').doc(userModel.uid).set({
        'uid': userModel.uid,
        'email': userModel.email,
        'username': userModel.username,
        'avatar': userModel.avatar,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<UserModel> getCurrentUserInfo() async {
    UserModel userModel = UserModel();
    try {
      userModel.uid = _auth.currentUser.uid;
      userModel.email = _auth.currentUser.email;
      final doc = await _firestore
          .collection('userinfo')
          .where('uid', isEqualTo: _auth.currentUser.uid)
          .get();
      userModel.username = doc.docs[0].data()['username'];
      userModel.avatar = doc.docs[0].data()['avatar'];
    } catch (e) {
      print(e);
    }
    print(userModel.toString());
    return userModel;
  }

  Future<void> updateUserInfo(UserModel userModel) async {
    try {
      await _firestore.collection('userinfo').doc(userModel.uid).update({
        'username': userModel.username,
        'avatar': userModel.avatar,
      });
    } catch (e) {
      print(e);
    }
  }
}
