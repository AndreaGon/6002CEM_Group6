import 'package:bookbridge/res/colors.dart';
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
            appBar: AppBar(
              title: null,
              backgroundColor: white,
              elevation: 0,
              iconTheme: IconThemeData(color: darkbrown),
              actions: <Widget> [
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.chat_outlined,
                        size: 26.0,
                      ),
                    )
                ),
              ]
              ),

            body: Center(
              child: Text("HOME", style: TextStyle(fontSize: 20, color: Colors.white)),
            ),

            drawer: Container(
              child: Drawer(
                  child: ListView(padding: const EdgeInsets.all(0), children: [
                const DrawerHeader(
                    decoration: BoxDecoration(color: white),
                    //BoxDecoration
                    child: Image(
                        image: AssetImage("assets/applogo.png"),
                        height: 20,
                        width: 20)),
                ListTile(
                  tileColor: darkbrown,
                  leading: const Icon(Icons.person),
                  iconColor: Colors.white,
                  title: const Text(' Home ',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  tileColor: darkbrown,
                  leading: const Icon(Icons.book),
                  iconColor: Colors.white,
                  title: const Text(' My Books ',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  tileColor: darkbrown,
                  leading: const Icon(Icons.person_outlined),
                  iconColor: Colors.white,
                  title: const Text(' Profile ',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  tileColor: darkbrown,
                  leading: const Icon(Icons.help),
                  iconColor: Colors.white,
                  title: const Text(' Help ',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  tileColor: darkbrown,
                  leading: const Icon(Icons.logout),
                  iconColor: Colors.white,
                  title: const Text(' Sign Out ',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    },
                ),
                  ]
                  )
              ),
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
