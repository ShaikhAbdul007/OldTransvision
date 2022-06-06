import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transvision_app1/Model/icd_model/icdFrom.dart';
import 'package:transvision_app1/Model/icd_model/icdTo.dart';
import 'package:transvision_app1/Model/port_model/destinationPort.dart';
import 'package:transvision_app1/Model/port_model/loadingPort.dart';
import 'package:transvision_app1/Model/size_model/sizedModel.dart';
import 'package:transvision_app1/MyComponent/DropDown/other_booking_page/commodity.dart';
import 'package:transvision_app1/MyComponent/DropDown/other_booking_page/type.dart';
import 'package:transvision_app1/MyComponent/DropDown/ports/loading.dart';
import 'package:transvision_app1/MyComponent/constant/colors.dart';
import 'package:transvision_app1/MyComponent/DropDown/ports/destinationOfPort.dart';
import 'package:transvision_app1/MyComponent/DropDown/icd/icdFrom.dart';
import 'package:transvision_app1/MyComponent/DropDown/icd/icd_To.dart';
import 'package:transvision_app1/MyComponent/DropDown/other_booking_page/size.dart';
import 'package:transvision_app1/MyComponent/constant/sizedBox.dart';
import 'package:transvision_app1/screen/bookingScreen/booking_details2.dart';
import 'package:transvision_app1/utils/routes.dart';
import 'package:http/http.dart' as http;
import '../../MyComponent/text.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetails();
}

class _BookingDetails extends State<BookingDetails> {
  bool isVisible = false;
  final item = [20, 40];
  final items = ['General', 'Hazardous', "ODC"];
  dynamic icdToValue;
  dynamic icdFromValue;
  dynamic updatedCommodityValue = "";
  dynamic loadingPortValue;
  dynamic destinationPortValue;
  dynamic sizedUpdate = "";
  dynamic upadatedTypeValue = "";
  dynamic updatedTypeValue = "";
  List<Loadingport> loadingPort = [];
  List<Icdfrom> idcFromPort = [];
  List<Icdto> icdToPort = [];
  List<DestinationPort> destinationPort = [];
  List<SizedModel> sizeModel = [];
  final icdForm = TextEditingController();
  final newQuantity = TextEditingController();
  final myClassController = TextEditingController();
  final unNoController = TextEditingController();

//
// // http://192.168.1.143
//   var url = "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/pol/";
//   var uri = "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/pol/";

