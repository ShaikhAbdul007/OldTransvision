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

class CustomTextFeild extends StatelessWidget {
  final String hint;
  const CustomTextFeild({Key? key, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 72,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: AppColor.black, style: BorderStyle.solid, width: 1.0)),
        child: const TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Enter The Quantity",
              hintStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            )));
  }
}
