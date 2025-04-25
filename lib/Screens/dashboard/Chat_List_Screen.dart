import 'package:flutter/material.dart';
import 'package:frontend/GlobalProvider/SocketIO.dart';
import 'package:frontend/components/chat_item.dart';
import 'package:frontend/components/my_app_bar.dart';
import 'package:frontend/controller/Chat_Controller.dart';
import 'package:frontend/controller/navigation_controller.dart';
import 'package:provider/provider.dart';

class ChatListScreen extends StatefulWidget {
  ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  String? email;

  @override
  void initState() {
    super.initState();

    // Access the provider without rebuilding the widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      email = Provider.of<NavigationController>(context, listen: false)
          .user
          ?.user_email;
      // Initialize socket connection
      Provider.of<SocketIO>(context, listen: false)
          .initializeSocket(email!, context);
    });
  }

  void assignEmail(String value) {
    setState(() {
      // socketIO?.sender = value;
      // print("User: ${socketIO?.sender}");
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: myAppBar(context),
      body: Container(
        color: Color(0xFF262626),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: mediaquery.width * 0.030),
              child: Text(
                "Chats",
                style: TextStyle(
                    fontSize: mediaquery.width * 0.09,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Consumer<ChatController>(
                builder: (context, provider, child) {
                  final chatKeys = provider.chatList.keys.toList() ?? [];
                  print(chatKeys);

                  return chatKeys.length > 0
                      ? ListView.builder(
                          itemCount: chatKeys.length,
                          itemBuilder: (context, index) {
                            return ChatListItem(context, chatKeys[index]);
                          },
                        )
                      : Center(
                          child: Text(
                            "No Chats",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
