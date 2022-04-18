import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:transvision_app1/MyComponent/text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.shade100,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Lottie.network(
                "https://assets7.lottiefiles.com/packages/lf20_zvqaeada.json",
                animate: true,
                addRepaintBoundary: true,
                repeat: true,
                alignment: Alignment.center),
            Container(
              padding: const EdgeInsets.only(left: 30, top: 5),
              height: 200,
              width: 300,
              child: Stack(children: const [
                Positioned(
                    child: WeightText(
                  text: "Trans Vision",
                  size: 30.0,
                  color: Colors.black,
                )),
                Positioned(
                  top: 35.0,
                  left: 105.0,
                  child: NormalText(
                      text: "Shipping PVT LTD",
                      size: 18.0,
                      color: Colors.black),
                ),
                SizedBox(height: 15.0),
                Positioned(
                  top: 70,
                  left: 100,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.orange,
                    valueColor: AlwaysStoppedAnimation(Colors.orangeAccent),
                  ),
                )
              ]),
            )
          ]),
        ));
  }
}
