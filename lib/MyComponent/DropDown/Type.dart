import 'package:flutter/material.dart';

class TypeDropDownButton extends StatefulWidget {
  final List<dynamic> listItems;
  const TypeDropDownButton({Key? key, required this.listItems})
      : super(key: key);

  @override
  State<TypeDropDownButton> createState() => _TypeDropDownButtonState();
}

class _TypeDropDownButtonState extends State<TypeDropDownButton> {
  @override
  Widget build(BuildContext context) {
    dynamic selectedValue;

    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2.0, style: BorderStyle.solid)),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<dynamic>(
          isExpanded: true,
          value: selectedValue,
          style: const TextStyle(color: Colors.black),
          items:
              widget.listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
            return DropdownMenuItem<dynamic>(
              value: item,
              child: Text("$item"),
            );
          }).toList(),
          hint: const Text(
            "Select",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
        ),
      ),
    );
  }
}
