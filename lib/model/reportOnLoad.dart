/// Brcode : "INNSA"
/// DoNo : "5988"
/// Refno : "11177"
/// bookingdate : "25-04-2022 00:00:00"
/// bookingno : "5796"
/// commodity : "General"
/// freight : "2850"
/// icdfrom : ""
/// icdto : ""
/// pod : "AEJEA"
/// pol : "INNSA"
/// qty : "2"
/// size : "40"
/// type : "RF"
/// weight : "18000"

class ReportOnLoad {
  ReportOnLoad({
      String? brcode, 
      String? doNo, 
      String? refno, 
      String? bookingdate, 
      String? bookingno, 
      String? commodity, 
      String? freight, 
      String? icdfrom, 
      String? icdto, 
      String? pod, 
      String? pol, 
      String? qty, 
      String? size, 
      String? type, 
      String? weight,}){
    _brcode = brcode;
    _doNo = doNo;
    _refno = refno;
    _bookingdate = bookingdate;
    _bookingno = bookingno;
    _commodity = commodity;
    _freight = freight;
    _icdfrom = icdfrom;
    _icdto = icdto;
    _pod = pod;
    _pol = pol;
    _qty = qty;
    _size = size;
    _type = type;
    _weight = weight;
}

  ReportOnLoad.fromJson(dynamic json) {
    _brcode = json['Brcode'];
    _doNo = json['DoNo'];
    _refno = json['Refno'];
    _bookingdate = json['bookingdate'];
    _bookingno = json['bookingno'];
    _commodity = json['commodity'];
    _freight = json['freight'];
    _icdfrom = json['icdfrom'];
    _icdto = json['icdto'];
    _pod = json['pod'];
    _pol = json['pol'];
    _qty = json['qty'];
    _size = json['size'];
    _type = json['type'];
    _weight = json['weight'];
  }
  String? _brcode;
  String? _doNo;
  String? _refno;
  String? _bookingdate;
  String? _bookingno;
  String? _commodity;
  String? _freight;
  String? _icdfrom;
  String? _icdto;
  String? _pod;
  String? _pol;
  String? _qty;
  String? _size;
  String? _type;
  String? _weight;
ReportOnLoad copyWith({  String? brcode,
  String? doNo,
  String? refno,
  String? bookingdate,
  String? bookingno,
  String? commodity,
  String? freight,
  String? icdfrom,
  String? icdto,
  String? pod,
  String? pol,
  String? qty,
  String? size,
  String? type,
  String? weight,
}) => ReportOnLoad(  brcode: brcode ?? _brcode,
  doNo: doNo ?? _doNo,
  refno: refno ?? _refno,
  bookingdate: bookingdate ?? _bookingdate,
  bookingno: bookingno ?? _bookingno,
  commodity: commodity ?? _commodity,
  freight: freight ?? _freight,
  icdfrom: icdfrom ?? _icdfrom,
  icdto: icdto ?? _icdto,
  pod: pod ?? _pod,
  pol: pol ?? _pol,
  qty: qty ?? _qty,
  size: size ?? _size,
  type: type ?? _type,
  weight: weight ?? _weight,
);
  String? get brcode => _brcode;
  String? get doNo => _doNo;
  String? get refno => _refno;
  String? get bookingdate => _bookingdate;
  String? get bookingno => _bookingno;
  String? get commodity => _commodity;
  String? get freight => _freight;
  String? get icdfrom => _icdfrom;
  String? get icdto => _icdto;
  String? get pod => _pod;
  String? get pol => _pol;
  String? get qty => _qty;
  String? get size => _size;
  String? get type => _type;
  String? get weight => _weight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Brcode'] = _brcode;
    map['DoNo'] = _doNo;
    map['Refno'] = _refno;
    map['bookingdate'] = _bookingdate;
    map['bookingno'] = _bookingno;
    map['commodity'] = _commodity;
    map['freight'] = _freight;
    map['icdfrom'] = _icdfrom;
    map['icdto'] = _icdto;
    map['pod'] = _pod;
    map['pol'] = _pol;
    map['qty'] = _qty;
    map['size'] = _size;
    map['type'] = _type;
    map['weight'] = _weight;
    return map;
  }

}