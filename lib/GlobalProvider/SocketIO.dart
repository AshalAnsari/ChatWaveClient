import 'package:flutter/material.dart';
import 'package:frontend/controller/Chat_Controller.dart';
import 'package:frontend/controller/navigation_controller.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIO with ChangeNotifier {
  IO.Socket? socket;
  late String sender;
  List<Map<String, dynamic>> messages = [];

  void initializeSocket(String email, BuildContext context
      // Function assignEmail,
      ) async {
    if (email.isNotEmpty) {
      print("In Initialization ");
      if (socket == null || !socket!.connected) {
        print("1st Socket execution");
        socket = IO.io("http://10.0.2.2:8000", <String, dynamic>{
          "transports": ['websocket'],
          'autoConnect': false,
        });
        socket!.connect();
      }

      socket!.onConnect((_) {
        print("A new user has been established ${email}");

        socket!.emit('userConnected', email);
      });

      socket!.onDisconnect((_) {
        print("A user has been disconnected ${socket!.id}");
        // socket!.emit('userDisconnected', email);
      });

      socket!.off('msg');
      socket!.on('msg', (data) {
        print("firing in");
        if (data is Map<String, dynamic> && data.containsKey('recipient')) {
          if (data['recipient'] == socket!.id) {
            saveMessage(
                data['message'], data['sender'], data['recipient'], context);
          } else {
            print("Message was not for this sender.");
          }
        } else {
          print("Data received is not in the expected format or missing keys.");
        }
      });

      socket!.on('pendingmessages', (data) {
        if (data is Map<String, dynamic>) {
          print("Pending Messages: ${data}");
        }
      });

      socket!.onError((error) {
        print("Socket error: $error");
      });

      socket!.onConnectError((error) {
        print("Socket connection error: $error");
      });

      socket!.onReconnect((attempt) {
        print("Reconnected after $attempt attempts");
        socket!.emit('userConnected', email);
      });
    }
  }

  void sendMessage(
      String message, String senderEmail, String email, BuildContext context) {
    if (socket != null && socket!.connected) {
      // print("In sendMessage");
      saveMessage(message, senderEmail, email, context);
      socket!.emit('message', <String, dynamic>{
        'sender': senderEmail,
        'recipient': email,
        'message': message
      });
      print("message $senderEmail, $email, $message");
    } else {
      print("Socket is not connected or initialized. Message cannot be sent.");
      // Optionally, handle reconnection logic here
    }
  }

  void saveMessage(
      String message, String senderEmail, String email, BuildContext context) {
    // print("Saving message ${message}");
    int decider = 0;
    if (!email.contains("@")) {
      email = Provider.of<NavigationController>(context, listen: false)
          .user!
          .user_email;
      decider = 1;
    }
    Map<String, dynamic> newMessage = {
      'sender': senderEmail,
      'reciever': email,
      'message': message
    };

    Provider.of<ChatController>(context, listen: false)
        .addChat(decider == 0 ? email : senderEmail, newMessage);
    messages.add(newMessage);
    notifyListeners();
  }
}
