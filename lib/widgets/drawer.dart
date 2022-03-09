import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> screen = {
      'Do Slip': {
        'routes': '/ds',
        'icon': const Icon(
          Icons.collections_bookmark_rounded,
          color: Colors.black,
          size: 25.0,
        )
      },
      'Bill Of Landing': {
        'routes': '/bfl',
        'icon': const Icon(
          Icons.adf_scanner,
          color: Colors.black,
          size: 25.0,
        ),
      },
      'Bill Summary': {
        'routes': '/bs',
        'icon': const Icon(
          Icons.summarize_rounded,
          color: Colors.black,
          size: 25.0,
        ),
      },
      'Loading List': {
        'routes': '/ll',
        'icon': const Icon(
          Icons.library_books_sharp,
          color: Colors.black,
          size: 25.0,
        ),
      },
      'Report': {
        'routes': '/reports',
        'icon': const Icon(
          Icons.report_rounded,
          color: Colors.black,
          size: 25.0,
        ),
      },
      'Quotes': {
        'routes': '/rate',
        'icon': const Icon(
          Icons.bookmark_added_rounded,
          color: Colors.black,
          size: 25.0,
        ),
      },
    };

    return Drawer(
      child: Container(
        padding: EdgeInsets.zero,
        color: Colors.orange[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Customer Name",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  accountEmail: Text(
                    "Customer Email Id",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                )),
            ...screen.entries.map((screen) {
              return ListTile(
                leading: screen.value['icon'],
                title: Text(
                  screen.key,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.pushNamed(context, screen.value['routes']);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
