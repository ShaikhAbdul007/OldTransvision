import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:transvision_app1/Screen/loginscreen/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/splashlogo.png'),
                Image.asset('assets/images/splashtext.png')
              ],
            ),
          ),
        ),
        splashIconSize: 275,
        duration: 4000,
        backgroundColor: Colors.amber,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: const LoginPage());
  }
}
