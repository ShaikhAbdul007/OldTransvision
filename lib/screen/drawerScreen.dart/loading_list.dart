import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transvision_app1/Model/vessel.dart';
import 'package:transvision_app1/Model/voyage.dart';
import 'package:transvision_app1/MyComponent/DropDown/vessel.dart';
import 'package:transvision_app1/MyComponent/DropDown/voyage.dart';
import 'package:transvision_app1/MyComponent/colors.dart';
import 'package:transvision_app1/MyComponent/text.dart';
import 'package:http/http.dart' as http;
import '../../Model/loadingdata.dart';

class LoadingList extends StatefulWidget {
  const LoadingList({Key? key}) : super(key: key);

  @override
  State<LoadingList> createState() => _LoadingListState();
}

class _LoadingListState extends State<LoadingList> {
  var container = "";
  var port = "";
  var size = "";
  var weight = "";
  var fPOD = "";
  var iMCO = "";
  var status = "";
  var sTOW = "";
  var remark = "";
  var trans = "";

  dynamic voyageValue = "";
  List<Vessel> vesselList = [];
  List<Voyage> voyageList = [];
  List<LoadingData> loadingDataList = [];

  Future<List<Vessel>> getVesselApi() async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/vesselname?partycode=P1697"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      vesselList = [];
      for (Map i in data) {
        vesselList.add(Vessel.fromJson(i));
      }
      return vesselList;
    } else {
      return vesselList;
    }
  }

  Future<List<Voyage>> getVoyageApi(dynamic value) async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/voyagename?partycode=P1697&vesselname=$value"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      voyageList = [];
      for (Map i in data) {
        voyageList.add(Voyage.fromJson(i));
      }
      return voyageList;
    }
    return voyageList;
  }

  voyageUpdated(dynamic value) {
    setState(() {
      voyageValue = value;
    });
    getVoyageApi(value);
  }

  Future<List<LoadingData>> getLoadingDataApi() async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/LoadingList?vesselname=D ANGELS&voyagename=0012A&partycode=P1697"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      loadingDataList = [];
      for (Map i in data) {
        loadingDataList.add(LoadingData.fromJson(i));
      }
      return loadingDataList;
    } else {
      throw Exception("Api Loading Failed");
    }
  }

  @override
  void initState() {
    super.initState();
    getVesselApi();
    getLoadingDataApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Text("Loading List"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/vassel.png",
                  fit: BoxFit.cover,
                  height: 250.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WeightText(
                          text: "Vessel", size: 18.0, color: AppColor.black),
                      FutureBuilder(
                          future: getVesselApi(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return VesselDropDown(
                                listItems: vesselList,
                                notifyParent: voyageUpdated,
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          }),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WeightText(
                              text: "Voyage",
                              size: 18.0,
                              color: AppColor.black),
                          FutureBuilder(
                              future: getVesselApi(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return VoyageDropDown(listItems: voyageList);
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              }),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => buildSheet());
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.75,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    Icons.refresh_outlined,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  WeightText(
                                      text: "Refresh",
                                      size: 18,
                                      color: Colors.black),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(9)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  buildSheet() => Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
      ),
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder(
          future: getLoadingDataApi(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Card(
                child: ListView.builder(
                    itemCount: loadingDataList.length,
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        title: Text(
                          'Port : ${snapshot.data[index].port}'
                          "   "
                          'Size : ${snapshot.data[index].size}',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        subtitle: Text(
                          'FPOD : ${snapshot.data[index].fpod}'
                          "   "
                          "   "
                          'Type: ${snapshot.data[index].type}',
                          style: const TextStyle(fontSize: 15.0),
                        ),
                        leading: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        backgroundColor: Colors.orange[50],
                        controlAffinity: ListTileControlAffinity.leading,
                        trailing: Text(snapshot.data[index].container,
                            style: const TextStyle(fontSize: 15.0)),
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
                                                    .data[index].weight
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
                                                    .data[index].imco,
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
                                                    .data[index].status,
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
                                                    .data[index].stow,
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
                                                    .data[index].remark,
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
                                                    .data[index].trans,
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
