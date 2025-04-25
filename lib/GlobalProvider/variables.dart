import 'package:flutter/material.dart';

class Variables with ChangeNotifier {
  String userExistInCHATWAVE = "";
  bool save = false;
  String friend_email = "";
  String user_email = "";

  void checkIfEmailIsInDB(String message, String email) {
    this.friend_email = email;
    this.userExistInCHATWAVE = message;
    changeSave(message);
    notifyListeners();
  }

  void changeSave(String message) {
    if (message == 'This User Is Available On CHATWAVE') {
      this.save = true;
    } else {
      this.save = false;
    }
    notifyListeners();
  }

  void saveUserEmail(String? email) {
    this.user_email = email!;
    notifyListeners();
  }

  void nullTheValues() {
    this.friend_email = "";
    this.save = false;
    this.userExistInCHATWAVE = "";
    notifyListeners();
  }
}
