import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/text.dart';
class ImportInvoice extends StatefulWidget {
  const ImportInvoice({Key? key}) : super(key: key);

  @override
  State<ImportInvoice> createState() => _ImportInvoiceState();
}

class _ImportInvoiceState extends State<ImportInvoice> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const WeightText(
        text: "Import Invoice",
        size: 20.0,
        color: Colors.black,
      ),),
    );
  }
}
