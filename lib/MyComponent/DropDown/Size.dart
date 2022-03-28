import 'package:flutter/material.dart';

class SizeDropDownButton extends StatefulWidget {
  final List<dynamic> listItems;
  final Function(dynamic value) notifyParent;
  const SizeDropDownButton({Key? key, required this.listItems, required this.notifyParent})
      : super(key: key);

  @override
  State<SizeDropDownButton> createState() => _SizeDropDownButtonState();
}

class _SizeDropDownButtonState extends State<SizeDropDownButton> {
  @override
  Widget build(BuildContext context) {
    dynamic sizeSelected;

    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2.0, style: BorderStyle.solid)),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<dynamic>(
          isExpanded: true,
          value: sizeSelected,
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
          onChanged: (sizedSelectedValue) {
           widget.notifyParent(sizedSelectedValue);
           print(sizedSelectedValue);
          },
        ),
      ),
    );
  }
}
