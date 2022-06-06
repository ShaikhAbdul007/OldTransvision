import 'dart:core';
import 'package:flutter/material.dart';
import 'package:transvision_app1/BottomScreen/contacted_person.dart';
import 'package:transvision_app1/MyComponent/constant/colors.dart';
import 'package:transvision_app1/MyComponent/constant/sizedBox.dart';
import 'package:transvision_app1/MyComponent/text.dart';

class BookingDetails2 extends StatefulWidget {
  final List data;
  // dynamic icdFrom,
  //     icdTo,
  //     loadingPort,
  //     destinationPort,
  //     commodity,
  //     type,
  //     size,
  //     myQuantity;

  const BookingDetails2({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<BookingDetails2> createState() => _BookingDetails2State();
}

class _BookingDetails2State extends State<BookingDetails2> {
  @override
  Widget build(BuildContext context) {
    final rateController = TextEditingController();
    final weightController = TextEditingController();
    final freightController = TextEditingController();
    final height = MediaQuery.of(context).size.height / 9.5;
    final width = MediaQuery.of(context).size.width;
    bool isVisible = true;

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
                Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5.0),
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppColor.black,
                            style: BorderStyle.solid,
                            width: 2.0)),
                    child: TextField(
                        //controller: freightController,
                        expands: false,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          hintText: "Enter the Quantity",
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ))),
                const CustomHeight(),
                WeightText(
                    text: "Weight/Cont in kgs.",
                    size: 18.0,
                    color: AppColor.black),
                const CustomHeight(),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5.0),
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppColor.black,
                            style: BorderStyle.solid,
                            width: 2.0)),
                    child: TextField(
                        //controller: weightController,
                        expands: false,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          hintText: "Enter the Quantity",
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ))),
                const CustomHeight(),
                WeightText(
                    text: "Rate Agreed", size: 18.0, color: AppColor.black),
                const CustomHeight(),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5.0),
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppColor.black,
                            style: BorderStyle.solid,
                            width: 2.0)),
                    child: TextField(
                        //controller: rateController,
                        expands: false,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          hintText: "Enter the Quantity",
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ))),
                const CustomHeight(),
                InkWell(
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
                  onTap: () {
                    setState(() {
                      isVisible = true;
                    });
                  },
                ),
                const CustomHeight(),
                Visibility(
                  visible: isVisible,
                  child: Card(
                    margin: const EdgeInsets.all(5),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(children: [
                          if (isVisible)
                            Text(
                                "Icd From:" +
                                    widget.data[0].icdFromValue.toString(),
                                style: const TextStyle(fontSize: 18)),
                          const Icon(Icons.arrow_right_alt_outlined),
                          Text("Icd To:" + widget.data[1].icdToValue.toString(),
                              style: const TextStyle(fontSize: 18)),
                          Text(
                            "Loading Port:" +
                                widget.data[2].loadingPortValue.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          const Icon(Icons.arrow_right_alt_outlined),
                          Text(
                              "Destination Port:" +
                                  widget.data[3].destinationPortValue
                                      .toString(),
                              style: const TextStyle(fontSize: 18)),
                          Text(
                              "Commodity:" +
                                  widget.data[7].updatedCommodityValue
                                      .toString(),
                              style: const TextStyle(fontSize: 18)),
                          Row(
                            children: [
                              Text(
                                  "Quantity :" +
                                      widget.data[4].newQuantity.toString(),
                                  style: const TextStyle(fontSize: 18)),
                              const Icon(Icons.arrow_right_alt_outlined),
                              Text(
                                  "Type :" +
                                      widget.data[5].updatedTypeValue
                                          .toString(),
                                  style: const TextStyle(fontSize: 18)),
                              const Icon(Icons.arrow_right_alt_outlined),
                              Text(
                                  "Size :" +
                                      widget.data[6].sizedUpdate.toString(),
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                        ]);
                      },
                    ),
                  ),
                ),
                const CustomHeight(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: (() {
                          _insertOnlinePostApi();
                        }),
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

void _insertOnlinePostApi() {
  final String partycode;
  final String qty;
  final String size;
  final String type;
  final String commodity;
  final String classs;
  final String unno;
  final String freight;
  final String weight;
  final String icdfrom;
  final String icdto;
  final String pol;
  final String pod;
  final String rateagreedby;
  final String bookingdate;
  final String fromdate;
  final String todate;
}
