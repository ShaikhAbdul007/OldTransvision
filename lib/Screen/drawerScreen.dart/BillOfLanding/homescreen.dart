import 'package:flutter/material.dart';

import '../../../MyComponent/colors.dart';
import '../../../MyComponent/text.dart';
import '../../../MyComponent/textFeild.dart';

class BlHomeScreen extends StatefulWidget {
  const BlHomeScreen({Key? key}) : super(key: key);

  @override
  State<BlHomeScreen> createState() => _BlHomeScreenState();
}

class _BlHomeScreenState extends State<BlHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/loading.png",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child:
                  WeightText(text: "Search", size: 20.0, color: AppColor.black),
            ),
            const SizedBox(height: 5.0),
            // DropDownButton(listItems: item),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5, right: 8.0),
            )
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: MyTextField(hint: "Enter Details")),
        Padding(
          padding: const EdgeInsets.only(
              left: 25.0, right: 25.0, bottom: 10.0, top: 20.0),
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
                      WeightText(
                          text: "Refresh", size: 18.0, color: Colors.black),
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
                    left: 50.0,
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.green[400]),
                  child: Row(
                    children: const [
                      Icon(Icons.edit, color: Colors.black),
                      SizedBox(
                        width: 5.0,
                      ),
                      WeightText(text: "Edit", size: 18.0, color: Colors.black),
                    ],
                  ),
                ),
              )),
            ],
          ),
        )
      ]),
    );
  }
}
