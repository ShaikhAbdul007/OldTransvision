import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transvision_app1/Screen/loginscreen/login_page.dart';
import 'package:transvision_app1/widgets/bottom_nav.dart';
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
            Container(
              child: const Text(
                "Hello",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            ElevatedButton(
                onPressed: () async {

                },
                child: const Text("next"))
          ],
        ),
      ),
    );
  }
}
