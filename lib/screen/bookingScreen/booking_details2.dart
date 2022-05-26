import 'dart:core';
import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/constant/colors.dart';
import 'package:transvision_app1/MyComponent/constant/sizedBox.dart';
import 'package:transvision_app1/MyComponent/constant/textField.dart';
import 'package:transvision_app1/MyComponent/text.dart';

class BookingDetails2 extends StatelessWidget {
  final String icdFrom;
  final String icdTo;
  final String loadingport;
  final String destinationport;
  final int selectedQuantity;
  final int size;
  final int type;
  final String commodity;
  final int ourClass;
  final int unNo;

  const BookingDetails2(
      {Key? key,
      required this.icdFrom,
      required this.icdTo,
      required this.loadingport,
      required this.destinationport,
      required this.selectedQuantity,
      required this.size,
      required this.type,
      required this.commodity,
      required this.ourClass,
      required this.unNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: WeightText(
            text: "Booking Details", size: 20.0, color: AppColor.black),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeightText(
                    text: "Freight/Container",
                    size: 18.0,
                    color: AppColor.black),
                const CustomHeight(),
                const CustomTextField(hint: "Freight/Container"),
                const CustomHeight(),
                WeightText(
                    text: "Weight/Cont in kgs.",
                    size: 18.0,
                    color: AppColor.black),
                const CustomHeight(),
                const CustomTextField(hint: "Weight/Cont in kgs."),
                const CustomHeight(),
                WeightText(
                    text: "Rate Agreed", size: 18.0, color: AppColor.black),
                const CustomHeight(),
                const CustomTextField(hint: "Enter the Rate"),
                const CustomHeight(),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.orange[300]),
                        child: const Center(
                          child: WeightText(
                              text: "All Record",
                              size: 20.0,
                              color: Colors.black),
                        )),
                  ),
                ),
                const CustomHeight(),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
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
                  },
                  itemCount: 3,
                ),
                const CustomHeight(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: (() {}),
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 40.0,
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: Colors.green[300]),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.check_circle, color: Colors.black),
                              SizedBox(
                                width: 5.0,
                              ),
                              WeightText(
                                  text: "Submit",
                                  size: 18.0,
                                  color: Colors.black),
                            ],
                          ),
                        ),
                      )),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                          child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 40.0,
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: Colors.red[900]),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.close, color: Colors.black),
                              SizedBox(
                                width: 5.0,
                              ),
                              WeightText(
                                  text: "Cancel",
                                  size: 18.0,
                                  color: Colors.black),
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
