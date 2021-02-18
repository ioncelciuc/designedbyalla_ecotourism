class UserModel {
  String uid;
  String email;
  String username;
  int avatar = 1;

  UserModel({this.uid, this.email, this.username, this.avatar});

  @override
  String toString() {
    return '{\n\'uid\' : ${this.uid},\n\'email\' : ${this.email},\n\'username\' : ${this.username},\n\'avatar\' : ${this.avatar},\n}';
  }
}
