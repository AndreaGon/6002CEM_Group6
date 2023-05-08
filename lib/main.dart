import 'package:flutter/material.dart';
import 'package:bookbridge/res/colors.dart';
import 'package:bookbridge/utils/router.dart';
void main() {
  runApp(const BookBridge());
}

class BookBridge extends StatelessWidget {
  const BookBridge({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Book Bridge',
        onGenerateRoute: MainRouter.generateRoute,
        theme: ThemeData(
            primaryColor: white
        ),
        initialRoute: '/helpcenter'
    );
  }
}
