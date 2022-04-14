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
      for (Map i in data) {
        myList = [];
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
          child: ListView(
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
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => buildSheet());
                      }),
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 40.0,
                        ),
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
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 30.0,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.orange[300]),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.edit_attributes_outlined,
                                color: Colors.black),
                            SizedBox(
                              width: 5.0,
                            ),
                            WeightText(
                                text: "All Records",
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
        ));
  }

  buildSheet() => Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
      ),
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder(
          future: getApi(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Card(
                child: ListView.builder(
                    itemCount: myList.length,
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        title: Text(
                          'Port : ${snapshot.data[index].balamt.toString()}'
                          "   "
                          'Size : ${snapshot.data[index].billdate}',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        subtitle: Text(
                          'FPOD : ${snapshot.data[index].billno.toString()}'
                          "   "
                          "   "
                          'Type: ${snapshot.data[index].billtotals.toString()}',
                          style: const TextStyle(fontSize: 15.0),
                        ),
                        leading: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        backgroundColor: Colors.orange[50],
                        // controlAffinity: ListTileControlAffinity.leading,
                        // trailing: Text(snapshot.data[index].container,
                        //     style: const TextStyle(fontSize: 15.0)),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const NormalText(
                                            text: "Weight",
                                            size: 12.0,
                                            color: Colors.black,
                                          ),
                                          TextField(
                                            expands: false,
                                            decoration: InputDecoration(
                                                hintText: snapshot
                                                    .data[index].bldate
                                                    .toString(),
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 2.0,
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9))),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const NormalText(
                                            text: "IMCO",
                                            size: 12.0,
                                            color: Colors.black,
                                          ),
                                          TextField(
                                            expands: false,
                                            decoration: InputDecoration(
                                                hintText: snapshot
                                                    .data[index].blno
                                                    .toString(),
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 2.0,
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9))),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const NormalText(
                                            text: "Status",
                                            size: 12.0,
                                            color: Colors.black,
                                          ),
                                          TextField(
                                            expands: false,
                                            decoration: InputDecoration(
                                                hintText: snapshot
                                                    .data[index].payamt
                                                    .toString(),
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 2.0,
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const NormalText(
                                            text: "STOW",
                                            size: 12.0,
                                            color: Colors.black,
                                          ),
                                          TextField(
                                            expands: false,
                                            decoration: InputDecoration(
                                                hintText: snapshot
                                                    .data[index].tdsamt
                                                    .toString(),
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 2.0,
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9))),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const NormalText(
                                            text: "Remark",
                                            size: 12.0,
                                            color: Colors.black,
                                          ),
                                          TextField(
                                            expands: false,
                                            decoration: InputDecoration(
                                                hintText: snapshot
                                                    .data[index].vesselname,
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 2.0,
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9))),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const NormalText(
                                            text: "Transportation",
                                            size: 12.0,
                                            color: Colors.black,
                                          ),
                                          TextField(
                                            expands: false,
                                            decoration: InputDecoration(
                                                hintText: snapshot
                                                    .data[index].voyage,
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 2.0,
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }));
}
