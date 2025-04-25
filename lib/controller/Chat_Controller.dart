import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatController with ChangeNotifier {
  static final ChatController _instance = ChatController._internal();
  factory ChatController() => _instance;

  ChatController._internal();

  Map<String, List<Map<String, dynamic>>> chatList = {};

  Future<void> initialize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? chatData = prefs.getString('chatList');
    if (chatData != null) {
      chatList =
          Map<String, List<Map<String, dynamic>>>.from(jsonDecode(chatData));
    }
    notifyListeners();
  }

  Map<String, List<Map<String, dynamic>>> getChatList() {
    notifyListeners();
    return chatList;
  }

  List<Map<String, dynamic>> getChat(String friendId) {
    // notifyListeners();
    return chatList[friendId] ?? [];
  }

  void addChat(String friendId, Map<String, dynamic> message) {
    if (!chatList.containsKey(friendId)) {
      chatList[friendId] = [];
    }
    chatList[friendId]!.add(message);
    saveChats();
    notifyListeners();
  }

  Future<void> saveChats() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('chatList', jsonEncode(chatList));
  }

  void deleteAllChats() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    chatList = {};
    await prefs.remove("chatList");
    notifyListeners();
  }
}
