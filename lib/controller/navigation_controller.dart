import 'package:flutter/material.dart';
import 'package:frontend/Screens/dashboard/Chat_List_Screen.dart';
import 'package:frontend/Screens/dashboard/New_Chat_Screen.dart';
import 'package:frontend/Screens/dashboard/Settings_Screen.dart';
import 'package:frontend/model/User_Model.dart';

class NavigationController extends ChangeNotifier {
  int _selectedIndex = 0;
  UserModel? user;

  List<String> settings = [
    'Account Info',
    'Email',
    'Password',
    'Chats',
  ];

  List<Widget> get screens {
    return [
      ChatListScreen(),
      NewChatScreen(),
      SettingsScreen(),
    ];
  }

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void saveUserModel(UserModel data) {
    user = data;
    notifyListeners();
  }
}
