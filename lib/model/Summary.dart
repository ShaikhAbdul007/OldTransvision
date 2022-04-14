/// balamt : 0
/// billdate : "24-08-2021 00:00:00"
/// billno : 10287
/// billtotals : 1585
/// bldate : "15-08-2021 00:00:00"
/// blno : 4257
/// payamt : 1585
/// tdsamt : 0
/// vesselname : "PSL EAGLE"
/// voyage : "PLE111"

class Summary {
  Summary({
      int? balamt, 
      String? billdate, 
      int? billno, 
      int? billtotals, 
      String? bldate, 
      int? blno, 
      int? payamt, 
      int? tdsamt, 
      String? vesselname, 
      String? voyage,}){
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

  Summary.fromJson(dynamic json) {
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
  int? _billtotals;
  String? _bldate;
  int? _blno;
  int? _payamt;
  int? _tdsamt;
  String? _vesselname;
  String? _voyage;
Summary copyWith({  int? balamt,
  String? billdate,
  int? billno,
  int? billtotals,
  String? bldate,
  int? blno,
  int? payamt,
  int? tdsamt,
  String? vesselname,
  String? voyage,
}) => Summary(  balamt: balamt ?? _balamt,
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
  int? get billtotals => _billtotals;
  String? get bldate => _bldate;
  int? get blno => _blno;
  int? get payamt => _payamt;
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

}