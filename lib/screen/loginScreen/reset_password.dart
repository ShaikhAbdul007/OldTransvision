import 'package:flutter/material.dart';
import 'package:transvision_app1/MyComponent/text.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _keyfrom = GlobalKey<FormState>();
  final cPassword = TextEditingController();
  final nPassword = TextEditingController();
  bool isVisible = true;

  @override
  void initState() {
    super.initState();

    nPassword.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    // moveToHome(BuildContext context) {
    //   if (_keyfrom.currentState!.validate()) {
    //     setState(() async {
    //       await Future.delayed(const Duration(seconds: 1));
    //       await Navigator.pushNamed(context, MyRoutes.bookingDetailsRoute);
    //     });
    //   }
    // }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const WeightText(
          text: "Change Password",
          size: 20.0,
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/forgetpass.png"),
            const WeightText(
                text: "Change Your Password", size: 25.0, color: Colors.black),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Form(
                key: _keyfrom,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password Cannot be Empty";
                        } else {
                          return "Password Does Not Match";
                        }
                      },
                      decoration: InputDecoration(
                          suffixIcon: nPassword.text.isEmpty
                              ? Container(width: 0)
                              : IconButton(
                                  onPressed: () => nPassword.clear(),
                                  icon: const Icon(Icons.close)),
                          labelText: "New Password",
                          hintText: "Enter New Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      obscureText: !isVisible,
                      controller: cPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password Cannot be Empty";
                        } else if (value.length < 6) {
                          return "Password length Should be 6 Character";
                        } else if (value != cPassword.text) {
                          return "Password Does not match\nEnter Correct Password";
                        } else {
                          return "Password Should Be Same";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Confirm Password",
                          hintText: "Enter Confirm Password",
                          suffixIcon: IconButton(
                              onPressed: () =>
                                  setState(() => isVisible = !isVisible),
                              icon: isVisible
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.restart_alt_rounded,
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                WeightText(
                                    text: "Reset",
                                    size: 18.0,
                                    color: Colors.black),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.orange[300],
                                borderRadius: BorderRadius.circular(7)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
