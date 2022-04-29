import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transvision_app1/Model/icdTo.dart';
import 'package:transvision_app1/Model/destinationPort.dart';
import 'package:transvision_app1/Model/icdFrom.dart';
import 'package:transvision_app1/Model/loadingPort.dart';
import 'package:transvision_app1/Model/sizedModel.dart';
import 'package:transvision_app1/MyComponent/DropDown/commodity.dart';
import 'package:transvision_app1/MyComponent/DropDown/loading.dart';
import 'package:transvision_app1/MyComponent/constant/colors.dart';
import 'package:transvision_app1/MyComponent/DropDown/destinationOfPort.dart';
import 'package:transvision_app1/MyComponent/DropDown/icdFrom.dart';
import 'package:transvision_app1/MyComponent/DropDown/icd_To.dart';
import 'package:transvision_app1/MyComponent/DropDown/size.dart';
import 'package:transvision_app1/MyComponent/constant/sizedBox.dart';
import 'package:transvision_app1/MyComponent/constant/textField.dart';
import 'package:transvision_app1/MyComponent/DropDown/type.dart';
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
  dynamic idcFromPortValue = "";
  dynamic loadingPortValue = "";
  dynamic sizedUpdate = "";

  // var d= "http://portal.transvisionshipping.com:"
  final icdForm = TextEditingController();
  List<LoadingPort> loadingPort = [];
  List<IcdFrom> idcFromPort = [];
  List<IcdTo> icdToPort = [];
  List<DestinationPort> destinationPort = [];
  List<SizedModel> sizeModel = [];

  Future<List<LoadingPort>> getLoadingPortApi() async {
    final response = await http.get(
        Uri.parse("http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/pol/"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      loadingPort = [];
      for (Map i in data) {
        loadingPort.add(LoadingPort.fromJson(i));
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
    });
    getDestinationPortApi(value);
  }

  Future<List<IcdFrom>> getIcdFromPortApi() async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/icdfrom/"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      idcFromPort = [];
      for (Map i in data) {
        idcFromPort.add(IcdFrom.fromJson(i));
      }
      return idcFromPort;
    } else {
      return idcFromPort;
    }
  }

  Future<List<IcdTo>> getIcdToApi(dynamic value) async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/icdto?icd=$value"));
    var data = newMethod(response);
    if (response.statusCode == 200) {
      icdToPort = [];
      for (Map i in data) {
        icdToPort.add(IcdTo.fromJson(i));
      }
      return icdToPort;
    } else {
      return icdToPort;
    }
  }

  newMethod(http.Response response) => jsonDecode(response.body.toString());

  icdFromUpdated(dynamic value) {
    setState(() {
      idcFromPortValue = value;
    });
    getIcdToApi(value);
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
    } else {
      return sizeModel;
    }
  }

  sizeUpdated(dynamic value) {
    setState(() {
      sizedUpdate = value;
    });
    getTypeApi(value);
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
                                    listItems: icdToPort);
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
                                  const CustomTextField(hint: "Enter Quantity")
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
                                              listItems: sizeModel);
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
                                  const CommodityDropDownButton(),
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
                                      const CustomTextField(
                                          hint: "Enter Quantity"),
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
                                    const CustomTextField(hint: "Enter UN No"),
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
                                      Navigator.pushNamed(context,
                                          MyRoutes.bookingDetailsRoute2);
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
}
