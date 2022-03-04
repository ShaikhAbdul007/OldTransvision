import 'package:flutter/material.dart';

class DropDownButton3 extends StatefulWidget {
  final List<int> listItems;

  const DropDownButton3({Key? key, required this.listItems}) : super(key: key);

  @override
  State<DropDownButton3> createState() => _DropDownButton3State();
}

class _DropDownButton3State extends State<DropDownButton3> {
  @override
  Widget build(BuildContext context) {
    int? _chosenValue1;

    return Container(
      padding: const EdgeInsets.only(top: 2.0, left: 8.0, right: 8.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(
              width: 1.0, style: BorderStyle.solid, color: Colors.black)),
      child: DropdownButtonHideUnderline(
          child: DropdownButton<int>(
              isExpanded: true,
              value: _chosenValue1,
              style: const TextStyle(color: Colors.black),
              items: widget.listItems.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              hint: const Text(
                "Please Select",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              onChanged: (int? newValue) {
                setState(() {
                  _chosenValue1 = newValue!;
                });
              })),
    );
  }
}
