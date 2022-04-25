import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/text.dart';


class DetentionInvoice extends StatefulWidget {
  const DetentionInvoice({Key? key}) : super(key: key);

  @override
  State<DetentionInvoice> createState() => _DetentionInvoiceState();
}

class _DetentionInvoiceState extends State<DetentionInvoice> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const WeightText(
        text: "Detention Invoice",
        size: 20.0,
        color: Colors.black,
      ),),
    );
  }
}
