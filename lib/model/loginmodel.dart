// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.loginResult,
  });

  String loginResult;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        loginResult: json["loginResult"],
      );

  Map<String, dynamic> toJson() => {
        "loginResult": loginResult,
      };
}
