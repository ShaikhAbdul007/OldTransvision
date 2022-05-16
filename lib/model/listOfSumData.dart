/// balamt : 0
/// billdate : "28-04-2022 00:00:00"
/// billno : 6598
/// billtotals : 2594.4
/// bldate : "25-04-2022 00:00:00"
/// blno : 5391
/// payamt : 2594.4
/// tdsamt : 0
/// vesselname : "DELTA"
/// voyage : "D048"

class ListOfSumData {
  ListOfSumData({
      int? balamt, 
      String? billdate, 
      int? billno, 
      double? billtotals, 
      String? bldate, 
      int? blno, 
      double? payamt, 
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

  ListOfSumData.fromJson(dynamic json) {
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
  double? _billtotals;
  String? _bldate;
  int? _blno;
  double? _payamt;
  int? _tdsamt;
  String? _vesselname;
  String? _voyage;
ListOfSumData copyWith({  int? balamt,
  String? billdate,
  int? billno,
  double? billtotals,
  String? bldate,
  int? blno,
  double? payamt,
  int? tdsamt,
  String? vesselname,
  String? voyage,
}) => ListOfSumData(  balamt: balamt ?? _balamt,
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
  double? get billtotals => _billtotals;
  String? get bldate => _bldate;
  int? get blno => _blno;
  double? get payamt => _payamt;
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