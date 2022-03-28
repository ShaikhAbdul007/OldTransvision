/// icd : "INAMG"
/// icdname : "AMINGAON"

class IcdFrom {
  IcdFrom({
      String? icd,
      String? icdname,}){
    _icd = icd;
    _icdname = icdname;
}

  IcdFrom.fromJson(Map<dynamic, dynamic> json) {
    _icd = json['icd'];
    _icdname = json['icdname'];
  }
  String? _icd;
  String? _icdname;

  String? get icd => _icd;
  String? get icdname => _icdname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icd'] = _icd;
    map['icdname'] = _icdname;
    return map;
  }
}