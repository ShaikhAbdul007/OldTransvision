import 'package:flutter/material.dart';

class Practice extends StatelessWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Hello",
              style: TextStyle(fontSize: 20.0),
            ),
            ElevatedButton(onPressed: () async {}, child: const Text("next")),

          ],
        ),
      ),
    );
  }
}
