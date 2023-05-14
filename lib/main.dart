import 'package:bookbridge/view/home/homepage.dart';
import 'package:bookbridge/view/login_register/login.dart';
import 'package:flutter/material.dart';
import 'package:bookbridge/res/colors.dart';
import 'package:bookbridge/utils/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



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
          textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme,),
            primaryColor: white
        ),
        home: HomePage(),
        initialRoute: '/init',
        routes: {'/init': (context) => Login()},
    );
  }
}

