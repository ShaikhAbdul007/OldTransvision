/// Brcode : "INMUN"
/// DoNo : "3388"
/// Refno : "11075"
/// bookingdate : "18-04-2022 00:00:00"
/// bookingno : "3056"
/// dovalidity : "25-04-2022 00:00:00"
/// final : "AEJEA"
/// pol : "INMUN"

class DoSlipLoad {
  DoSlipLoad({
      String? brcode, 
      String? doNo, 
      String? refno, 
      String? bookingdate, 
      String? bookingno, 
      String? dovalidity, 
      String? final, 
      String? pol,}){
    _brcode = brcode;
    _doNo = doNo;
    _refno = refno;
    _bookingdate = bookingdate;
    _bookingno = bookingno;
    _dovalidity = dovalidity;
    _final = final;
    _pol = pol;
}

  DoSlipLoad.fromJson(dynamic json) {
    _brcode = json['Brcode'];
    _doNo = json['DoNo'];
    _refno = json['Refno'];
    _bookingdate = json['bookingdate'];
    _bookingno = json['bookingno'];
    _dovalidity = json['dovalidity'];
    _final = json['final'];
    _pol = json['pol'];
  }
  String? _brcode;
  String? _doNo;
  String? _refno;
  String? _bookingdate;
  String? _bookingno;
  String? _dovalidity;
  String? _final;
  String? _pol;
DoSlipLoad copyWith({  String? brcode,
  String? doNo,
  String? refno,
  String? bookingdate,
  String? bookingno,
  String? dovalidity,
  String? final,
  String? pol,
}) => DoSlipLoad(  brcode: brcode ?? _brcode,
  doNo: doNo ?? _doNo,
  refno: refno ?? _refno,
  bookingdate: bookingdate ?? _bookingdate,
  bookingno: bookingno ?? _bookingno,
  dovalidity: dovalidity ?? _dovalidity,
  final: final ?? _final,
  pol: pol ?? _pol,
);
  String? get brcode => _brcode;
  String? get doNo => _doNo;
  String? get refno => _refno;
  String? get bookingdate => _bookingdate;
  String? get bookingno => _bookingno;
  String? get dovalidity => _dovalidity;
  String? get final => _final;
  String? get pol => _pol;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Brcode'] = _brcode;
    map['DoNo'] = _doNo;
    map['Refno'] = _refno;
    map['bookingdate'] = _bookingdate;
    map['bookingno'] = _bookingno;
    map['dovalidity'] = _dovalidity;
    map['final'] = _final;
    map['pol'] = _pol;
    return map;
  }

}