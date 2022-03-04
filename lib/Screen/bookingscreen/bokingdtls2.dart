import 'package:flutter/material.dart';

class BookingDetails2 extends StatelessWidget {
  const BookingDetails2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget getField(String hint) {
      return Container(
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: Colors.black, style: BorderStyle.solid, width: 1.0)),
        child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            )),
      );
    }

    getheight() {
      return const SizedBox(
        height: 15.0,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text("Booking Details"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Freight/Container",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                getheight(),
                getField("Freight/Container"),
                getheight(),
                const Text("Weight/Cont in kgs.",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                getheight(),
                getField("Weight/Cont in kgs."),
                getheight(),
                const Text("Rate Aggred by",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                getheight(),
                getField("Rate Aggred by"),
                getheight(),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange[300]),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.add_circle, color: Colors.black),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("Add Record",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                ),
                getheight(),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return const Card(
                      child: ListTile(
                        title: Text("Abdul"),
                        leading: Icon(Icons.list),
                        trailing: Text(
                          "All record",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
                ),
                getheight(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: (() {}),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green[300]),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.check_circle, color: Colors.black),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text("Submit",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        width: 0.0,
                      )),
                      Expanded(
                          child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red[900]),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.close, color: Colors.black),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text("Cancel",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700)),
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
    );
  }
}
