import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/constant/colors.dart';
import 'package:transvision_app1/Screen/drawerScreen.dart/BillOfLanding/detailscreen.dart';
import 'package:transvision_app1/Screen/drawerScreen.dart/BillOfLanding/homescreen.dart';

class BillOfLading extends StatefulWidget {
  const BillOfLading({Key? key}) : super(key: key);

  @override
  State<BillOfLading> createState() => _BillOfLadingState();
}

class _BillOfLadingState extends State<BillOfLading> {
  @override
  Widget build(BuildContext context) {
    // final dynamic tabController = TextEditingController();

    // final item = [
    //   'BL No',
    //   'Place Of Discharge',
    //   'Booking No',
    //   'Place Of Loading',
    //   'Vassel/Voyage',
    //   'Place'
    // ];

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColor.bgColor,
          title: const Text("Bill Of Lading"),
          centerTitle: true,
          elevation: 0.0,
          bottom: const TabBar(
            automaticIndicatorColorAdjustment: true,
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                text: "Home",
              ),
              Tab(
                text: "Details",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: BlHomeScreen()),
            Center(child: BlDetailScreen()),
          ],
          dragStartBehavior: DragStartBehavior.start,
          physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        ),
      ),
    );
  }
}
