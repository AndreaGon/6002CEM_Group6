import 'package:flutter/material.dart';

import '../../../view_model/chats_viewmodel.dart';

class ImageModal extends StatelessWidget {
  const ImageModal({Key? key, required this.docId, required this.sender}) : super(key: key);

  final String docId;
  final String sender;

  @override
  Widget build(BuildContext context) {
    ChatsVM chatsVM = ChatsVM();

    return SafeArea(
      child: Container(
        child: new Wrap(
          children: <Widget>[
            new ListTile(
                leading: new Icon(Icons.photo_library),
                title: new Text('Gallery'),
                onTap: () {
                  chatsVM.getImageFromPhone(docId, sender, false);
                  Navigator.of(context).pop();
                }),
            new ListTile(
              leading: new Icon(Icons.photo_camera),
              title: new Text('Camera'),
              onTap: () {
                chatsVM.getImageFromPhone(docId, sender, true);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}


