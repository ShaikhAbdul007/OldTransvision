import 'package:flutter/material.dart';

class IcdToDropDownButton extends StatefulWidget {
  final List<dynamic> listItems;
  final dynamic icdToValue;
  final Function(dynamic value) notifyIcdTovalueToBookingPage;
  const IcdToDropDownButton({
    Key? key,
    required this.listItems,
    required this.notifyIcdTovalueToBookingPage,
    this.icdToValue,
  }) : super(key: key);

  @override
  State<IcdToDropDownButton> createState() => _IcdDropDownButtonState();
}

class _IcdDropDownButtonState extends State<IcdToDropDownButton> {
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
          value: widget.icdToValue,
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
              // icdToSelectedValue = null;
              // icdToSelectedValue = value;
              widget.notifyIcdTovalueToBookingPage(value);
            });
          },
        ),
      ),
    );
  }
}
