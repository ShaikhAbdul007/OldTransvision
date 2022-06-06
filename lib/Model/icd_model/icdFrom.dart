/// icd : "INAMG"
/// icdname : "AMINGAON"

class Icdfrom {
  Icdfrom({
    String? icd,
    String? icdname,
  }) {
    _icd = icd;
    _icdname = icdname;
  }

  Icdfrom.fromJson(dynamic json) {
    _icd = json['icd'];
    _icdname = json['icdname'];
  }
  String? _icd;
  String? _icdname;
  Icdfrom copyWith({
    String? icd,
    String? icdname,
  }) =>
      Icdfrom(
        icd: icd ?? _icd,
        icdname: icdname ?? _icdname,
      );
  String? get icd => _icd;
  String? get icdname => _icdname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icd'] = _icd;
    map['icdname'] = _icdname;
    return map;
  }

  @override
  toString() => '$_icdname';
}
