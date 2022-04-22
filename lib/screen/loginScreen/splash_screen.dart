import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:transvision_app1/Screen/loginscreen/login_screen.dart';

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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Expanded(
                    child: AnimatedSplashScreen(
                        splashTransition: SplashTransition.fadeTransition,
                        centered: false,
                        backgroundColor: Colors.orange.shade100,
                        duration: 5000,
                        splash: Lottie.asset("assets/images/lf20_zvqaeada.json",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height),
                        nextScreen: const LoginPage())),
                const SizedBox(height: 100.0),
                Expanded(
                  child: AnimatedSplashScreen(
                    splashTransition: SplashTransition.slideTransition,
                    animationDuration: const Duration(seconds: 5),
                    centered: false,
                    backgroundColor: Colors.orange.shade100,
                    duration: 5000,
                    splash: Image.asset("assets/images/splash.png"),
                    nextScreen: const LoginPage(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Expanded(
// child: Lottie.asset("assets/images/lf20_zvqaeada.json",
//
// ),
