import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/text.dart';

class ConsigneeDoSlip extends StatefulWidget {
  const ConsigneeDoSlip({Key? key}) : super(key: key);

  @override
  State<ConsigneeDoSlip> createState() => _ConsigneeDoSlipState();
}

class _ConsigneeDoSlipState extends State<ConsigneeDoSlip> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const WeightText(
        text: "Delivery Order",
        size: 20.0,
        color: Colors.black,
      ),),
    );
  }
}
