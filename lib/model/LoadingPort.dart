/// port : "AEAUH"
/// portname : "ABU DHABI PORT"

class Loadingport {
  Loadingport({
    String? port,
    String? portname,
  }) {
    _port = port;
    _portname = portname;
  }

  Loadingport.fromJson(dynamic json) {
    _port = json['port'];
    _portname = json['portname'];
  }
  String? _port;
  String? _portname;
  Loadingport copyWith({
    String? port,
    String? portname,
  }) =>
      Loadingport(
        port: port ?? _port,
        portname: portname ?? _portname,
      );
  String? get port => _port;
  String? get portname => _portname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['port'] = _port;
    map['portname'] = _portname;
    return map;
  }
}
