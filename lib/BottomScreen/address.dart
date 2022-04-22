import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transvision_app1/Model/users_details.dart';
import 'package:http/http.dart' as http;
import 'package:transvision_app1/MyComponent/text.dart';


class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  var add = "";
  var add2 = "";
  var add3 = "";
  var city = "";
  var country = "";
  var email = "";
  var email1 = "";
  var email2 = "";
  var mail = "";
  var mobNo = "";
  var panNo = "";
  var pinCode = "";
  var state = "";
  var stateCode = "";
  var staxNo = "";

  late Future<UserDetails> userDetails;

  Future<UserDetails> getUserApi() async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/consigneedata?username=c1001"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return UserDetails.fromJson(data);
    } else {
      throw Exception('Failed to API');
    }
  }

  @override
  void initState() {
    super.initState();
    userDetails = getUserApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const WeightText(
            text: "Address",
            size: 20.0,
            color: Colors.black,
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        FutureBuilder(
                            future: getUserApi(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return TextField(
                                  readOnly: true,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                      // labelText: "House/Flat No",
                                      hintText: snapshot.data.add1,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: FutureBuilder(
                                  future: getUserApi(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return TextField(
                                        readOnly: true,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                            // labelText: "House/Flat No",
                                            hintText: snapshot.data.add2,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      );
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: FutureBuilder(
                                  future: getUserApi(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return TextField(
                                        readOnly: true,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                            // labelText: "House/Flat No",
                                            hintText: snapshot.data.add3,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      );
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: FutureBuilder(
                                  future: getUserApi(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return TextField(
                                        readOnly: true,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                            // labelText:"City",
                                            hintText: snapshot.data.city,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      );
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: FutureBuilder(
                                  future: getUserApi(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return TextField(
                                        readOnly: true,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                            // labelText:"State",
                                            hintText: snapshot.data.state,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      );
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: FutureBuilder(
                              future: getUserApi(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return TextField(
                                    readOnly: true,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        // labelText:"Country",
                                        hintText: snapshot.data.country,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  );
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: FutureBuilder(
                              future: getUserApi(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return TextField(
                                    readOnly: true,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        // labelText:"PinCode",
                                        hintText: snapshot.data.pincode,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  );
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FutureBuilder(
                              future: getUserApi(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return TextField(
                                    readOnly: true,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        // labelText:"Pan-No",
                                        hintText: snapshot.data.panno,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  );
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: FutureBuilder(
                              future: getUserApi(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return TextField(
                                    readOnly: true,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        // labelText:"Mobile No",
                                        hintText: snapshot.data.mobno,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  );
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FutureBuilder(
                              future: getUserApi(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return TextField(
                                    readOnly: true,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        // labelText:"Primary E-mail Id",
                                        hintText: snapshot.data.email,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  );
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FutureBuilder(
                              future: getUserApi(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return TextField(
                                    readOnly: true,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        // labelText:"Secondary E-mail Id",
                                        hintText: snapshot.data.email1,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  );
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, bottom: 10.0, top: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: (() {}),
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
                                  Icon(Icons.save_sharp, color: Colors.black),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  WeightText(
                                      text: "Save",
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
                                left: 50.0,
                              ),
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color: Colors.green[400]),
                              child: Row(
                                children: const [
                                  Icon(Icons.edit, color: Colors.black),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  WeightText(
                                      text: "Edit",
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
              )
            ],
          ),
        ));
  }
}
