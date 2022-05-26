import 'package:flutter/material.dart';

class VesselDropDown extends StatefulWidget {
  final List<dynamic> listItems;
  final Function(dynamic value) notifyParent;
  const VesselDropDown(
      {Key? key, required this.listItems, required this.notifyParent})
      : super(key: key);

  @override
  State<VesselDropDown> createState() => _VesselDropDownState();
}

class _VesselDropDownState extends State<VesselDropDown> {
  dynamic vesselSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2.0, style: BorderStyle.solid)),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<dynamic>(
          isExpanded: true,
          value: vesselSelected,
          style: const TextStyle(color: Colors.black),
          items:
              widget.listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
            return DropdownMenuItem<dynamic>(
              value: item.vessel,
              child: Text(item.vessel),
            );
          }).toList(),
          hint: const Text(
            "Select",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onChanged: (vesselSelectedValue) {
            setState(() {
              widget.notifyParent(vesselSelectedValue);
              // vesselSelected= vesselSelectedValue;
            });
          },
        ),
      ),
    );
  }
}
