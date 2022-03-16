import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transvision_app1/utils/routes.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String password = "";
  bool isPasswordVisible = false;

  Future<dynamic> callLoginAPI(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      var uri =
          "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/login?username=" +
              username.text +
              "&password=" +
              password;
      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)["loginResult"] == "Consignee Login") {
          setState(() {
            Navigator.pushNamed(context, MyRoutes.myNavigationRoute);
          });
        } else {
          print("error");
        }
      } else {
        throw Exception('Failed to Login');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    username.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 0.0, left: 16.0, right: 0.0),
                child: Image.asset(
                  'assets/images/loginpage.png',
                  fit: BoxFit.cover,
                  height: 350,
                ),
              ),
              const SizedBox(height: 15.0),
              const Text(
                "Welcome to TransVision ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: username,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "User Name Cannot be Empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          prefixIcon: const Icon(CupertinoIcons.person_2_fill),
                          suffixIcon: username.text.isEmpty
                              ? Container(
                                  width: 0,
                                )
                              : IconButton(
                                  onPressed: () => username.clear(),
                                  icon: const Icon(Icons.close)),
                          hintText: "Enter UserName",
                          labelText: "User Name",
                          labelStyle:
                              TextStyle(decorationColor: Colors.orange[800])),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: isPasswordVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () => setState(
                                () => isPasswordVisible = !isPasswordVisible)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password Cannot be Empty";
                        } else if (value.length < 6) {
                          return "Password length should be Atleast 6 Character ";
                        } else {
                          return null;
                        }
                      },
                      onChanged: ((value) => setState(() => password = value)),
                      onFieldSubmitted: (value) =>
                          setState(() => password = value),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => callLoginAPI(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.orange[400],
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
