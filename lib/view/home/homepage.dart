import 'package:bookbridge/res/colors.dart';
import 'package:bookbridge/res/widgets/navigation.dart';
import 'package:bookbridge/utils/router.dart';
import 'package:bookbridge/view/help_center/help_center.dart';
import 'package:flutter/material.dart';

import '../../view_model/books_viewmodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BooksVM viewModel = BooksVM();

  @override
  void initState() {
    //viewModel.fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background_3.png"), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,

            //top bar with side menu and chat icon
            appBar: AppBar(
              title: null,
              backgroundColor: white,
              elevation: 0,
              iconTheme: IconThemeData(color: darkbrown),
              actions: <Widget> [
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},
                      child: Icon(Icons.chat_outlined,),
                    )
                ),
              ]
              ),

            //list tile of side menu
            drawer: SideNavigation(),

            //Page content
            body: Container(
              margin: EdgeInsets.all(25.0),
              child: Column(
                children: <Widget> [

                //Page title
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text("HOME", textAlign: TextAlign.left, style: TextStyle(fontSize: 36, color: darkbrown, fontWeight: FontWeight.bold)),
                  ),
                ),

                //Underline
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(margin: EdgeInsets.fromLTRB(0, 10, 0, 10), height:2.0, width:160, color:darkbrown, alignment: Alignment.centerLeft),
                ),

                //Search box
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),

                    child: TextField(
                      // controller: _searchController,
                      decoration: InputDecoration(hintText: 'Search...', border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

                        //Search button
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: (){}, //=> _searchController(),
                        ),
                      ),
                    ),
                  ),
                ),

                Center(
                  child: MergeSemantics(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Material(
                                  color: Colors.white,
                                  elevation: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(

                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/applogo.png"))),
                                    ),


                                ),

                              //   Padding(
                              //       padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                              //       child: Column(
                              //         crossAxisAlignment: CrossAxisAlignment.stretch,
                              //         children: <Widget>[
                              //           TextField(
                              //             decoration: InputDecoration(
                              //               labelText: "Email",
                              //               hintText: "example@mail.com",
                              //             ),
                              //             autofocus: true,
                              //           ),
                              //           TextField(
                              //             decoration: InputDecoration(
                              //               labelText: "Password",
                              //             ),
                              //             autofocus: true,
                              //           ),
                              //           SizedBox(
                              //             width: double.infinity,
                              //             height: 100,
                              //             // child: new RaisedButton(
                              //             //   color: Colors.blue,
                              //             //   child: Text(
                              //             //     "Sign In",
                              //             //     style: TextStyle(
                              //             //       color: Colors.white,
                              //             //       fontFamily: 'Raleway',
                              //             //       fontSize: 22.0,
                              //             //     ),
                              //             //   ),
                              //             //   onPressed: () => print('Sign In'),
                              //             // ),
                              //           )
                              //         ],
                              //       )),
                                )],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )


                // Align(
                //   alignment: Alignment.center,
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     children: [
                //       Card(
                //           elevation: 0,
                //           shape: RoundedRectangleBorder(
                //               side: BorderSide(color: Theme.of(context).colorScheme.outline),
                //               borderRadius: const BorderRadius.all(Radius.circular(12))
                //           ),
                //         child: Row(
                //           mainAxisSize: MainAxisSize.max,
                //           children: [
                //             SizedBox(
                //               //width: 200,
                //               child: Center(child: Text('Outlined Card')),
                //             )
                //
                //           ],
                //
                //           ),
                //         ),
                //
                //
                //
                //
                //
                //
                //     ],
                //   ),
                //
                // ),

                //Book List
                // Row(
                //   mainAxisSize: MainAxisSize.max,
                //   children: <Widget> [
                //     Container(
                //       margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                //
                //
                //     )
                //   ],
                // )

                // Align(
                //   alignment: Alignment.center,
                //     //background card
                //     child: Row(
                //         mainAxisSize: MainAxisSize.max,
                //         children: <Widget> [
                //           Container(
                //               margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                //
                //               // child: Align(
                //               // alignment: Alignment.center,
                //               //   child: Container(
                //               //       width: 200,
                //               //       decoration: const BoxDecoration(
                //               //           image: DecorationImage(
                //               //               image: AssetImage("assets/applogo.png"), fit: BoxFit.cover)
                //               //       )
                //               //   ),
                //               // )
                //
                //
                //
                //           )
                //         ]
                //
                //
                //
                //
                //
                //     )
                //
                //
                //
                //
                //
                // ),






                ]
              )
            )
        )
    );
  }

// Widget _getUsersListView(List<User>? users) {
//   return ListView.builder(
//       itemCount: users?.length,
//       itemBuilder: (context, position) {
//         return _getUserListItem(users![position]);
//       });
// }

// Widget _getUserListItem(User item) {
//   return Card(
//     shape: RoundedRectangleBorder(
//         side: BorderSide(color: Colors.grey, width: 1.0),
//         borderRadius: BorderRadius.all(Radius.circular(10))),
//     child: ListTile(
//       // leading: ClipRRect(
//       //   child: Image.network(
//       //     item.imagePath ?? "",
//       //     errorBuilder: (context, error, stackTrace) {
//       //       return Image.asset('assets/images/error.png');
//       //     },
//       //     fit: BoxFit.fill,
//       //     width: context.resources.dimension.listImageSize,
//       //     height: context.resources.dimension.listImageSize,
//       //   ),
//       //   borderRadius: BorderRadius.circular(
//       //       context.resources.dimension.imageBorderRadius),
//       // ),
//       title: MyTextView(label: item.name ?? "NA"),
//       subtitle: Column(children: [
//         Align(
//           alignment: Alignment.centerLeft,
//           child: MyTextView(label: item.note ?? "NA"),
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: MyTextView(label: item.phone ?? "NA"),
//         ),
//       ]),
//       onTap: () {
//         _goToDetailScreen(context, item);
//       },
//     ),
//     elevation: context.resources.dimension.lightElevation,
//   );
// }

//   void _goToDetailScreen(BuildContext context, User item) {
//     Navigator.pushNamed(context, UserDetailsScreen.id, arguments: item);
//   }
}
