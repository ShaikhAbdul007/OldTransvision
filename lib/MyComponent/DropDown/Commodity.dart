import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/text.dart';

import '../colors.dart';
import '../sizedbox.dart';
import '../textFeild.dart';

class CommodityDropDownButton extends StatefulWidget {
  // final List<dynamic> listItems;
  const CommodityDropDownButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CommodityDropDownButton> createState() =>
      _CommodityDropDownButtonState();
}

class _CommodityDropDownButtonState extends State<CommodityDropDownButton> {
  final items = ['General', 'Hazardous', "ODC"];
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
            items: items.map<DropdownMenuItem<dynamic>>((dynamic item) {
              return DropdownMenuItem<dynamic>(
                value: item,
                child: Text("$item"),
              );
            }).toList(),
            hint: const NormalText(
              text: "Select",
              size: 15,
              color: Colors.black,
            ),
            onChanged: (value) {
              commodityValue = value;
            },
            onTap: () => setState(() {
              if (commodityValue.value[0] != null) {
                return visibilityShow();
              }
            }),
          ),
        ));
  }

  void  visibilityShow() {
     Visibility(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(text: "Class", size: 18.0, color: AppColor.black),
                const CustomTextField(hint: "Enter Quantity"),
                const SizedBox(
                  height: 4.0,
                ),
              ],
            ),
          ),
          const CustomWidth(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(text: "UN No", size: 18.0, color: AppColor.black),
                const CustomTextField(hint: "Enter UN No"),
                const SizedBox(
                  height: 4.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
