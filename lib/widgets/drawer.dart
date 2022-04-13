import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/usersdetails.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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

    late Future<UserDetails> drawerUserDetails;

    Future<UserDetails> getDrawerApi() async {
      final response = await http.get(Uri.parse(
          "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/consigneedata?username=c1001"));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return UserDetails.fromJson(data);
      } else {
        throw Exception('Failed to API');
      }
    }

    @override
    void initState() {
      super.initState();
      drawerUserDetails = getDrawerApi();
    }

    return Drawer(
      child: Container(
        padding: EdgeInsets.zero,
        color: Colors.orange[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: FutureBuilder(
                    future: getDrawerApi(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return UserAccountsDrawerHeader(
                          margin: EdgeInsets.zero,
                          accountName: Text(snapshot.data.contactperson,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          accountEmail: Text(
                            snapshot.data.email,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          currentAccountPicture: const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/profile.png"),
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    })),
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
