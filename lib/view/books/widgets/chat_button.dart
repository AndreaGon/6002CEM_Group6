import 'package:bookbridge/view_model/inbox_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../view_model/login_viewmodel.dart';
import '../../inbox/chat.dart';

class ChatButton extends StatefulWidget {
  ChatButton({Key? key, required this.bookModel, required this.uploadedBy}) : super(key: key);

  Map<String, dynamic> bookModel;
  String uploadedBy;

  @override
  State<ChatButton> createState() => _ChatButtonState();
}

class _ChatButtonState extends State<ChatButton> {
  InboxVM inboxVM = InboxVM();
  LoginVM loginVM = LoginVM();

  @override
  Widget build(BuildContext context) {
    String currentUserId = loginVM.getCurrentUserId();

    if(widget.uploadedBy != currentUserId){
      return InkWell(
        //chat button
          onTap: () async {
            Map<String, dynamic> chatModel = await inboxVM.findInbox(widget.bookModel["id"]);
            String currentUserId = await loginVM.getCurrentUserId();
            Map<String, dynamic> userInfo = await loginVM.getUserInformation(currentUserId);

            if(chatModel["status"] == 0) {
              await inboxVM.createNewInbox(widget.bookModel['lowercaseName'], widget.bookModel['uploaded_by'], widget.bookModel['id']);
              Map<String, dynamic> chatModel = await inboxVM.findInbox(widget.bookModel["id"]);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(chatModel: chatModel, userModel: userInfo)));
            }
            else{
              Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(chatModel: chatModel, userModel: userInfo)));
            }


          },
          child: Container(
              padding: const EdgeInsets.all(20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: darkbrown,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: const Offset(0, 6)),
                ],
              ),

              child: Row(
                  children: [
                    Icon(Icons.chat_bubble_outline, color: Colors.white,),
                    SizedBox(width: 100,),
                    Text("Chat", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ])
          )
      );
    }
    else {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text("You uploaded this book ", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
        ),
      );
    }
  }
}
