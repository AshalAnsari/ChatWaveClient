class UserModel {
  String username;
  String user_email;
  String password;

  UserModel(
      {required this.user_email,
      required this.username,
      required this.password});

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
        user_email: data['Email'],
        username: data['Username'],
        password: data['Password']);
  }

  Map<String, dynamic> toJson() {
    return {'Username': username, 'Email': user_email, 'Password': password};
  }
}
