import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/text.dart';

class SecurityInvoice extends StatefulWidget {
  const SecurityInvoice({Key? key}) : super(key: key);

  @override
  State<SecurityInvoice> createState() => _SecurityInvoiceState();
}

class _SecurityInvoiceState extends State<SecurityInvoice> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const WeightText(
        text: "Security Invoice",
        size: 20.0,
        color: Colors.black,
      ),),
    );
  }
}
