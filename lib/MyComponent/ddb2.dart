import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  final List<dynamic> listItems;

  const DropDownButton({Key? key, required this.listItems}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  dynamic _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2.0, style: BorderStyle.solid)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          isExpanded: true,
          value: _chosenValue,
          style: const TextStyle(color: Colors.black),
          items:
              widget.listItems.map<DropdownMenuItem<dynamic>>((dynamic value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Text("$value"),
            );
          }).toList(),
          hint: const Text(
            "Please Select",
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
