import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/text.dart';

class CommodityDropDownButton extends StatefulWidget {
   final List<dynamic> listItems;
  const CommodityDropDownButton({Key? key, required this.listItems}) : super(key: key);

  @override
  State<CommodityDropDownButton> createState() => _CommodityDropDownButtonState();
}

class _CommodityDropDownButtonState extends State<CommodityDropDownButton> {
      dynamic commodityValue;


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
          value: commodityValue,
          style: const TextStyle(color: Colors.black),
          items:
          widget.listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
            return DropdownMenuItem<dynamic>(
              value: item,
              child: Text("$item"),
            );
          }).toList(),
          hint:const NormalText(text: "Select",size: 15,color: Colors.black,),
          onChanged: (value) {
            setState(() {
             commodityValue=value;
            });
          },
        ),
      ),
    );
  }
}
