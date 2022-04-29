/// icd : "INAMG"
/// icdName : "AMINGAON"

class IcdFrom {
  IcdFrom({
    String? icd,
    String? icdName,
  }) {
    _icd = icd;
    _icdName = icdName;
  }

  IcdFrom.fromJson(Map<dynamic, dynamic> json) {
    _icd = json['icd'];
    _icdName = json['icdName'];
  }
  String? _icd;
  String? _icdName;

  String? get icd => _icd;
  String? get icdName => _icdName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icd'] = _icd;
    map['icdName'] = _icdName;
    return map;
  }
}