  Future<List<Loadingport>> getLoadingPortApi() async {
    final response = await http.get(
        Uri.parse("http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/pol/"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      loadingPort = [];
      for (Map i in data) {
        loadingPort.add(Loadingport.fromJson(i));
      }
      return loadingPort;
    } else {
      return loadingPort;
    }
  }

  Future<List<DestinationPort>> getDestinationPortApi(dynamic value) async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/pod?port=$value"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      destinationPort = [];
      for (Map i in data) {
        destinationPort.add(DestinationPort.fromJson(i));
      }
      return destinationPort;
    } else {
      return destinationPort;
    }
  }

  loadingPortUpdated(dynamic value) {
    setState(() {
      loadingPortValue = value;
      destinationPortValue = null;
    });
    getDestinationPortApi(value);
  }

  Future<List<Icdfrom>> getIcdFromPortApi() async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/icdfrom/"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      idcFromPort = [];
      for (Map i in data) {
        idcFromPort.add(Icdfrom.fromJson(i));
      }
      return idcFromPort;
    } else {
      return idcFromPort;
    }
  }

  icdFromUpdated(dynamic icdFrom) {
    setState(() {
      icdFromValue = icdFrom;
      icdToValue = null;
    });
    getIcdToApi(icdFrom);
  }

  Future<List<Icdto>> getIcdToApi(dynamic icdFrom) async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/icdto?icd=$icdFrom"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      icdToPort = [];
      for (Map i in data) {
        icdToPort.add(Icdto.fromJson(i));
      }
      return icdToPort;
    } else {
      return icdToPort;
    }
  }

  Future<List<SizedModel>> getTypeApi(dynamic value) async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/contType?contSize=$value"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      sizeModel = [];
      for (Map i in data) {
        sizeModel.add(SizedModel.fromJson(i));
      }
      return sizeModel;
    }
    return sizeModel;
  }

  sizeUpdated(dynamic value) {
    setState(() {
      sizedUpdate = value;
    });
    getTypeApi(value);
    updatedTypeValue = value;
  }

  @override
  void initState() {
    super.initState();
    getLoadingPortApi();
    getIcdFromPortApi();
    getTypeApi(sizedUpdate);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 9.5;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.bgColor,
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, MyRoutes.myNavigationRoute);
              },
              icon: const Icon(Icons.arrow_back)),
          title: WeightText(
              text: "Booking Details", size: 20.0, color: AppColor.black),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
          child: Form(
            child: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldText(text: "IDC From", size: 18.0, color: AppColor.black),
                  const SizedBox(
                    height: 4.0,
                  ),
                  FutureBuilder(
                      future: getIcdFromPortApi(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return IcdFromDropDownButton(
                            listItems: idcFromPort,
                            icdFromValue: icdFromValue,
                            notifyParent: icdFromUpdated,
                          );
                        } else {
                          return const Text("Loading Item");
                        }
                      })
                ],
              ),
              const CustomHeight(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldText(
                      text: "Port Of Loading ",
                      size: 18.0,
                      color: AppColor.black),
                  const SizedBox(
                    height: 4.0,
                  ),
                  FutureBuilder(
                      future: getLoadingPortApi(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        try {
                          if (snapshot.hasData) {
                            return LoadingPortDropDownButton(
                                loadingPortValue: loadingPortValue,
                                notifyParent: loadingPortUpdated,
                                listItems: loadingPort);
                          } else {
                            return const Text("Loading Item");
                          }
                        } catch (e) {
                          return throw Exception();
                        }
                      }),
                  const CustomHeight(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(
                          text: "Port Of Destination",
                          size: 18.0,
                          color: AppColor.black),
                      const SizedBox(
                        height: 4.0,
                      ),
                      FutureBuilder(
                          future: getLoadingPortApi(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            try {
                              if (snapshot.hasData) {
                                return DestinationPortDropDownButton(
                                  listItems: destinationPort,
                                  destinationPortValue: destinationPortValue,
                                  notifyparent: (destinationValue) {
                                    setState(() {
                                      destinationPortValue = destinationValue;
                                    });
                                  },
                                );
                              } else {
                                return const Text("Loading Item");
                              }
                            } catch (e) {
                              return throw Exception();
                            }
                          }),
                    ],
                  ),
                  const CustomHeight(),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText(
                            text: "IDC To", size: 18.0, color: AppColor.black),
                        const SizedBox(
                          height: 4.0,
                        ),
                        FutureBuilder(
                            future: getIcdFromPortApi(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return IcdToDropDownButton(
                                  listItems: icdToPort,
                                  icdToValue: icdToValue,
                                  notifyIcdTovalueToBookingPage: (value) {
                                    setState(() {
                                      icdToValue = value;
                                    });
                                  },
                                );
                              } else {
                                return const Text("Loading Item");
                              }
                            }),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BoldText(
                                      text: "Quantity",
                                      size: 18.0,
                                      color: AppColor.black),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(5.0),
                                      margin: const EdgeInsets.all(5.0),
                                      height: height,
                                      width: width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: AppColor.black,
                                              style: BorderStyle.solid,
                                              width: 2.0)),
                                      child: TextField(
                                          controller: newQuantity,
                                          expands: false,
                                          cursorColor: Colors.black,
                                          decoration: const InputDecoration(
                                            hintText: "Enter the Quantity",
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none),
                                          ))),
                                ],
                              ),
                            ),
                            const CustomWidth(),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BoldText(
                                      text: "Size",
                                      size: 18.0,
                                      color: AppColor.black),
                                  SizeDropDownButton(
                                    listItems: item,
                                    notifyParent: sizeUpdated,
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const CustomHeight(),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BoldText(
                                      text: "Type",
                                      size: 18.0,
                                      color: AppColor.black),
                                  FutureBuilder(
                                      future: getTypeApi(sizedUpdate),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.hasData) {
                                          return TypeDropDownButton(
                                            listItems: sizeModel,
                                            notifyValue: (typeValue) {
                                              setState(() {
                                                updatedTypeValue = typeValue;
                                              });
                                            },
                                          );
                                        } else {
                                          return const Text("Loading Item");
                                        }
                                      }),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                ],
                              ),
                            ),
                            const CustomWidth(),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BoldText(
                                      text: "Commodity",
                                      size: 18.0,
                                      color: AppColor.black),
                                  CommodityDropDownButton(
                                    listItems: items,
                                    notifyParent: (value) {
                                      updatedCommodityValue = value;
                                      if (value == "Hazardous") {
                                        setState(() {
                                          isVisible = true;
                                        });
                                      } else {
                                        setState(() {
                                          isVisible = false;
                                        });
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: isVisible,
                          child: Row(
                            children: [
                              if (isVisible)
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BoldText(
                                          text: "Class",
                                          size: 18.0,
                                          color: AppColor.black),
                                      Container(
                                          padding: const EdgeInsets.all(5.0),
                                          margin: const EdgeInsets.all(5.0),
                                          height: height,
                                          width: width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: AppColor.black,
                                                  style: BorderStyle.solid,
                                                  width: 2.0)),
                                          child: TextField(
                                              controller: myClassController,
                                              expands: false,
                                              cursorColor: Colors.black,
                                              decoration: const InputDecoration(
                                                hintText: "Enter the class",
                                                hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none),
                                              ))),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                    ],
                                  ),
                                ),
                              const CustomWidth(),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BoldText(
                                        text: "UN No",
                                        size: 18.0,
                                        color: AppColor.black),
                                    Container(
                                        padding: const EdgeInsets.all(5.0),
                                        margin: const EdgeInsets.all(5.0),
                                        height: height,
                                        width: width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: AppColor.black,
                                                style: BorderStyle.solid,
                                                width: 2.0)),
                                        child: TextField(
                                            controller: unNoController,
                                            expands: false,
                                            cursorColor: Colors.black,
                                            decoration: const InputDecoration(
                                              hintText: "Enter the Un No",
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ))),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, bottom: 10.0),
                          child: Center(
                            child: Container(
                                padding: const EdgeInsets.all(1),
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.orange[400])),
                                    onPressed: () {
                                      Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookingDetails2(
                                                          data: ['data'])))
                                          .whenComplete(() => {});
                                    },
                                    child: WeightText(
                                        text: "Next",
                                        size: 20.0,
                                        color: AppColor.black))),
                          ),
                        )
                      ]),
                ],
              ),
            ]),
          ),
        ));
  }

  Map<String, dynamic> data = {
    'icdFrom': 'icdFromValue',
    'icdTo': 'icdToValue',
    'loadingPort': 'loadingPortValue',
    'destinationPort': 'destinationPortValue',
    'myQuantity': 'newQuantity',
    'type': 'updatedTypeValue',
    'size': 'sizedUpdate',
    'commodity': 'updatedCommodityValue',
  };
}
