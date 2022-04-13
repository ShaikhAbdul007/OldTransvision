import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transvision_app1/MyComponent/text.dart';

class BillSummary extends StatefulWidget {
  const BillSummary({Key? key}) : super(key: key);

  @override
  State<BillSummary> createState() => _BillSummaryState();
}

class _BillSummaryState extends State<BillSummary> {
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
            debugPrint("Time is not selected");
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
            date1.text = formattedDate;
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
        appBar: AppBar(
          title: const Text(
            "Bill Summary",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.orange[300],
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Image.asset(
                "assets/images/bill.png",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "From Date",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    getTextField("Select Date"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text("To Date",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 8.0,
                    ),
                    getTextField1("Select Date"),
                    const SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25.0, bottom: 10.0),
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
                                Icon(Icons.refresh_outlined, color: Colors.black),
                                SizedBox(
                                  width: 5.0,
                                ),
                                WeightText(text: "Refresh", size: 18.0, color: Colors.black),

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
                              left: 30.0,
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.orange[300]),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.edit_attributes_outlined, color: Colors.black),
                                SizedBox(
                                  width: 5.0,
                                ),
                               WeightText(text: "All Records", size: 18.0, color: Colors.black),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
