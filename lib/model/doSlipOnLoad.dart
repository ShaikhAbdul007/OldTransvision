/// Brcode : "INNSA"
/// DoNo : "5988"
/// Refno : "11177"
/// bookingdate : "25-04-2022 00:00:00"
/// bookingno : "5796"
/// dovalidity : "02-05-2022 00:00:00"
/// pod : "AEJEA"
/// pol : "INNSA"

class DoSlipOnLoad {
  DoSlipOnLoad({
      String? brcode, 
      String? doNo, 
      String? refno, 
      String? bookingdate, 
      String? bookingno, 
      String? dovalidity, 
      String? pod, 
      String? pol,}){
    _brcode = brcode;
    _doNo = doNo;
    _refno = refno;
    _bookingdate = bookingdate;
    _bookingno = bookingno;
    _dovalidity = dovalidity;
    _pod = pod;
    _pol = pol;
}

  DoSlipOnLoad.fromJson(dynamic json) {
    _brcode = json['Brcode'];
    _doNo = json['DoNo'];
    _refno = json['Refno'];
    _bookingdate = json['bookingdate'];
    _bookingno = json['bookingno'];
    _dovalidity = json['dovalidity'];
    _pod = json['pod'];
    _pol = json['pol'];
  }
  String? _brcode;
  String? _doNo;
  String? _refno;
  String? _bookingdate;
  String? _bookingno;
  String? _dovalidity;
  String? _pod;
  String? _pol;
DoSlipOnLoad copyWith({  String? brcode,
  String? doNo,
  String? refno,
  String? bookingdate,
  String? bookingno,
  String? dovalidity,
  String? pod,
  String? pol,
}) => DoSlipOnLoad(  brcode: brcode ?? _brcode,
  doNo: doNo ?? _doNo,
  refno: refno ?? _refno,
  bookingdate: bookingdate ?? _bookingdate,
  bookingno: bookingno ?? _bookingno,
  dovalidity: dovalidity ?? _dovalidity,
  pod: pod ?? _pod,
  pol: pol ?? _pol,
);
  String? get brcode => _brcode;
  String? get doNo => _doNo;
  String? get refno => _refno;
  String? get bookingdate => _bookingdate;
  String? get bookingno => _bookingno;
  String? get dovalidity => _dovalidity;
  String? get pod => _pod;
  String? get pol => _pol;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Brcode'] = _brcode;
    map['DoNo'] = _doNo;
    map['Refno'] = _refno;
    map['bookingdate'] = _bookingdate;
    map['bookingno'] = _bookingno;
    map['dovalidity'] = _dovalidity;
    map['pod'] = _pod;
    map['pol'] = _pol;
    return map;
  }

}