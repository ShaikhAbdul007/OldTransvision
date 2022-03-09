import 'package:flutter/material.dart';

import '../../MyComponent/ddb2.dart';

class BillOfLading extends StatefulWidget {
  const BillOfLading({Key? key}) : super(key: key);

  @override
  State<BillOfLading> createState() => _BillOfLadingState();
}

class _BillOfLadingState extends State<BillOfLading> {
  @override
  Widget build(BuildContext context) {
    final item = [
      'BL No',
      'Place Of Discharge',
      'Booking No',
      'Place Of Loading',
      'Vassel/Voyage',
      'Place'
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Text("Bill Of Lading"),
          centerTitle: true,
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: SafeArea(
            child: ListView(children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/loading.png",
                    fit: BoxFit.cover,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Search",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  DropDownButton(listItems: item),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 5, right: 8.0),
                    // child: ,
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Details",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    "Refersh",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Icon(Icons.refresh_rounded),
                                ]),
                          )),
                      InkWell(
                        onTap: (() {}),
                        child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green[400],
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    "Edit",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  Icon(Icons.edit),
                                ])),
                      )
                    ]),
              ),
            ]),
          ),
        )));
  }
}
