import 'package:flutter/material.dart';
import 'package:transvision_app1/utils/routes.dart';
import '../../DropDown/ddb1.dart';
import '../../DropDown/ddb3.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetails();
}

class _BookingDetails extends State<BookingDetails> {
  final items = ['NavaSiva', 'Patna', 'Dubai', 'Singapoor', 'Chennai'];
  final items1 = ['AbuDabi', ' Dubai', ' Sharjaha', 'Chennai'];
  final items2 = [' Patna', 'Mahim', ' Dubai', ' Shimla', 'Kerala'];
  final items3 = [
    'ICD NavaSiva',
    'ICD Patna',
    'ICD Dubai',
    'ICD Singapoor',
    'ICD Chennai'
  ];
  final item4 = [20, 40];
  final item5 = ['FR', 'OT', 'ISO', 'HD', 'GP'];
  final item6 = ['General', 'Hazardous', 'ODC'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Text(
            "Booking Details",
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "IDC From",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  DropDownButton(
                    listItems: items,
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Port Of Loading",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  DropDownButton(
                    listItems: items1,
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Port Of Destination",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  DropDownButton(
                    listItems: items2,
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(
                  "IDC To",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                DropDownButton(
                  listItems: items3,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Quantity",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1.0)),
                            child: const TextField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: "Enter The Quantity",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Size",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10.0,
                          ),
                          DropDownButton(listItems: item5)
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Type",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10.0,
                          ),
                          DropDownButton3(listItems: item4)
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Commodity",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10.0,
                          ),
                          DropDownButton(listItems: item6)
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          height: 50,
          width: 170,
          child: FloatingActionButton(
            backgroundColor: Colors.orange[400],
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.bookingDetailsRoute2);
            },
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Text(
              "Next",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
          ),
        ));
  }
}
