import 'package:flutter/material.dart';

import 'package:bookbridge/view/help_center/help_center.dart';


class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/helpcenter':
        return MaterialPageRoute(builder: (_)=> HelpCenter());
      default:
        return MaterialPageRoute(builder: (_)=> HelpCenter());
    }
  }
}