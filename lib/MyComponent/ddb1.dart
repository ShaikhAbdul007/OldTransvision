import 'package:flutter/material.dart';

class DropDownButton1 extends StatefulWidget {
  final List<String> listItems;
  const DropDownButton1({Key? key, required this.listItems}) : super(key: key);

  @override
  State<DropDownButton1> createState() => _DropDownButton1State();
}

class _DropDownButton1State extends State<DropDownButton1> {
  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2.0, style: BorderStyle.solid)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: _chosenValue,
          style: const TextStyle(color: Colors.black),
          items: widget.listItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: const Text(
            "Select",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onChanged: (value) {
            setState(() {
              _chosenValue = value!;
            });
          },
        ),
      ),
    );
  }
}
