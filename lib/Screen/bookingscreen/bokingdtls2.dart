import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/colors.dart';
import 'package:transvision_app1/MyComponent/sizedbox.dart';
import 'package:transvision_app1/MyComponent/text.dart';
import 'package:transvision_app1/MyComponent/textfeild.dart';

class BookingDetails2 extends StatelessWidget {
  const BookingDetails2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                WeightText(
                    text: "Freight/Container",
                    size: 18.0,
                    color: AppColor.black),
                const CustomHeight(),
                const CustomTextField(hint: "Freight/Container"),
                const CustomHeight(),
                WeightText(
                    text: "Weight/Cont in kgs.",
                    size: 18.0,
                    color: AppColor.black),
                const CustomHeight(),
                const CustomTextField(hint: "Weight/Cont in kgs."),
                const CustomHeight(),
                WeightText(
                    text: "Rate Aggred by", size: 18.0, color: AppColor.black),
                const CustomHeight(),
                const CustomTextField(hint: "Rate Aggred by"),
                const CustomHeight(),
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
                const CustomHeight(),
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
                const CustomHeight(),
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
