import 'package:flutter/material.dart';
import 'package:transvision_app1/Screen/bookingscreen/bokigdtls.dart';
import 'package:transvision_app1/utils/routes.dart';

import '../MyComponent/text.dart';
import '../widgets/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(
              onPressed: () async{
                await Future.delayed(const Duration(seconds: 1));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: NormalText(
                        text: "Please Wait while we are Logout",
                        size: 12.0,
                        color: Colors.black)));
                Navigator.popAndPushNamed(context, MyRoutes.loginRoute);
              },
              icon: const Icon(Icons.power_settings_new)),
        ],
        backgroundColor: Colors.orange[300],
        title: const WeightText(
          text: "All Records",
          size: 20.0,
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: SafeArea(child:
          ListView.builder(
              itemCount:8,itemBuilder: (BuildContext context, int index) {
        return const Card(
          child: ListTile(
            title: Text("Abdul"),
            leading: Icon(Icons.list),
            trailing: Text(
              "All record",
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
            style: ListTileStyle.list,
          ),
        );
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const BookingDetails()));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.library_books),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
