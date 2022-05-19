import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transvision_app1/Model/user_profile_model/userDetails.dart';
import 'package:transvision_app1/MyComponent/text.dart';
import 'package:transvision_app1/SharedPrefernce/sharedpreferences.dart';

class ContactedPerson extends StatefulWidget {
  const ContactedPerson({Key? key}) : super(key: key);

  @override
  State<ContactedPerson> createState() => _ContactedPersonState();
}

class _ContactedPersonState extends State<ContactedPerson> {
  @override
  Widget build(BuildContext context) {
    Future<UserDetails> getContactedPersonApi() async {
      Shared shared = Shared();
      var username = shared.retrieveUserName();
      final response = await http.get(Uri.parse(
          "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/consigneedata?username=$username"));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return UserDetails.fromJson(data);
      } else {
        throw Exception('Failed to API');
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const WeightText(
              text: "Contacted Person", size: 20.0, color: Colors.black),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Column(children: [
              Image.asset("assets/images/contact.png"),
              const WeightText(
                  text: "Contact Person", size: 25.0, color: Colors.black),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
                child: Column(
                  children: [
                    FutureBuilder(
                        future: getContactedPersonApi(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return TextField(
                              readOnly: true,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  // labelText: "Contacted person",
                                  hintText: snapshot.data.contactperson,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FutureBuilder(
                        future: getContactedPersonApi(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return TextField(
                              readOnly: true,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  // labelText: "Mobile No",
                                  hintText: snapshot.data.contno,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, bottom: 10.0, top: 50.0),
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
                                  Icon(Icons.system_update_alt,
                                      color: Colors.black),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  WeightText(
                                      text: "Update",
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
              ),
            ])
          ],
        ));
  }
}
