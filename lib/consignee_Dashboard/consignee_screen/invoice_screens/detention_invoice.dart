import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transvision_app1/MyComponent/constant/colors.dart';
import 'package:transvision_app1/MyComponent/constant/textField.dart';
import 'package:transvision_app1/MyComponent/text.dart';

class DetentionInvoice extends StatefulWidget {
  const DetentionInvoice({Key? key}) : super(key: key);

  @override
  State<DetentionInvoice> createState() => _DetentionInvoiceState();
}

class _DetentionInvoiceState extends State<DetentionInvoice> {
  TextEditingController detentionInvoiceFromDate = TextEditingController();
  TextEditingController detentionInvoiceToDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WeightText(
          text: "Detention Invoice",
          size: 20.0,
          color: Colors.black,
        ),
        backgroundColor: Colors.orange[300],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            child: SafeArea(
              child: Column(
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
                        TextFormField(
                          controller: detentionInvoiceFromDate,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1990),
                                lastDate: DateTime(2030));

                            if (pickedDate != null) {
                              debugPrint(pickedDate.toString());
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              debugPrint(formattedDate.toString());

                              setState(() {
                                detentionInvoiceFromDate.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              debugPrint("Date is not selected");
                            }
                          },
                          decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.calendar_month),
                              contentPadding: const EdgeInsets.only(left: 15),
                              hintText: "Please Select Date",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      width: 1.0, style: BorderStyle.solid))),
                        ),
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
                            TextFormField(
                              controller: detentionInvoiceToDate,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1990),
                                    lastDate: DateTime(2030));

                                if (pickedDate != null) {
                                  debugPrint(pickedDate.toString());
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  debugPrint(formattedDate.toString());

                                  setState(() {
                                    detentionInvoiceToDate.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  {
                                    debugPrint("Time Is not Selected");
                                  }
                                }
                              },
                              decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.calendar_month),
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  hintText: "Please Select Date",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          width: 1.0,
                                          style: BorderStyle.solid))),
                            )
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
        ],
      ),
    );
  }
}
