/// voyage : "0012A"

class Voyage {
  Voyage({
    String? voyage,
  }) {
    _voyage = voyage;
  }

  Voyage.fromJson(dynamic json) {
    _voyage = json['voyage'];
  }
  String? _voyage;
  Voyage copyWith({
    String? voyage,
  }) =>
      Voyage(
        voyage: voyage ?? _voyage,
      );
  String? get voyage => _voyage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['voyage'] = _voyage;
    return map;
  }
}
