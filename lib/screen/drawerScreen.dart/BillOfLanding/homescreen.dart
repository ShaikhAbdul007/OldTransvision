import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transvision_app1/Model/billOfLading.dart';
import 'package:transvision_app1/Model/blOfLadingOnReferesh.dart';
import 'package:transvision_app1/MyComponent/DropDown/billOfLading.dart';
import 'package:transvision_app1/MyComponent/constant/colors.dart';
import 'package:transvision_app1/MyComponent/text.dart';
import 'package:http/http.dart' as http;

class BlHomeScreen extends StatefulWidget {
  const BlHomeScreen({Key? key}) : super(key: key);

  @override
  State<BlHomeScreen> createState() => _BlHomeScreenState();
}

class _BlHomeScreenState extends State<BlHomeScreen> {
  dynamic updatedBillOfLandingValue = "";
  final List item = [
    'BL No.',
    'Booking No.',
    'Place Of Loading',
    'Place Of Discharge',
    'Vessel/Voyage',
    'Place'
  ];
  TextEditingController blTextController = TextEditingController();

  List<BillOfLading> billofladingOnLoad = [];
  List<BlOfLadingOnRefresh> billofladingOnRefresh = [];

  // ignore: recursive_getters
  get value => value;

  Future<List<BillOfLading>> getBillOfLandingOnLoadApi() async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/blformonlload?partycode=P1210"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      billofladingOnLoad = [];
      for (Map i in data) {
        billofladingOnLoad.add(BillOfLading.fromJson(i));
      }
      return billofladingOnLoad;
    }
    return billofladingOnLoad;
  }

  Future<List<BlOfLadingOnRefresh>> getBillOfLandingRefresh(
      dynamic value, dynamic blTextController) async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/blformRefresh?partycode=P1210&drpsearch=$value&txtsearch=" +
            blTextController.text));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      billofladingOnRefresh = [];
      for (Map i in data) { 
        billofladingOnRefresh.add(BlOfLadingOnRefresh.fromJson(i));
      }
      return billofladingOnRefresh;
    }
    return billofladingOnRefresh;
  }

  @override
  void initState() {
    super.initState();
    getBillOfLandingOnLoadApi();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/loading.png",
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: WeightText(
                      text: "Search", size: 20.0, color: AppColor.black),
                ),
                const SizedBox(height: 5.0),
                BillOfLandingDropDown(
                  listItems: item,
                  notifyParent: (value) {
                    updatedBillOfLandingValue = value;
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: TextField(
                  controller: blTextController,
                  cursorColor: AppColor.black,
                  decoration: InputDecoration(
                      hintText: "Enter the Detials",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 55.0, right: 25.0, bottom: 10.0, top: 20.0),
          child: Row(
            children: [
              InkWell(
                onTap: (() {
                  showBottomSheet(
                      context: context, builder: (context) => builsheet());
                }),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.7,
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
                          text: "Refresh", size: 18.0, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            height: 500,
            child: FutureBuilder(
                future: getBillOfLandingOnLoadApi(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: billofladingOnLoad.length,
                        itemBuilder: (context, index) {
                          String issuedate = snapshot.data[index].issuedate;
                          String etddate = snapshot.data[index].etd;
                          return Card(
                            shadowColor: Colors.orange,
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, left: 10, bottom: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      NormalText(
                                          text:
                                              'BL No :  ${snapshot.data[index].blno.toString()}',
                                          size: 15.0,
                                          color: Colors.black),
                                      const Icon(
                                          Icons.arrow_right_alt_outlined),
                                      NormalText(
                                          text:
                                              'Booking No :  ${snapshot.data[index].bookingno.toString()}',
                                          size: 15.0,
                                          color: Colors.black),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      NormalText(
                                          text:
                                              'Issue Date:  ${issuedate.substring(0, 10)}',
                                          size: 15.0,
                                          color: Colors.black),
                                      const Icon(
                                          Icons.arrow_right_alt_outlined),
                                      NormalText(
                                          text:
                                              'ETD:  ${etddate.substring(0, 10)}',
                                          size: 15.0,
                                          color: Colors.black),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const NormalText(
                                          text: 'Act-BL-No',
                                          size: 15.0,
                                          color: Colors.black),
                                      const Icon(
                                          Icons.arrow_right_alt_outlined),
                                      NormalText(
                                          text: snapshot.data[index].blact
                                              .toString(),
                                          size: 15.0,
                                          color: Colors.black),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const NormalText(
                                          text: 'Vessel/Voyage:',
                                          size: 15.0,
                                          color: Colors.black),
                                      const Icon(
                                          Icons.arrow_right_alt_outlined),
                                      NormalText(
                                          text: snapshot.data[index].vessel,
                                          size: 15.0,
                                          color: Colors.black),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const NormalText(
                                          text: 'Place : ',
                                          size: 15.0,
                                          color: Colors.black),
                                      const Icon(
                                          Icons.arrow_right_alt_outlined),
                                      NormalText(
                                          text: snapshot.data[index].place,
                                          size: 15.0,
                                          color: Colors.black),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const NormalText(
                                          text: 'Place Of Loading',
                                          size: 15.0,
                                          color: Colors.black),
                                      const Icon(
                                          Icons.arrow_right_alt_outlined),
                                      NormalText(
                                          text: '${snapshot.data[index].pol}',
                                          size: 15.0,
                                          color: Colors.black),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const NormalText(
                                          text: 'Place Of Discharge :-',
                                          size: 15.0,
                                          color: Colors.black),
                                      NormalText(
                                          text: '${snapshot.data[index].podis}',
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
                    return const Center(child: CircularProgressIndicator());
                  }
                })),
      ]),
    );
  }

  builsheet() => Container(
      height: 500,
      child: FutureBuilder(
          future: getBillOfLandingRefresh(value, blTextController),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: billofladingOnRefresh.length,
                  itemBuilder: (context, index) {
                    String issueDate = snapshot.data[index].issuedate;
                    String etdDate = snapshot.data[index].etd;
                    return Card(
                      shadowColor: Colors.orange,
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 10, bottom: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                NormalText(
                                    text:
                                        'BL No :  ${snapshot.data[index].blno.toString()}',
                                    size: 15.0,
                                    color: Colors.black),
                                const Icon(Icons.arrow_right_alt_outlined),
                                NormalText(
                                    text:
                                        'Booking No :  ${snapshot.data[index].bookingno.toString()}',
                                    size: 15.0,
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              children: [
                                NormalText(
                                    text:
                                        'Issue Date:  ${issueDate.substring(0, 10)}',
                                    size: 15.0,
                                    color: Colors.black),
                                const Icon(Icons.arrow_right_alt_outlined),
                                NormalText(
                                    text: 'ETD:  ${etdDate.substring(0, 10)}',
                                    size: 15.0,
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              children: [
                                const NormalText(
                                    text: 'Act-BL-No',
                                    size: 15.0,
                                    color: Colors.black),
                                const Icon(Icons.arrow_right_alt_outlined),
                                NormalText(
                                    text: snapshot.data[index].blact.toString(),
                                    size: 15.0,
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              children: [
                                const NormalText(
                                    text: 'Vessel/Voyage:',
                                    size: 15.0,
                                    color: Colors.black),
                                const Icon(Icons.arrow_right_alt_outlined),
                                NormalText(
                                    text: snapshot.data[index].vessel,
                                    size: 15.0,
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              children: [
                                const NormalText(
                                    text: 'Place : ',
                                    size: 15.0,
                                    color: Colors.black),
                                const Icon(Icons.arrow_right_alt_outlined),
                                NormalText(
                                    text: snapshot.data[index].place,
                                    size: 15.0,
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              children: [
                                const NormalText(
                                    text: 'Place Of Loading',
                                    size: 15.0,
                                    color: Colors.black),
                                const Icon(Icons.arrow_right_alt_outlined),
                                NormalText(
                                    text: '${snapshot.data[index].pol}',
                                    size: 15.0,
                                    color: Colors.black),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const NormalText(
                                    text: 'Place Of Discharge :-',
                                    size: 15.0,
                                    color: Colors.black),
                                NormalText(
                                    text: '${snapshot.data[index].podis}',
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
              return const Center(child: CircularProgressIndicator());
            }
          }));
}
