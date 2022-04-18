import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transvision_app1/MyComponent/text.dart';
import 'package:http/http.dart' as http;
import '../../Model/Listofsum.dart';

class BillSummary extends StatefulWidget {
  const BillSummary({Key? key}) : super(key: key);

  @override
  State<BillSummary> createState() => _BillSummaryState();
}

class _BillSummaryState extends State<BillSummary> {
  TextEditingController date = TextEditingController();
  TextEditingController date1 = TextEditingController();
  List<Listofsum> myList = [];

  Future<List<Listofsum>> getApi() async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/BillSummaryOnLoad?partycode=P1697"));
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

  @override
  void initState() {
    super.initState();
    date.text = "";
    date1.text = "";
    getApi();
  }

  Widget getTextField(String hint) {
    return TextFormField(
      controller: date,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1990),
            lastDate: DateTime(2030));

        if (pickedDate != null) {
          debugPrint(pickedDate.toString());
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          debugPrint(formattedDate.toString());

          setState(() {
            date.text = formattedDate; //set output date to TextField value.
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
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(width: 1.0, style: BorderStyle.solid))),
    );
  }

  Widget getTextField1(String hint) {
    return TextFormField(
      controller: date1,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1990),
            lastDate: DateTime(2030));

        if (pickedDate != null) {
          debugPrint(pickedDate.toString());
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          debugPrint(formattedDate.toString());

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
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(width: 1.0, style: BorderStyle.solid))),
    );
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
            child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Image.asset(
                  "assets/images/bill.png",
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15.0),
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
                      getTextField("Select Date"),
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
                      getTextField1("Select Date"),
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
                          // showModalBottomSheet(
                          //     context: context,
                          //     builder: (context) => buildSheet());
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
                              Icon(Icons.refresh_outlined,
                                  color: Colors.black),
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
              ],
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                      ),

                      child: FutureBuilder(
                          future: getApi(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: myList.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      shadowColor: Colors.black,
                                      borderOnForeground: true,
                                      color: Colors.white,
                                      clipBehavior: Clip.none,
                                      elevation: 8.0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 8, bottom: 5.0),
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
                                                        'Invoice Date : ${snapshot.data[index].billdate}',
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
                                                        'Bl Date: ${snapshot.data[index].bldate.toString()}',
                                                    size: 15.0,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text:
                                                        'Total Amount : ${snapshot.data[index].billtotals.toString()}',
                                                    size: 15.0,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        'Payment Amount : ${snapshot.data[index].payamt.toString()}',
                                                    size: 15.0,
                                                    color: Colors.black),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                NormalText(
                                                    text:
                                                        'TDS Amount : ${snapshot.data[index].tdsamt.toString()}',
                                                    size: 15.0,
                                                    color: Colors.black),
                                                const Icon(Icons
                                                    .arrow_right_alt_outlined),
                                                NormalText(
                                                    text:
                                                        'Balance Amount : ${snapshot.data[index].balamt.toString()}',
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
                ],
              ),
            )
          ],
        )));
  }
}
