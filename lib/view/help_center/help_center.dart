import 'package:flutter/material.dart';
import 'package:bookbridge/res/colors.dart';
class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background_1.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: null,
          body: new Container(
              margin: new EdgeInsets.all(15.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/contact.png'),
                  new Text("Help Center",
                      style: TextStyle(height: 5, fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold)),
                  new Text("Contact us if you faced any problem",
                      style: TextStyle(height: 1, fontSize: 20, color: Colors.black)),
                  new Container(
                    margin: EdgeInsets.all(30),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        new Icon(Icons.phone),
                        SizedBox(width: 5),
                        new Text("+60112578791", style: TextStyle(height: 0, fontSize: 20, color: Colors.black)),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        new Icon(Icons.email),
                        SizedBox(width: 5),
                        new Text("bookbridge@gmail.com", style: TextStyle(height: 2, fontSize: 20, color: Colors.black))
                      ],
                    ),
                  )


                ],
              )
          )
      )
    );
  }
  
}