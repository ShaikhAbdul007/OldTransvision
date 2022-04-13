import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transvision_app1/MyComponent/colors.dart';
import 'package:transvision_app1/MyComponent/text.dart';
import 'package:transvision_app1/MyComponent/textFeild.dart';

class DoSlip extends StatefulWidget {
  const DoSlip({Key? key}) : super(key: key);

  @override
  State<DoSlip> createState() => _DoSlipState();
}

class _DoSlipState extends State<DoSlip> {
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
        appBar: AppBar(
          title: const Text(
            "Delivery Order",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.orange[300],
          centerTitle: true,
        ),
        body: ListView(children: [
          Container(
            color: Colors.white,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/do.png",
                    fit: BoxFit.fill,
                    height: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeightText(
                            text: "From Date",
                            size: 18.0,
                            color: AppColor.black),
                        const SizedBox(
                          height: 8.0,
                        ),
                        getTextField("Select The Date"),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WeightText(
                                text: "To Date",
                                size: 18.0,
                                color: AppColor.black),
                            const SizedBox(
                              height: 8.0,
                            ),
                            getTextField1("Select The Date")
                          ],
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WeightText(
                                text: "Reference Number",
                                size: 18.0,
                                color: AppColor.black),
                            const SizedBox(
                              height: 8.0,
                            ),
                            const MyTextField(hint: "Enter The Reference No")
                          ],
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.refresh_outlined,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    WeightText(
                                        text: "Refresh",
                                        size: 18.0,
                                        color: Colors.black),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
