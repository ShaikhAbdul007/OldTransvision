/// port : "AEAUH"
/// portname : "ABU DHABI PORT"

class DestinationPort {
  DestinationPort({
    String? port,
    String? portname,
  }) {
    _port = port;
    _portname = portname;
  }

  DestinationPort.fromJson(dynamic json) {
    _port = json['port'];
    _portname = json['portname'];
  }
  String? _port;
  String? _portname;
  DestinationPort copyWith({
    String? port,
    String? portname,
  }) =>
      DestinationPort(
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

  @override
  toString() => '$_portname';
}
