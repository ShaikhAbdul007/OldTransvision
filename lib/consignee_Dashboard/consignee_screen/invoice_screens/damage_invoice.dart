import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/text.dart';

class DamageInvoice extends StatefulWidget {
  const DamageInvoice({Key? key}) : super(key: key);

  @override
  State<DamageInvoice> createState() => _DamageInvoiceState();
}

class _DamageInvoiceState extends State<DamageInvoice> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const WeightText(
        text: "Damage Invoice",
        size: 20.0,
        color: Colors.black,
      ),),
    );
  }
}
