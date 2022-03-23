import 'package:flutter/material.dart';

class DestinationPortDropDownButton extends StatefulWidget {
  final List<dynamic> listItems;
  const DestinationPortDropDownButton({Key? key, required this.listItems})
      : super(key: key);

  @override
  State<DestinationPortDropDownButton> createState() =>
      _DestinationPortDropDownButtonState();
}

class _DestinationPortDropDownButtonState
    extends State<DestinationPortDropDownButton> {
  dynamic _destinationPortSelectedValue;

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
          value: _destinationPortSelectedValue,
          style: const TextStyle(color: Colors.black),
          items:
              widget.listItems.map<DropdownMenuItem<dynamic>>((dynamic value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Text("$value"),
            );
          }).toList(),
          hint: const Text(
            "Select",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onChanged: (value) {
            setState(() {
              _destinationPortSelectedValue = value;
            });
          },
        ),
      ),
    );
  }
}
