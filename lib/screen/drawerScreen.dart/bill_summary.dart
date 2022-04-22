import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:transvision_app1/Model/listOfSum.dart';
import 'package:transvision_app1/Model/billSummaryWithDate.dart';
import 'package:transvision_app1/MyComponent/text.dart';

class BillSummary extends StatefulWidget {
  const BillSummary({Key? key}) : super(key: key);

  @override
  State<BillSummary> createState() => _BillSummaryState();
}

class _BillSummaryState extends State<BillSummary> {
  TextEditingController date = TextEditingController();
  TextEditingController date1 = TextEditingController();
  List<Listofsum> myList = [];
  List<BillSummaryWithDate> summaryWithDate = [];
  final _billFromKey = GlobalKey<FormState>();

  Future<List<Listofsum>> getApi() async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/BillSummaryOnLoad?partycode=P1210"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      myList = [];
      for (Map i in data) {
        myList.add(Listofsum.fromJson(i));
      }
      return myList;
    }
    return myList;
  }

  Future<List<BillSummaryWithDate>> getBillSumDateAPi() async {
    try {
      final response = await http.get(Uri.parse(
          "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/BillSummarywithdate?partycode=P1210&fromdate=" +
              date1.text +
              "&todate=" +
              date.text));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        summaryWithDate = [];
        for (Map i in data) {
          summaryWithDate.add(BillSummaryWithDate.fromJson(i));
        }
      }
    } catch (e) {
      print(e);
    }
    return summaryWithDate;
  }

  @override
  void initState() {
    super.initState();
    date.text = "";
    date1.text = "";
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Bill Summary",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.orange[300],
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/bill.png",
                  fit: BoxFit.cover,
                ),
                Form(
                  key: _billFromKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "From Date",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Select date";
                          } else {
                            return null;
                          }
                        },
                        controller: date1,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            setState(() {
                              date1.text = formattedDate;
                            });
                          } else {
                            debugPrint("Date is not selected");
                          }
                        },
                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.calendar_month),
                            contentPadding: const EdgeInsets.only(left: 15),
                            hintText: "Select the Date",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    width: 1.0, style: BorderStyle.solid))),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text("To Date",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Select date";
                          } else {
                            return null;
                          }
                        },
                        controller: date,
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
                              date.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            {
                              debugPrint("Time is not selected");
                            }
                          }
                        },
                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.calendar_month),
                            contentPadding: const EdgeInsets.only(left: 15),
                            hintText: "Select the Date",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    width: 1.0, style: BorderStyle.solid))),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25.0, bottom: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: (() {
                          if (_billFromKey.currentState!.validate()) {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => buildSheet());
                          } else {
                            return;
                          }
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: Colors.orange[300]),
                          child: Row(
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
                      )),
                    ],
                  ),
                ),
                Container(
                    height: 500,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: FutureBuilder(
                        future: getApi(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: myList.length,
                                itemBuilder: (context, index) {
                                  String invoiceDate =
                                      snapshot.data[index].billdate;
                                  String billDate = snapshot.data[index].bldate;

                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Card(
                                      shadowColor: Colors.black,
                                      borderOnForeground: true,
                                      color: Colors.white,
                                      elevation: 8.0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15.0, left: 10, bottom: 5.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                NormalText(
                                                    text:
                                                        'Vessel : ${snapshot.data[index].vesselname}',
                                                    size: 15.0,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        'Voyage : ${snapshot.data[index].voyage}',
                                                    size: 15.0,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text:
                                                        'Invoice No : ${snapshot.data[index].billno.toString()}',
                                                    size: 15.0,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        'Invoice Date : ${invoiceDate.substring(0, 10)}',
                                                    size: 15.0,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text:
                                                        'BL No : ${snapshot.data[index].blno.toString()}',
                                                    size: 15.0,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        'Bl Date: ${billDate.substring(0, 10)}',
                                                    size: 15.0,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const NormalText(
                                                    text: 'Total Amount : ',
                                                    size: 15.0,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        '${snapshot.data[index].billtotals}',
                                                    size: 15.0,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const NormalText(
                                                    text: 'Payment Amount : ',
                                                    size: 15.0,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        '${snapshot.data[index].payamt}',
                                                    size: 15.0,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const NormalText(
                                                    text: 'Balance Amount : ',
                                                    size: 15.0,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text: snapshot
                                                        .data[index].balamt
                                                        .toString(),
                                                    size: 15.0,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const NormalText(
                                                    text: 'TDS Amount : ',
                                                    size: 15.0,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text: snapshot
                                                        .data[index].tdsamt
                                                        .toString(),
                                                    size: 15.0,
                                                    color: Colors.black),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        })),
              ],
            ),
          ),
        )));
  }

  buildSheet() {
    return Container(
        height: 500,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
        ),
        child: FutureBuilder(
            future: getBillSumDateAPi(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: summaryWithDate.length,
                    itemBuilder: (context, index) {
                      String invoiceDate = snapshot.data[index].billdate;
                      String billDate = snapshot.data[index].bldate;

                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          shadowColor: Colors.black,
                          borderOnForeground: true,
                          color: Colors.white,
                          elevation: 8.0,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 10, bottom: 5.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    NormalText(
                                        text:
                                            'Vessel : ${snapshot.data[index].vesselname}',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text:
                                            'Voyage : ${snapshot.data[index].voyage}',
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                                Row(
                                  children: [
                                    NormalText(
                                        text:
                                            'Invoice No : ${snapshot.data[index].billno.toString()}',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text:
                                            'Invoice Date : ${invoiceDate.substring(0, 10)}',
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                                Row(
                                  children: [
                                    NormalText(
                                        text:
                                            'BL No : ${snapshot.data[index].blno.toString()}',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text:
                                            'Bl Date: ${billDate.substring(0, 10)}',
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const NormalText(
                                        text: 'Total Amount : ',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text:
                                            '${snapshot.data[index].billtotals}',
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const NormalText(
                                        text: 'Payment Amount : ',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text: '${snapshot.data[index].payamt}',
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const NormalText(
                                        text: 'Balance Amount : ',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text: snapshot.data[index].balamt
                                            .toString(),
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const NormalText(
                                        text: 'TDS Amount : ',
                                        size: 15.0,
                                        color: Colors.black),
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    NormalText(
                                        text: snapshot.data[index].tdsamt
                                            .toString(),
                                        size: 15.0,
                                        color: Colors.black),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: NormalText(
                      text: "No Record Found\nPlease Select Proper Date",
                      size: 12.0,
                      color: Colors.black),
                );
              }
            }));
  }
}
