/// Br : "AEJEA4"
/// ETD : "02-05-2022 00:00:00"
/// fPod : "IRBND"
/// blAct : "TSVAEJEA22045398"
/// blNo : "5398"
/// bookingNo : "4321"
/// fPodBr : "IRBND2"
/// issueDate : "26-04-2022 00:00:00"
/// partyName : "Transvision Sea Shipping Lines Agent LLC (U.A.E)"
/// place : "JEBELALI DUBAI"
/// podIs : "BANDAR ABBAS IRAN"
/// pol : "JEBELALI DUBAI"
/// sailing : "31-12-2999 00:00:00"
/// vessel : "DELTA D048"

class BlOfLadingOnRefresh {
  BlOfLadingOnRefresh({
      String? br, 
      String? etd, 
      String? fPod, 
      String? blAct, 
      String? blNo, 
      String? bookingNo, 
      String? fPodBr, 
      String? issueDate, 
      String? partyName, 
      String? place, 
      String? podIs, 
      String? pol, 
      String? sailing, 
      String? vessel,}){
    _br = br;
    _etd = etd;
    _fPod = fPod;
    _blAct = blAct;
    _blNo = blNo;
    _bookingNo = bookingNo;
    _fPodBr = fPodBr;
    _issueDate = issueDate;
    _partyName = partyName;
    _place = place;
    _podIs = podIs;
    _pol = pol;
    _sailing = sailing;
    _vessel = vessel;
}

  BlOfLadingOnRefresh.fromJson(dynamic json) {
    _br = json['Br'];
    _etd = json['ETD'];
    _fPod = json['fPod'];
    _blAct = json['blAct'];
    _blNo = json['blNo'];
    _bookingNo = json['bookingNo'];
    _fPodBr = json['fPodBr'];
    _issueDate = json['issueDate'];
    _partyName = json['partyName'];
    _place = json['place'];
    _podIs = json['podIs'];
    _pol = json['pol'];
    _sailing = json['sailing'];
    _vessel = json['vessel'];
  }
  String? _br;
  String? _etd;
  String? _fPod;
  String? _blAct;
  String? _blNo;
  String? _bookingNo;
  String? _fPodBr;
  String? _issueDate;
  String? _partyName;
  String? _place;
  String? _podIs;
  String? _pol;
  String? _sailing;
  String? _vessel;
BlOfLadingOnRefresh copyWith({  String? br,
  String? etd,
  String? fPod,
  String? blAct,
  String? blNo,
  String? bookingNo,
  String? fPodBr,
  String? issueDate,
  String? partyName,
  String? place,
  String? podIs,
  String? pol,
  String? sailing,
  String? vessel,
}) => BlOfLadingOnRefresh(  br: br ?? _br,
  etd: etd ?? _etd,
  fPod: fPod ?? _fPod,
  blAct: blAct ?? _blAct,
  blNo: blNo ?? _blNo,
  bookingNo: bookingNo ?? _bookingNo,
  fPodBr: fPodBr ?? _fPodBr,
  issueDate: issueDate ?? _issueDate,
  partyName: partyName ?? _partyName,
  place: place ?? _place,
  podIs: podIs ?? _podIs,
  pol: pol ?? _pol,
  sailing: sailing ?? _sailing,
  vessel: vessel ?? _vessel,
);
  String? get br => _br;
  String? get etd => _etd;
  String? get fPod => _fPod;
  String? get blAct => _blAct;
  String? get blNo => _blNo;
  String? get bookingNo => _bookingNo;
  String? get fPodBr => _fPodBr;
  String? get issueDate => _issueDate;
  String? get partyName => _partyName;
  String? get place => _place;
  String? get podIs => _podIs;
  String? get pol => _pol;
  String? get sailing => _sailing;
  String? get vessel => _vessel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Br'] = _br;
    map['ETD'] = _etd;
    map['fPod'] = _fPod;
    map['blAct'] = _blAct;
    map['blNo'] = _blNo;
    map['bookingNo'] = _bookingNo;
    map['fPodBr'] = _fPodBr;
    map['issueDate'] = _issueDate;
    map['partyName'] = _partyName;
    map['place'] = _place;
    map['podIs'] = _podIs;
    map['pol'] = _pol;
    map['sailing'] = _sailing;
    map['vessel'] = _vessel;
    return map;
  }

}