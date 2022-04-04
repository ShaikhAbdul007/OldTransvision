import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/UsersDetails.dart';

class ContactedPerson extends StatefulWidget {
  const ContactedPerson({Key? key}) : super(key: key);

  @override
  State<ContactedPerson> createState() => _ContactedPersonState();
}

class _ContactedPersonState extends State<ContactedPerson> {
  @override
  Widget build(BuildContext context) {

    // var contactperson = "";
    // var contno = "";
    late Future<UserDetails> contactedUserDetails;

    Future<UserDetails> getContactedPersonApi()async{
      final response = await http.get(Uri.parse("http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/consigneedata?username=c1001"));
      var data= jsonDecode(response.body.toString());
      if(response.statusCode==200){
        return UserDetails.fromJson(data);
      }  else {
        throw Exception('Failed to API');
      }

    }
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      contactedUserDetails = getContactedPersonApi();
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Text("Contacted person"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Column(children: [
              Image.asset("assets/images/contact.png"),
              const Text(
                "Contact Person",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
                child: Column(
                  children: [
                    FutureBuilder(
                        future: getContactedPersonApi(),
                        builder: (BuildContext context,
                            AsyncSnapshot snapshot) {
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
                          );}
                            else {
                            return const CircularProgressIndicator();
                          }
                        }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FutureBuilder(
                        future: getContactedPersonApi(),
                        builder: (BuildContext context,
                            AsyncSnapshot snapshot) {
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
                            );}
                          else {
                            return const CircularProgressIndicator();
                          }
                        }),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.only(left: 30.0),
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.orange[400]),
                              child: Row(
                                children: const [
                                  Icon(Icons.update_rounded),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text("Update")
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.only(left: 30.0),
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.green[200]),
                                child: Row(
                                  children: const [
                                    Icon(Icons.edit_outlined),
                                    SizedBox(width: 10.0),
                                    Text("Edit")
                                  ],
                                ),
                              ),
                            ),
                          )
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
