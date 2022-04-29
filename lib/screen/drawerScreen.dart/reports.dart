import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transvision_app1/Model/reportOnLoad.dart';
import 'package:transvision_app1/MyComponent/constant/colors.dart';
import 'package:transvision_app1/MyComponent/text.dart';
import 'package:http/http.dart' as http;

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  TextEditingController reportFromDate = TextEditingController();
  TextEditingController reportToDate = TextEditingController();
  List<ReportOnLoad> reportLoadList = [];

  Future<List<ReportOnLoad>> getReportOnLoadApi() async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/BookingReportonload?partycode=P1140"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        reportLoadList.add(ReportOnLoad.fromJson(i));
      }
      return reportLoadList;
    }
    return reportLoadList;
  }

  @override
  void initState() {
    reportFromDate.text = "";
    reportToDate.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            const WeightText(text: "Reports", size: 20.0, color: Colors.black),
        centerTitle: true,
        shadowColor: Colors.black,
        backgroundColor: Colors.orange[300],
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/reports.png",
                fit: BoxFit.fill,
              ),
              const WeightText(
                  text: "Reports", size: 25.0, color: Colors.black),
              Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WeightText(
                        text: "From Date", size: 18.0, color: AppColor.black),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      controller: reportFromDate,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1990),
                            lastDate: DateTime(2030));

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);

                          setState(() {
                            reportFromDate.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          debugPrint("Date is not selected");
                        }
                      },
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.calendar_month),
                          contentPadding: const EdgeInsets.only(left: 15),
                          hintText: "Please Select Date",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  width: 1.0, style: BorderStyle.solid))),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    WeightText(
                        text: "To Date", size: 18.0, color: AppColor.black),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      controller: reportToDate,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1990),
                            lastDate: DateTime(2030));

                        if (pickedDate != null) {
                          debugPrint(pickedDate.toString());
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          debugPrint(formattedDate.toString());

                          setState(() {
                            reportToDate.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          {
                            debugPrint("Time Is not Selected");
                          }
                        }
                      },
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.calendar_month),
                          contentPadding: const EdgeInsets.only(left: 15),
                          hintText: "Please Select Date",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  width: 1.0, style: BorderStyle.solid))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: Colors.orange[300]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.refresh_outlined, color: Colors.black),
                              SizedBox(
                                width: 5.0,
                              ),
                              WeightText(
                                  text: "Refresh",
                                  size: 18.0,
                                  color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    height: 500,
                    child: FutureBuilder(
                        future: getReportOnLoadApi(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: reportLoadList.length,
                                itemBuilder: (context, index) {
                                  String bDate =
                                      snapshot.data[index].bookingdate;
                                  return Card(
                                    shadowColor: Colors.orange,
                                    elevation: 5,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20.0, bottom: 15.0, left: 15.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              NormalText(
                                                  text:
                                                      'Reference No : ${snapshot.data[index].refno}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              NormalText(
                                                  text:
                                                      'Bar Code : ${snapshot.data[index].brcode}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              NormalText(
                                                  text:
                                                      'Booking No : ${snapshot.data[index].bookingno}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              NormalText(
                                                  text:
                                                      'Booking Date : ${bDate.substring(0, 10)}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              NormalText(
                                                  text:
                                                      'DO No : ${snapshot.data[index].doNo}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              NormalText(
                                                  text:
                                                      'Quantity : ${snapshot.data[index].qty}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              NormalText(
                                                  text:
                                                      'Size : ${snapshot.data[index].size}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              NormalText(
                                                  text:
                                                      'Type : ${snapshot.data[index].type}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              NormalText(
                                                  text:
                                                      'Freight : ${snapshot.data[index].freight}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              NormalText(
                                                  text:
                                                      'Freight : ${snapshot.data[index].freight}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              NormalText(
                                                  text:
                                                      'POL : ${snapshot.data[index].pol}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              NormalText(
                                                  text:
                                                      'POD : ${snapshot.data[index].pod}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              NormalText(
                                                  text:
                                                      'Commodity: ${snapshot.data[index].commodity}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              NormalText(
                                                  text:
                                                      'ICD From : ${snapshot.data[index].icdfrom}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              NormalText(
                                                  text:
                                                      '	ICD To : ${snapshot.data[index].icdto}',
                                                  size: 15.0,
                                                  color: Colors.black),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        })),
              ),
            ],
          )
        ],
      )),
    );
  }
}
