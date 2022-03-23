import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transvision_app1/Model/IcdTo.dart';
import 'package:transvision_app1/MyComponent/colors.dart';
import 'package:transvision_app1/MyComponent/destinationOfPort.dart';
import 'package:transvision_app1/MyComponent/icdFromDropDown.dart';
import 'package:transvision_app1/MyComponent/icdToDropDown.dart';
import 'package:transvision_app1/MyComponent/sizedbox.dart';
import 'package:transvision_app1/MyComponent/text.dart';
import 'package:transvision_app1/MyComponent/textfeild.dart';
import 'package:transvision_app1/utils/routes.dart';
import '../../Model/IcdFrom.dart';
import '../../Model/LoadingPort.dart';
import '../../MyComponent/loadingPortdropdown.dart';
import 'package:http/http.dart' as http;

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetails();
}

class _BookingDetails extends State<BookingDetails> {

  final items = [];
  final items1 = [];
  final items2 = [];
  final items3 = [];
  final item4 = [];
  final item5 = [];
  final item6 = [];
  final icdForm= TextEditingController();
  List<LoadingPort> loadingPort = [];
  List<IcdFrom> idcFromPort = [];
  List<IcdTo> icdToPort=[];

  Future<List<LoadingPort>> getLoadingPortApi() async {
    final response = await http.get(
        Uri.parse("http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/pol/"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        // print(i['portname']);
        loadingPort.add(LoadingPort.fromJson(i));
      }
      return loadingPort;
    } else {
      return loadingPort;
    }
  }

  Future<List<IcdFrom>> getIcdFromPortApi() async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/icdfrom/"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        idcFromPort.add(IcdFrom.fromJson(i));
      }
      return idcFromPort;
    } else {
      return idcFromPort;
    }
  }

  Future<List<IcdTo>> getIcdToApi()async{
    final response= await http.get(Uri.parse("http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/icdto?icd=icd"));
    var data= jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        icdToPort.add(IcdTo.fromJson(i));
      }
      return icdToPort;
    }else{
      return icdToPort;
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoadingPortApi();
    getIcdFromPortApi();
    getIcdToApi();
     }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.bgColor,
          title: NormalText(
              text: "Booking Details", size: 20.0, color: AppColor.black),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
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
                        return  IcdFromDropDownButton(
                          listItems: idcFromPort,
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
                          return LoadingPortDropDownButton(listItems: loadingPort);
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
                    DestinationPortDropDownButton(
                      listItems: items2,
                    )
                  ],
                ),
                const CustomHeight(),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  BoldText(text: "IDC To", size: 18.0, color: AppColor.black),
                  const SizedBox(
                    height: 4.0,
                  ),
                  FutureBuilder(
                      future: getIcdFromPortApi(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return  IcdToDropDownButton(listItems: icdToPort);
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
                              height: 15.0,
                            ),
                            const CustomTextFeild(hint: "Enter Quantity")
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
                            const SizedBox(
                              height: 4.0,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, top: 5.0),
                    child: Center(
                      child: Container(
                          padding: const EdgeInsets.all(1),
                          height: 50,
                          width: 120,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, MyRoutes.bookingDetailsRoute2);
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
        ));
  }
}
