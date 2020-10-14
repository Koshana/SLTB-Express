import 'package:flutter/material.dart';
import 'package:sltb/Models/ChatBubbleModel.dart';
import 'package:sltb/Models/CommonModel.dart';
import 'package:sltb/Views/Footer.dart';
import 'package:sltb/Views/Header.dart';

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Widget> messageBubbles = [];

  @override
  Widget build(BuildContext context) {
    initializeChat();

    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.14), BlendMode.dstATop),
            image: AssetImage("assets/images/background.png"),
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Header.getHeader(context),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: CommonModel.displayWidth * 0.08,
                            right: CommonModel.displayWidth * 0.08),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: messageBubbles,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Footer.getChatFooter(context),
          ],
        ),
      ),
    ));
  }

  void initializeChat() {
    messageBubbles.add(getMessageContainer(ChatBubbleModel(
        id: 1, message: "Is the presentations are", type: 1, person: 'BATA')));
    messageBubbles.add(getMessageContainer(ChatBubbleModel(
        id: 1, message: "Yes, I Had", type: 2, person: 'BATA')));
    messageBubbles.add(getMessageContainer(ChatBubbleModel(
        id: 1, message: "Sent it before the", type: 1, person: 'BATA')));
    messageBubbles.add(getMessageContainer(ChatBubbleModel(
        id: 1, message: "Yes, I Had", type: 2, person: 'BATA')));
    messageBubbles.add(getMessageContainer(ChatBubbleModel(
        id: 1,
        message:
            "Sent it before the  Sent it before the ok fine thnx Sent it before the ok fine thnx",
        type: 1,
        person: 'BATA')));
  }

  getMessageContainer(ChatBubbleModel chatBubbleModel) {
    return Align(
      alignment:
          (chatBubbleModel.type == 1) ? Alignment.topLeft : Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
                minWidth: 100, maxWidth: CommonModel.displayWidth * 0.5),
            margin: EdgeInsets.all(0.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border: Border.all(
                  color:
                      (chatBubbleModel.type == 2) ? Colors.blue : Colors.grey,
                ),
                color: (chatBubbleModel.type == 2) ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: SizedBox(
              child: Text(
                chatBubbleModel.message + ' - ' + chatBubbleModel.person,
                style: TextStyle(
                    color: (chatBubbleModel.type == 2)
                        ? Colors.white
                        : Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
