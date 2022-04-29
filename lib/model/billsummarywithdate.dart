/// balAmt : 0
/// billDate : "03-08-2021 00:00:00"
/// billNo : 7515
/// billTotals : 617302025.6131
/// blDate : "31-07-2021 00:00:00"
/// blNo : 1747
/// payAmt : 617302025.6131
/// tdsAmt : 0
/// vesselName : "LUCIA"
/// voyage : "046"

class BillSummaryWithDate {
  BillSummaryWithDate({
    int? balAmt,
    String? billDate,
    int? billNo,
    num? billTotals,
    String? blDate,
    int? blNo,
    num? payAmt,
    int? tdsAmt,
    String? vesselName,
    String? voyage,
  }) {
    _balAmt = balAmt;
    _billDate = billDate;
    _billNo = billNo;
    _billTotals = billTotals;
    _blDate = blDate;
    _blNo = blNo;
    _payAmt = payAmt;
    _tdsAmt = tdsAmt;
    _vesselName = vesselName;
    _voyage = voyage;
  }

  BillSummaryWithDate.fromJson(dynamic json) {
    _balAmt = json['balAmt'];
    _billDate = json['billDate'];
    _billNo = json['billNo'];
    _billTotals = json['billTotals'];
    _blDate = json['blDate'];
    _blNo = json['blNo'];
    _payAmt = json['payAmt'];
    _tdsAmt = json['tdsAmt'];
    _vesselName = json['vesselName'];
    _voyage = json['voyage'];
  }
  int? _balAmt;
  String? _billDate;
  int? _billNo;
  num? _billTotals;
  String? _blDate;
  int? _blNo;
  num? _payAmt;
  int? _tdsAmt;
  String? _vesselName;
  String? _voyage;
  BillSummaryWithDate copyWith({
    int? balAmt,
    String? billDate,
    int? billNo,
    double? billTotals,
    String? blDate,
    int? blNo,
    double? payAmt,
    int? tdsAmt,
    String? vesselName,
    String? voyage,
  }) =>
      BillSummaryWithDate(
        balAmt: balAmt ?? _balAmt,
        billDate: billDate ?? _billDate,
        billNo: billNo ?? _billNo,
        billTotals: billTotals ?? _billTotals,
        blDate: blDate ?? _blDate,
        blNo: blNo ?? _blNo,
        payAmt: payAmt ?? _payAmt,
        tdsAmt: tdsAmt ?? _tdsAmt,
        vesselName: vesselName ?? _vesselName,
        voyage: voyage ?? _voyage,
      );
  int? get balAmt => _balAmt;
  String? get billDate => _billDate;
  int? get billNo => _billNo;
  num? get billTotals => _billTotals;
  String? get blDate => _blDate;
  int? get blNo => _blNo;
  num? get payAmt => _payAmt;
  int? get tdsAmt => _tdsAmt;
  String? get vesselName => _vesselName;
  String? get voyage => _voyage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['balAmt'] = _balAmt;
    map['billDate'] = _billDate;
    map['billNo'] = _billNo;
    map['billTotals'] = _billTotals;
    map['blDate'] = _blDate;
    map['blNo'] = _blNo;
    map['payAmt'] = _payAmt;
    map['tdsAmt'] = _tdsAmt;
    map['vesselName'] = _vesselName;
    map['voyage'] = _voyage;
    return map;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
