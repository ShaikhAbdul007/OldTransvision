import 'package:flutter/material.dart';

class IcdFromDropDownButton extends StatefulWidget {
  final List<dynamic> listItems;
  final dynamic icdFromValue;
  final Function(dynamic value) notifyParent;

  const IcdFromDropDownButton({
    Key? key,
    required this.listItems,
    required this.notifyParent,
    this.icdFromValue,
  }) : super(key: key);

  @override
  State<IcdFromDropDownButton> createState() => _IcdFromDropDownButtonState();
}

class _IcdFromDropDownButtonState extends State<IcdFromDropDownButton> {
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
          value: widget.icdFromValue,
          style: const TextStyle(color: Colors.black),
          items:
              widget.listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
            return DropdownMenuItem<dynamic>(
              value: item.icdname,
              child: Text(item.icdname),
            );
          }).toList(),
          hint: const Text(
            "Select",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onChanged: (value) {
            setState(() {
              // icdFromValue = value;
              widget.notifyParent(value);
              //
            });
          },
        ),
      ),
    );
  }
}
