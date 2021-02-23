import 'package:cloud_firestore/cloud_firestore.dart';

class UserInformation {
  String uid;
  int avatar = 1;
  int ecopoints = 0;
  Timestamp lastDailyEcopoints;
  int ecosupply = 0;

  UserInformation({
    this.uid,
    this.avatar,
    this.ecopoints,
    this.lastDailyEcopoints,
    this.ecosupply,
  });
}
