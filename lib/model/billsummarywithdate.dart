/// balamt : 0
/// billdate : "03-08-2021 00:00:00"
/// billno : 7515
/// billtotals : 617302025.6131
/// bldate : "31-07-2021 00:00:00"
/// blno : 1747
/// payamt : 617302025.6131
/// tdsamt : 0
/// vesselname : "LUCIA"
/// voyage : "046"

class BillSummaryWithDate {
  BillSummaryWithDate({
    int? balamt,
    String? billdate,
    int? billno,
    num? billtotals,
    String? bldate,
    int? blno,
    num? payamt,
    int? tdsamt,
    String? vesselname,
    String? voyage,
  }) {
    _balamt = balamt;
    _billdate = billdate;
    _billno = billno;
    _billtotals = billtotals;
    _bldate = bldate;
    _blno = blno;
    _payamt = payamt;
    _tdsamt = tdsamt;
    _vesselname = vesselname;
    _voyage = voyage;
  }

  BillSummaryWithDate.fromJson(dynamic json) {
    _balamt = json['balamt'];
    _billdate = json['billdate'];
    _billno = json['billno'];
    _billtotals = json['billtotals'];
    _bldate = json['bldate'];
    _blno = json['blno'];
    _payamt = json['payamt'];
    _tdsamt = json['tdsamt'];
    _vesselname = json['vesselname'];
    _voyage = json['voyage'];
  }
  int? _balamt;
  String? _billdate;
  int? _billno;
  num? _billtotals;
  String? _bldate;
  int? _blno;
  num? _payamt;
  int? _tdsamt;
  String? _vesselname;
  String? _voyage;
  BillSummaryWithDate copyWith({
    int? balamt,
    String? billdate,
    int? billno,
    double? billtotals,
    String? bldate,
    int? blno,
    double? payamt,
    int? tdsamt,
    String? vesselname,
    String? voyage,
  }) =>
      BillSummaryWithDate(
        balamt: balamt ?? _balamt,
        billdate: billdate ?? _billdate,
        billno: billno ?? _billno,
        billtotals: billtotals ?? _billtotals,
        bldate: bldate ?? _bldate,
        blno: blno ?? _blno,
        payamt: payamt ?? _payamt,
        tdsamt: tdsamt ?? _tdsamt,
        vesselname: vesselname ?? _vesselname,
        voyage: voyage ?? _voyage,
      );
  int? get balamt => _balamt;
  String? get billdate => _billdate;
  int? get billno => _billno;
  num? get billtotals => _billtotals;
  String? get bldate => _bldate;
  int? get blno => _blno;
  num? get payamt => _payamt;
  int? get tdsamt => _tdsamt;
  String? get vesselname => _vesselname;
  String? get voyage => _voyage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['balamt'] = _balamt;
    map['billdate'] = _billdate;
    map['billno'] = _billno;
    map['billtotals'] = _billtotals;
    map['bldate'] = _bldate;
    map['blno'] = _blno;
    map['payamt'] = _payamt;
    map['tdsamt'] = _tdsamt;
    map['vesselname'] = _vesselname;
    map['voyage'] = _voyage;
    return map;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
