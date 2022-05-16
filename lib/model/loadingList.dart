/// Container : "CRSU1087254"
/// FPOD : "IRBND"
/// IMCO : ""
/// POD : ""
/// POD1 : ""
/// POD2 : ""
/// Remark : ""
/// STOW : ""
/// Status : ""
/// Trans : ""
/// bookingno : 4296
/// port : "AEJEA"
/// size : 20
/// type : "HD"
/// weight : 0

class LoadingList {
  LoadingList({
      String? container, 
      String? fpod, 
      String? imco, 
      String? pod, 
      String? pod1, 
      String? pod2, 
      String? remark, 
      String? stow, 
      String? status, 
      String? trans, 
      int? bookingno, 
      String? port, 
      int? size, 
      String? type, 
      int? weight,}){
    _container = container;
    _fpod = fpod;
    _imco = imco;
    _pod = pod;
    _pod1 = pod1;
    _pod2 = pod2;
    _remark = remark;
    _stow = stow;
    _status = status;
    _trans = trans;
    _bookingno = bookingno;
    _port = port;
    _size = size;
    _type = type;
    _weight = weight;
}

  LoadingList.fromJson(dynamic json) {
    _container = json['Container'];
    _fpod = json['FPOD'];
    _imco = json['IMCO'];
    _pod = json['POD'];
    _pod1 = json['POD1'];
    _pod2 = json['POD2'];
    _remark = json['Remark'];
    _stow = json['STOW'];
    _status = json['Status'];
    _trans = json['Trans'];
    _bookingno = json['bookingno'];
    _port = json['port'];
    _size = json['size'];
    _type = json['type'];
    _weight = json['weight'];
  }
  String? _container;
  String? _fpod;
  String? _imco;
  String? _pod;
  String? _pod1;
  String? _pod2;
  String? _remark;
  String? _stow;
  String? _status;
  String? _trans;
  int? _bookingno;
  String? _port;
  int? _size;
  String? _type;
  int? _weight;
LoadingList copyWith({  String? container,
  String? fpod,
  String? imco,
  String? pod,
  String? pod1,
  String? pod2,
  String? remark,
  String? stow,
  String? status,
  String? trans,
  int? bookingno,
  String? port,
  int? size,
  String? type,
  int? weight,
}) => LoadingList(  container: container ?? _container,
  fpod: fpod ?? _fpod,
  imco: imco ?? _imco,
  pod: pod ?? _pod,
  pod1: pod1 ?? _pod1,
  pod2: pod2 ?? _pod2,
  remark: remark ?? _remark,
  stow: stow ?? _stow,
  status: status ?? _status,
  trans: trans ?? _trans,
  bookingno: bookingno ?? _bookingno,
  port: port ?? _port,
  size: size ?? _size,
  type: type ?? _type,
  weight: weight ?? _weight,
);
  String? get container => _container;
  String? get fpod => _fpod;
  String? get imco => _imco;
  String? get pod => _pod;
  String? get pod1 => _pod1;
  String? get pod2 => _pod2;
  String? get remark => _remark;
  String? get stow => _stow;
  String? get status => _status;
  String? get trans => _trans;
  int? get bookingno => _bookingno;
  String? get port => _port;
  int? get size => _size;
  String? get type => _type;
  int? get weight => _weight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Container'] = _container;
    map['FPOD'] = _fpod;
    map['IMCO'] = _imco;
    map['POD'] = _pod;
    map['POD1'] = _pod1;
    map['POD2'] = _pod2;
    map['Remark'] = _remark;
    map['STOW'] = _stow;
    map['Status'] = _status;
    map['Trans'] = _trans;
    map['bookingno'] = _bookingno;
    map['port'] = _port;
    map['size'] = _size;
    map['type'] = _type;
    map['weight'] = _weight;
    return map;
  }

}