import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/colors.dart';

class MyTextField extends StatelessWidget {
  final String hint;

  const MyTextField({Key? key, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColor.black,
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hint;
  const CustomTextField({Key? key, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.all(5.0),
        height: 77,
        width: 220,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: AppColor.black, style: BorderStyle.solid, width: 2.0)),
        child: const TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Enter the Quantity",
              hintStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            )));
  }
}
