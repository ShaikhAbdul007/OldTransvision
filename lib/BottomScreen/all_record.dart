import 'package:flutter/material.dart';
import 'package:transvision_app1/Screen/bookingscreen/bokigdtls.dart';

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
              onPressed: () {}, icon: const Icon(Icons.power_settings_new)),
        ],
        backgroundColor: Colors.orange[300],
        title: const Text("All Records"),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: SafeArea(child:
          ListView.builder(itemBuilder: (BuildContext context, int index) {
        return const Card(
          child: ListTile(
            title: Text("Abdul"),
            leading: Icon(Icons.list),
            trailing: Text(
              "All record",
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
          ),
        );
      })),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
        height: 50,
        width: 120,
        child: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const BookingDetails()));
            },
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.add_box_rounded),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "Booking",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                )
              ],
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)))),
      ),
      drawer: const MyDrawer(),
    );
  }
}
