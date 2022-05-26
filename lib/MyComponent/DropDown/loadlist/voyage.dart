import 'package:flutter/material.dart';


class VoyageDropDown extends StatefulWidget {
  final List<dynamic> listItems;
  const VoyageDropDown({Key? key, required this.listItems}) : super(key: key);

  @override
  State<VoyageDropDown> createState() => _VoyageDropDownState();
}

class _VoyageDropDownState extends State<VoyageDropDown> {
  dynamic voyageSelected;
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
          value: voyageSelected,
          style: const TextStyle(color: Colors.black),
          items:
          widget.listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
            return DropdownMenuItem<dynamic>(
              value: item.voyage,
              child: Text(item.voyage),
            );
          }).toList(),
          hint: const Text(
            "Select",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onChanged: (voyageSelectedValue) {
            setState(() {
              voyageSelected= voyageSelectedValue;
            });
          },
        ),
      ),
    );

  }
}



