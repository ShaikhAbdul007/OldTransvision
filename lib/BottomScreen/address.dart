import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transvision_app1/Model/UsersDetails.dart';
import 'package:transvision_app1/utils/routes.dart';
import 'package:http/http.dart' as http;

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  var add1 = TextEditingController();
  var add2 = TextEditingController();
  var add3 = TextEditingController();
  var city = TextEditingController();
  var contno = TextEditingController();
  var country = TextEditingController();
  var email = TextEditingController();
  var email1 = TextEditingController();
  var email2 = TextEditingController();
  var mail = TextEditingController();
  var mobno = TextEditingController();
  var panno = TextEditingController();
  var pincode = TextEditingController();
  var state = TextEditingController();
  var statecode = TextEditingController();
  var staxno = TextEditingController();

   List<UserDetails> userDetails = [];

  Future<List<UserDetails>> getUserApi() async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/consigneedata?username=c100"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userDetails.add(UserDetails.fromJson(i));
      }
      return userDetails;
    } else {
      return userDetails;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Text("Address"),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
          child: SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    TextField(
                      controller: add1,
                      onChanged: (val){
                        setState(() {
                         userDetails()=> val;
                        });
                      },
                      readOnly: true,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          labelText: "House/Flat No",
                          hintText: " House/Flat No",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          labelText: "LandMark",
                          hintText: " LandMark",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                labelText: "City",
                                hintText: " Enter Your City",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                labelText: "State",
                                hintText: " Enter Your State",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
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
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            labelText: "Country",
                            hintText: " Enter Your Country",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            labelText: "Pin-Code",
                            hintText: " Enter Your Pin-Code",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            labelText: "Pan-No",
                            hintText: " Enter Your Pan-No",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
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
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            labelText: "Mobile No",
                            hintText: " Enter Your Mobile No",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            labelText: "Primary E-mail",
                            hintText: " Enter Your Primary E-mail",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            labelText: "Secondary E-mail",
                            hintText: " Enter Your Secondary E-mail",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MyRoutes.bookingDetailsRoute);
                      },
                      child: Center(
                        child: Container(
                          height: 50.0,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.orange[400],
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.save_sharp,
                                size: 25.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "Save",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MyRoutes.bookingDetailsRoute);
                      },
                      child: Center(
                        child: Container(
                          height: 50.0,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.green[200],
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.edit_outlined,
                                size: 25.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "Edit",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
