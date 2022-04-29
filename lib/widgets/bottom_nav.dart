import 'package:flutter/material.dart';
import 'package:transvision_app1/BottomScreen/address.dart';
import 'package:transvision_app1/BottomScreen/all_record.dart';
import 'package:transvision_app1/BottomScreen/contacted_person.dart';
import 'package:transvision_app1/Screen/loginScreen/reset_password.dart';

class MyNavigation extends StatefulWidget {
  const MyNavigation({Key? key}) : super(key: key);

  @override
  State<MyNavigation> createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  int currentIndex = 0;
  final screen = [
    const Home(),
    const AddressPage(),
    const ContactedPerson(),
    const ResetPassword(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screen[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          // backgroundColor: Colors.orange[300],
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.white60,
          showUnselectedLabels: false,
          iconSize: 25.0,
          elevation: 0.0,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.assignment_sharp),
                label: "All Record",
                backgroundColor: Colors.orange[300]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.add_business_sharp),
                label: "Address",
                backgroundColor: Colors.orange[300]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.people_outline_sharp),
                label: "Contacted Person",
                backgroundColor: Colors.orange[300]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.lock),
                label: "Change Password",
                backgroundColor: Colors.orange[300]),
          ],
        ));
  }
}
