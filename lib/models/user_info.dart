import 'package:cloud_firestore/cloud_firestore.dart';

class UserInformation {
  String uid;
  int avatar = 1;
  int ecopoints = 0;
  Timestamp lastDailyEcopoints;
  int ecosupply = 0;
  int temperature = 7;
  bool problem1 = true;
  bool problem2 = true;
  bool problem3 = true;
  bool problem4 = true;
  bool problem5 = true;

  UserInformation({
    this.uid,
    this.avatar,
    this.ecopoints,
    this.lastDailyEcopoints,
    this.ecosupply,
    this.temperature,
    this.problem1,
    this.problem2,
    this.problem3,
    this.problem4,
    this.problem5,
  });
}
