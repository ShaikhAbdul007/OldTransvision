import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../MyComponent/text.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  TextEditingController date = TextEditingController();
  TextEditingController date1 = TextEditingController();

  @override
  void initState() {
    date.text = "";
    date1.text = "";
    super.initState();
  }

  Widget getTextField(String hint) {
    return TextFormField(
      controller: date,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1990),
            lastDate: DateTime(2030));

        if (pickedDate != null) {
          debugPrint(pickedDate.toString());
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          debugPrint(formattedDate.toString());

          setState(() {
            date.text = formattedDate; //set output date to TextField value.
          });
        } else {
          {
            debugPrint("Time Is not Selected");
          }
        }
      },
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.calendar_month),
          contentPadding: const EdgeInsets.only(left: 15),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(width: 1.0, style: BorderStyle.solid))),
    );
  }

  Widget getTextField1(String hint) {
    return TextFormField(
      controller: date1,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1990),
            lastDate: DateTime(2030));

        if (pickedDate != null) {
          debugPrint(pickedDate.toString());
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          debugPrint(formattedDate.toString());

          setState(() {
            date1.text = formattedDate; //set output date to TextField value.
          });
        } else {
          debugPrint("Date is not selected");
        }
      },
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.calendar_month),
          contentPadding: const EdgeInsets.only(left: 15),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(width: 1.0, style: BorderStyle.solid))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            const WeightText(text: "Reports", size: 20.0, color: Colors.black),
        centerTitle: false,
        shadowColor: Colors.black,
        backgroundColor: Colors.orange[300],
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/reports.png",
                fit: BoxFit.fill,
              ),
              const WeightText(
                  text: "Reports", size: 25.0, color: Colors.black),
              Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                child: Column(
                  children: [
                    getTextField("Select Date"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    getTextField1("Select Date"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: (() {}),
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.orange[300]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.refresh_outlined, color: Colors.black),
                            SizedBox(
                              width: 5.0,
                            ),
                            WeightText(
                                text: "Refresh",
                                size: 18.0,
                                color: Colors.black),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
