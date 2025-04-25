import 'package:flutter/material.dart';
import 'package:frontend/Screens/dashboard/Chat_Screen.dart';
import 'package:frontend/controller/navigation_controller.dart';
import 'package:provider/provider.dart';

Widget ChatListItem(BuildContext context, String? email) {
  var mediaquery = MediaQuery.sizeOf(context);
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatScreen(
                    senderEmail: Provider.of<NavigationController>(context,
                            listen: false)
                        .user!
                        .user_email,
                    email: email!,
                  )));
    },
    child: Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 58, 53, 53),
          border: Border(bottom: BorderSide(width: 2, color: Colors.black))),
      child: ListTile(
        key: ValueKey(email),
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
        ),
        title: Text(
          "${email.toString().split("@")[0]}",
          style:
              TextStyle(color: Colors.white, fontSize: mediaquery.width * 0.05),
        ),
        subtitle: Text(
          "Message",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.white,
        ),
      ),
    ),
  );
}
