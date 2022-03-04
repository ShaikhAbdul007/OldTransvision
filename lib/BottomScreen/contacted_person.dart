import 'package:flutter/material.dart';

class ContactedPerson extends StatelessWidget {
  const ContactedPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget contactField(String hint, String label) {
      return TextField(
        decoration: InputDecoration(
            hintText: hint,
            labelText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      );
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
                    contactField("Enter Contacted Name", "Contacted Person"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    contactField("Enter Mobile No", "Mobile No"),
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
