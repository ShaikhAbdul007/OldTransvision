import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transvision_app1/Model/doSlipOnLoad.dart';
import 'package:transvision_app1/MyComponent/constant/colors.dart';
import 'package:transvision_app1/MyComponent/constant/textField.dart';
import 'package:transvision_app1/MyComponent/text.dart';
import 'package:http/http.dart' as http;

class DoSlip extends StatefulWidget {
  const DoSlip({Key? key}) : super(key: key);

  @override
  State<DoSlip> createState() => _DoSlipState();
}

class _DoSlipState extends State<DoSlip> {
  TextEditingController doSlipFromDate = TextEditingController();
  TextEditingController doSlipToDate = TextEditingController();
  List<DoSlipOnLoad> myDoList = [];

  Future<List<DoSlipOnLoad>> getDoSlipApi() async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/DoslipDataBind?partycode=P1140"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      myDoList = [];
      for (Map i in data) {
        myDoList.add(DoSlipOnLoad.fromJson(i));
      }
      return myDoList;
    }
    return myDoList;
  }

  @override
  void initState() {
    doSlipFromDate.text = "";
    doSlipToDate.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const WeightText(
            text: "Delivery Order",
            size: 20.0,
            color: Colors.black,
          ),
          backgroundColor: Colors.orange[300],
          centerTitle: true,
        ),
        body: ListView(children: [
          Container(
            color: Colors.white,
            child: SafeArea(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/do.png",
                      fit: BoxFit.fill,
                      height: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WeightText(
                              text: "From Date",
                              size: 18.0,
                              color: AppColor.black),
                          const SizedBox(
                            height: 8.0,
                          ),
                          TextFormField(
                            controller: doSlipFromDate,
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
                                  doSlipFromDate.text =
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
                            height: 10.0,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WeightText(
                                  text: "To Date",
                                  size: 18.0,
                                  color: AppColor.black),
                              const SizedBox(
                                height: 8.0,
                              ),
                              TextFormField(
                                controller: doSlipToDate,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1990),
                                      lastDate: DateTime(2030));

                                  if (pickedDate != null) {
                                    debugPrint(pickedDate.toString());
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                    debugPrint(formattedDate.toString());

                                    setState(() {
                                      doSlipToDate.text =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  } else {
                                    {
                                      debugPrint("Time Is not Selected");
                                    }
                                  }
                                },
                                decoration: InputDecoration(
                                    suffixIcon:
                                        const Icon(Icons.calendar_month),
                                    contentPadding:
                                        const EdgeInsets.only(left: 15),
                                    hintText: "Please Select Date",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            width: 1.0,
                                            style: BorderStyle.solid))),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WeightText(
                                  text: "Reference Number",
                                  size: 18.0,
                                  color: AppColor.black),
                              const SizedBox(
                                height: 8.0,
                              ),
                              const MyTextField(hint: "Enter The Reference No")
                            ],
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.refresh_outlined,
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      WeightText(
                                          text: "Refresh",
                                          size: 18.0,
                                          color: Colors.black),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.orange[300],
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 500,
                          child: FutureBuilder(
                              future: getDoSlipApi(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: myDoList.length,
                                      itemBuilder: (context, index) {
                                        String bDate=snapshot.data[index].bookingdate;
                                        String dValidity=snapshot.data[index].dovalidity;
                                        return Card(
                                          elevation: 5.0,
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 12,left: 10,bottom: 5),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'DO No : ${snapshot.data[index].doNo}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const  SizedBox(width: 5,),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                   const  SizedBox(width: 5,),
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
                                                    const  SizedBox(width: 5,),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                   const  SizedBox(width: 5,),
                                                    NormalText(
                                                        text:
                                                            'Booking Date : ${bDate.substring(0,10)}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const NormalText(
                                                        text:
                                                            'Port Of Loading :',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const  SizedBox(width: 5,),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),

                                                    NormalText(
                                                        text:
                                                        snapshot.data[index].pod,
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const NormalText(
                                                        text:
                                                        'Port Of Destination:',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const  SizedBox(width: 5,),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    NormalText(
                                                        text:
                                                        snapshot.data[index].pol,
                                                        size: 15.0,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    NormalText(
                                                        text:
                                                            'Ref No: ${snapshot.data[index].refno}',
                                                        size: 15.0,
                                                        color: Colors.black),
                                                    const  SizedBox(width: 5,),
                                                    const Icon(Icons
                                                        .arrow_right_alt_outlined),
                                                    const  SizedBox(width: 5,),
                                                    NormalText(
                                                        text:
                                                            'Do Validity : ${dValidity.substring(0,10)}',
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
                                  return const CircularProgressIndicator();
                                }
                              })),
                    ),
                  ]),
            ),
          ),
        ]));
  }
}
