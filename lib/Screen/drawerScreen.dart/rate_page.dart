import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/colors.dart';
import 'package:transvision_app1/MyComponent/sizedbox.dart';
import 'package:transvision_app1/MyComponent/text.dart';
import '../../MyComponent/loadingPortdropdown.dart';

class RatePage extends StatelessWidget {
  const RatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final export = ["Import", "Export"];
    final port = ["Dubai", "Ajman", "Berut"];
    final size = [20, 40];
    final type = ["OT", "FR", "HD"];
    final commodity = ["General", "Hazardous"];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Local Charges",
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Emport/Import",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10.0),
              // DropDownButton(listItems: export),
              const SizedBox(height: 20.0),
              const Text("Port",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 10.0),
              // DropDownButton(listItems: port),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Size",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10.0),
                      // DropDownButton(listItems: size)
                    ],
                  )),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Type",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10.0),
                      // DropDownButton(listItems: type)
                    ],
                  )),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WeightText(
                          text: "Commodity", size: 18.0, color: AppColor.black),
                      const SizedBox(height: 10.0),
                      // DropDownButton(listItems: commodity)
                    ],
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(child: getButton("Refresh")),
                  const CustomWidth(),
                  Expanded(
                    child: getButton("Share"),
                  )
                ],
              ),
              Card(
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    buildRow(['Description', 'Type', 'Currency', 'Charges'],
                        isHeader: true),
                    buildRow(['Bl Charges', 'Docs', 'INR', '4000.00']),
                    buildRow(['MUC Charges', 'Docs', 'INR', '170.00']),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TableRow buildRow(List<String> cell, {bool isHeader = false}) => TableRow(
          children: cell.map((cell) {
        return Padding(
            padding: const EdgeInsets.all(8), child: Center(child: Text(cell)));
      }).toList());

  getButton(String hint) {
    return ElevatedButton(onPressed: () {}, child: Text(hint));
  }
}
