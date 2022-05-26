import 'package:flutter/material.dart';

class BillOfLandingDropDown extends StatefulWidget {
  final List<dynamic> listItems;
  final Function(dynamic value) notifyParent;
  final TextEditingController bofController = TextEditingController();
  BillOfLandingDropDown({
    Key? key,
    required this.listItems,
    required this.notifyParent,
  }) : super(key: key);

  @override
  State<BillOfLandingDropDown> createState() => _BillOfLandingDropDownState();
}

class _BillOfLandingDropDownState extends State<BillOfLandingDropDown> {
  dynamic _billOfLandingSelectedValue;
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
          value: _billOfLandingSelectedValue,
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
              widget.notifyParent(value);
            });
          },
        ),
      ),
    );
  }
}
