/// icd : "INAMG"
/// icdName : "AMINGAON"

class IcdTo {
  IcdTo({
    String? icd,
    String? icdName,
  }) {
    _icd = icd;
    _icdName = icdName;
  }

  IcdTo.fromJson(dynamic json) {
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

  @override
  toString() => '$_icdName';
}
