import 'package:flutter/material.dart';
import 'package:frontend/components/chat_item.dart';
import 'package:frontend/controller/User_Controller.dart';
import 'package:frontend/controller/navigation_controller.dart';
import 'package:provider/provider.dart';

class NewChatScreen extends StatefulWidget {
  const NewChatScreen({super.key});

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Access providers after the widget has been fully initialized
      String email = Provider.of<NavigationController>(context, listen: false)
          .user!
          .user_email;
      Provider.of<UserController>(context, listen: false)
          .fetch_user_friends(email, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF262626),
        title: Center(
          child: Text(
            "Friends",
            style: TextStyle(
                color: Colors.white, fontSize: mediaquery.width * 0.07),
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 29, 29, 29),
        child: Consumer<UserController>(
          builder: (context, provider, child) {
            return provider.friends.length > 0
                ? ListView.builder(
                    itemCount: provider.friends.length,
                    itemBuilder: (context, index) {
                      return ChatListItem(context, provider.friends[index]);
                    })
                : Center(
                    child: Text("You Don't Have Friends"),
                  );
          },
        ),
      ),
    );
  }
}
