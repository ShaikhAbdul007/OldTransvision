import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/colors.dart';
import 'package:transvision_app1/MyComponent/sizedbox.dart';
import 'package:transvision_app1/MyComponent/text.dart';
import 'package:transvision_app1/MyComponent/textfeild.dart';
import 'package:transvision_app1/utils/routes.dart';
import '../../MyComponent/ddb2.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetails();
}

class _BookingDetails extends State<BookingDetails> {
  final url = "http://192.168.1.143:9999/SqlJobApi/SqlInterface.svc/pol/";

  final items = ['NavaSiva', 'Patna', 'Dubai', 'Singapoor', 'Chennai'];
  final items1 = ['AbuDabi', ' Dubai', ' Sharjaha', 'Chennai'];
  final items2 = [' Patna', 'Mahim', ' Dubai', ' Shimla', 'Kerala'];
  final items3 = [
    'ICD NavaSiva',
    'ICD Patna',
    'ICD Dubai',
    'ICD Singapoor',
    'ICD Chennai'
  ];
  final item4 = [20, 40];
  final item5 = ['FR', 'OT', 'ISO', 'HD', 'GP'];
  final item6 = ['General', 'Hazardous', 'ODC'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        title: NormalText(
            text: "Booking Details", size: 20.0, color: AppColor.black),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(text: "IDC From", size: 18.0, color: AppColor.black),
                const SizedBox(
                  height: 4.0,
                ),
                DropDownButton(
                  listItems: items,
                )
              ],
            ),
            const Customerheight(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(
                    text: "Port Of Loading ",
                    size: 18.0,
                    color: AppColor.black),
                const SizedBox(
                  height: 4.0,
                ),
                DropDownButton(
                  listItems: items1,
                )
              ],
            ),
            const Customerheight(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(
                    text: "Port Of Destination",
                    size: 18.0,
                    color: AppColor.black),
                const SizedBox(
                  height: 4.0,
                ),
                DropDownButton(
                  listItems: items2,
                )
              ],
            ),
            const Customerheight(),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              BoldText(text: "IDC To", size: 18.0, color: AppColor.black),
              const SizedBox(
                height: 4.0,
              ),
              DropDownButton(
                listItems: items3,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText(
                            text: "Quantity",
                            size: 18.0,
                            color: AppColor.black),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const CustomTextFeild(hint: "Enter Quantity")
                      ],
                    ),
                  ),
                  const CustomWidth(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText(
                            text: "Size", size: 18.0, color: AppColor.black),
                        const SizedBox(
                          height: 4.0,
                        ),
                        DropDownButton(
                          listItems: item5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Customerheight(),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText(
                            text: "Type", size: 18.0, color: AppColor.black),
                        const SizedBox(
                          height: 4.0,
                        ),
                        DropDownButton(listItems: item4)
                      ],
                    ),
                  ),
                  const CustomWidth(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText(
                            text: "Commodity",
                            size: 18.0,
                            color: AppColor.black),
                        const SizedBox(
                          height: 4.0,
                        ),
                        DropDownButton(listItems: item6)
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, top: 5.0),
                child: Center(
                  child: Container(
                      padding: const EdgeInsets.all(1),
                      height: 50,
                      width: 120,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MyRoutes.bookingDetailsRoute2);
                          },
                          child: WeightText(
                              text: "Next",
                              size: 20.0,
                              color: AppColor.black))),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
