import 'package:flutter/material.dart';
import 'package:frontend/GlobalProvider/SocketIO.dart';
import 'package:frontend/components/buttons/back_button.dart';
import 'package:frontend/components/chat_widget.dart';
import 'package:frontend/components/text_field.dart';
import 'package:frontend/controller/Chat_Controller.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final String senderEmail;
  final String email;
  ChatScreen({super.key, required this.senderEmail, required this.email});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController user_input = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF262626),
          leading: back_button(context, Colors.white),
          title: Text(
            widget.email.toUpperCase().split("@")[0],
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<ChatController>(context, listen: false)
                      .deleteAllChats();
                  print("deleting");
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ))
          ],
        ),
        body: SafeArea(
            child: Column(
          children: [
            Flexible(
              child:
                  Consumer<ChatController>(builder: (context, provider, child) {
                return Container(
                  color: Color(0xFFEEEEEE),
                  child: provider.getChat(widget.email).isEmpty
                      ? Center(
                          child: Text(
                            "No messages yet",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        )
                      : ListView.builder(
                          itemCount:
                              provider.chatList['${widget.email}']!.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> message =
                                provider.chatList[widget.email]![index];

                            int decider =
                                message['sender'] == widget.senderEmail ? 0 : 1;
                            return ChatWidget(
                                name: message['sender'],
                                msg: message['message'],
                                chatIndex: decider);
                          },
                        ),
                );
              }),
            ),
            TextFieldWithSend(
                controller: user_input,
                email: widget.email,
                performOperation: () {
                  Provider.of<SocketIO>(context, listen: false).sendMessage(
                      user_input.text,
                      widget.senderEmail,
                      widget.email,
                      context);
                  // Provider.of<ChatController>(context, listen: false).addChat(widget.email, );
                  user_input.text = "";
                  FocusScope.of(context).unfocus();
                })
          ],
        )));
  }
}
