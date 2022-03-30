import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/colors.dart';
import 'package:transvision_app1/MyComponent/text.dart';
import 'package:transvision_app1/MyComponent/textFeild.dart';
import 'package:transvision_app1/Screen/drawerScreen.dart/BillOfLanding/%20BlDetailsScreen.dart';
import 'package:transvision_app1/Screen/drawerScreen.dart/BillOfLanding/BlHomeScreen.dart';

import '../../../MyComponent/DropDown/Loading.dart';

class BillOfLading extends StatefulWidget {
  const BillOfLading({Key? key}) : super(key: key);

  @override
  State<BillOfLading> createState() => _BillOfLadingState();
}

class _BillOfLadingState extends State<BillOfLading> {
  @override
  Widget build(BuildContext context) {

    final dynamic tabController = TextEditingController();

    final item = [
      'BL No',
      'Place Of Discharge',
      'Booking No',
      'Place Of Loading',
      'Vassel/Voyage',
      'Place'
    ];

    return DefaultTabController(
      initialIndex: 1,
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
            Center(
                child: BlHomeScreen()),
            Center(
                child: BlDetailScreen()),
          ],
          dragStartBehavior: DragStartBehavior.start,
          physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),


        ),
      ),
    );
  }
}
