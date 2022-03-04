import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transvision_app1/utils/routes.dart';

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

  Widget getButton() {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.loginRoute);
          },
          child: const Text(
            "Refersh",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Reports"),
        centerTitle: false,
        shadowColor: Colors.black,
        backgroundColor: Colors.orange[300],
        elevation: 0.0,
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
              const Text(
                "Reports",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontStyle: FontStyle.italic),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
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
                    getButton()
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
