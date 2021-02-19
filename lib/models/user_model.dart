import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String email;
  String username;
  int avatar = 1;
  int ecopoints = 0;
  Timestamp lastDailyEcopoints;

  UserModel({this.uid, this.email, this.username, this.avatar, this.ecopoints, this.lastDailyEcopoints});

  @override
  String toString() {
    return '{\n\'uid\' : ${this.uid},\n\'email\' : ${this.email},\n\'username\' : ${this.username},\n\'avatar\' : ${this.avatar},\n}';
  }
}
