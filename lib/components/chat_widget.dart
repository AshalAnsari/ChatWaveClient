import 'package:flutter/material.dart';
import 'package:frontend/components/text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {super.key,
      required this.msg,
      required this.chatIndex,
      required this.name,
      this.shouldAnimate = false});

  final String msg;
  final String name;
  final int chatIndex;
  final bool shouldAnimate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? Color(0xFF343541) : Color(0xFF444654),
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Align(
              alignment:
                  chatIndex == 0 ? Alignment.centerRight : Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: chatIndex == 0
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: chatIndex == 0
                    ? [
                        // User's message aligned to the right
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Expanded(
                            //   child:
                            TextWidget(
                              label: msg,
                            ),
                            // ),
                            SizedBox(
                              width: 9,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.yellow,
                              child: Text(
                                name.toUpperCase().substring(0, 2),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        )
                      ]
                    : [
                        // Chatbot's message aligned to the left
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Text(
                            name.toUpperCase().substring(0, 2),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Text(
                            msg.trim(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
