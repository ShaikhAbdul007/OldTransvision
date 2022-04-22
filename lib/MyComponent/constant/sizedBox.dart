import 'package:flutter/cupertino.dart';

class CustomHeight extends StatelessWidget {
  const CustomHeight({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 15.0,
    );
  }
}

class CustomWidth extends StatelessWidget {
  const CustomWidth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 15.0,
    );
  }
}
