import 'package:flutter/material.dart';
import 'package:transvision_app1/DropDown/ddb1.dart';
import 'package:transvision_app1/DropDown/ddb3.dart';

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
          padding: const EdgeInsets.only(top: 10.0, right: 12.0, left: 12.0),
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
              DropDownButton(listItems: export),
              const SizedBox(height: 20.0),
              const Text("Port",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 10.0),
              DropDownButton(listItems: port),
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
                      DropDownButton3(listItems: size)
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
                      DropDownButton(listItems: type)
                    ],
                  )),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Commodity",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10.0),
                      DropDownButton(listItems: commodity)
                    ],
                  ))
                ],
              ),
              ListView.builder(itemBuilder: ((context, index) {
                return Table(
                  children: const [
                    TableRow(children: [
                      TableCell(child: Text("Abdul")),
                      TableCell(child: Text("Rehman")),
                      TableCell(child: Text("Shaikh")),
                    ])
                  ],
                );
              }))
            ],
          ),
        ),
      ),
    );
  }
}
