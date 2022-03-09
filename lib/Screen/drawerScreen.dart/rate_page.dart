import 'package:flutter/material.dart';
import '../../MyComponent/ddb2.dart';

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
                      DropDownButton(listItems: size)
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
              Row(
                children: [
                  Expanded(child: getButton("Refresh")),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: getButton("Share"),
                  )
                ],
              ),
              Card(
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: const {
                    1: FractionColumnWidth(0.15),
                    2: FractionColumnWidth(0.15),
                    3: FractionColumnWidth(0.15),
                    4: FractionColumnWidth(0.15),
                  },
                  children: [
                    buildRow(
                        ['Description', 'Type', 'Currency', 'Charges', 'Edit'],
                        isHeader: true),
                    buildRow(['Bl Charges', 'Docs', 'INR', '4000.00', 'Edit']),
                    buildRow(['MUC Charges', 'Docs', 'INR', '170.00', 'Edit']),
                    buildRow(['Seal Charges', 'CONT', 'USD', '5', 'Edit']),
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
        // final style = TextStyle(
        //     fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        //     fontSize: 18);
        return Padding(
            padding: const EdgeInsets.all(5), child: Center(child: Text(cell)));
      }).toList());

  getButton(String hint) {
    return ElevatedButton(onPressed: () {}, child: Text(hint));
  }
}
