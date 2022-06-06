/// icd : "INAMG"
/// icdname : "AMINGAON"

class Icdto {
  Icdto({
    String? icd,
    String? icdname,
  }) {
    _icd = icd;
    _icdname = icdname;
  }

  Icdto.fromJson(dynamic json) {
    _icd = json['icd'];
    _icdname = json['icdname'];
  }
  String? _icd;
  String? _icdname;
  Icdto copyWith({
    String? icd,
    String? icdname,
  }) =>
      Icdto(
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
