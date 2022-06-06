// To parse this JSON data, do
//
//     final onileinsertpostapi = onileinsertpostapiFromJson(jsonString);

import 'dart:convert';

Onileinsertpostapi onileinsertpostapiFromJson(String str) =>
    Onileinsertpostapi.fromJson(json.decode(str));

String onileinsertpostapiToJson(Onileinsertpostapi data) =>
    json.encode(data.toJson());

class Onileinsertpostapi {
  Onileinsertpostapi({
    required this.jsonResult,
  });

  List<JsonResult> jsonResult;

  factory Onileinsertpostapi.fromJson(Map<String, dynamic> json) =>
      Onileinsertpostapi(
        jsonResult: List<JsonResult>.from(
            json["jsonResult"].map((x) => JsonResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "jsonResult": List<dynamic>.from(jsonResult.map((x) => x.toJson())),
      };
}

class JsonResult {
  JsonResult({
    required this.onlinebooking,
  });

  List<Onlinebooking> onlinebooking;

  factory JsonResult.fromJson(Map<String, dynamic> json) => JsonResult(
        onlinebooking: List<Onlinebooking>.from(
            json["onlinebooking"].map((x) => Onlinebooking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "onlinebooking":
            List<dynamic>.from(onlinebooking.map((x) => x.toJson())),
      };
}

class Onlinebooking {
  Onlinebooking({
    required this.partycode,
    required this.qty,
    required this.size,
    required this.type,
    required this.commodity,
    required this.classs,
    required this.unno,
    required this.freight,
    required this.weight,
    required this.icdfrom,
    required this.icdto,
    required this.pol,
    required this.pod,
    required this.rateagreedby,
    required this.bookingdate,
    required this.fromdate,
    required this.todate,
  });

  String partycode;
  String qty;
  String size;
  String type;
  String commodity;
  String classs;
  String unno;
  String freight;
  String weight;
  String icdfrom;
  String icdto;
  String pol;
  String pod;
  String rateagreedby;
  DateTime bookingdate;
  DateTime fromdate;
  DateTime todate;

  factory Onlinebooking.fromJson(Map<String, dynamic> json) => Onlinebooking(
        partycode: json["partycode"],
        qty: json["qty"],
        size: json["size"],
        type: json["type"],
        commodity: json["commodity"],
        classs: json["classs"],
        unno: json["unno"],
        freight: json["freight"],
        weight: json["weight"],
        icdfrom: json["icdfrom"],
        icdto: json["icdto"],
        pol: json["pol"],
        pod: json["pod"],
        rateagreedby: json["rateagreedby"],
        bookingdate: DateTime.parse(json["bookingdate"]),
        fromdate: DateTime.parse(json["fromdate"]),
        todate: DateTime.parse(json["todate"]),
      );

  Map<String, dynamic> toJson() => {
        "partycode": partycode,
        "qty": qty,
        "size": size,
        "type": type,
        "commodity": commodity,
        "classs": classs,
        "unno": unno,
        "freight": freight,
        "weight": weight,
        "icdfrom": icdfrom,
        "icdto": icdto,
        "pol": pol,
        "pod": pod,
        "rateagreedby": rateagreedby,
        "bookingdate":
            "${bookingdate.year.toString().padLeft(4, '0')}-${bookingdate.month.toString().padLeft(2, '0')}-${bookingdate.day.toString().padLeft(2, '0')}",
        "fromdate":
            "${fromdate.year.toString().padLeft(4, '0')}-${fromdate.month.toString().padLeft(2, '0')}-${fromdate.day.toString().padLeft(2, '0')}",
        "todate":
            "${todate.year.toString().padLeft(4, '0')}-${todate.month.toString().padLeft(2, '0')}-${todate.day.toString().padLeft(2, '0')}",
      };
}
