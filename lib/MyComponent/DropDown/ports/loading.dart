import 'package:flutter/material.dart';

class LoadingPortDropDownButton extends StatefulWidget {
  final List<dynamic> listItems;
  final Function(dynamic value) notifyParent;
  const LoadingPortDropDownButton(
      {Key? key, required this.listItems, required this.notifyParent})
      : super(key: key);

  @override
  State<LoadingPortDropDownButton> createState() =>
      _LoadingPortDropDownButtonState();
}

class _LoadingPortDropDownButtonState extends State<LoadingPortDropDownButton> {
  dynamic _loadingPortSelected;

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
          value: _loadingPortSelected,
          style: const TextStyle(color: Colors.black),
          items:
              widget.listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
            return DropdownMenuItem<dynamic>(
              value: item.port,
              child: Text(item.portname),
            );
          }).toList(),
          hint: const Text(
            "Select",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onChanged: (_loadingPortSelectedValue) {
            setState(() {
              widget.notifyParent(_loadingPortSelectedValue);
            });
          },
        ),
      ),
    );
  }
}
