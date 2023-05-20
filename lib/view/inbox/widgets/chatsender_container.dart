import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/colors.dart';

class ChatSenderContainer extends StatelessWidget {
  ChatSenderContainer({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width - 150,
          decoration: BoxDecoration(
            color: light,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: new Column(
            children: [
              Container(

                  child: Align(
                    alignment: Alignment.topLeft,
                    child: new Text(message,
                        style: TextStyle(height: 2, fontSize: 15, color: darkbrown)),
                  )
              ),
            ],

          )
      ),
    );
  }
}
