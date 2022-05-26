/// port : "AEAUH"
/// portName : "ABU DHABI PORT"

class DestinationPort {
  DestinationPort({
    String? port,
    String? portName,
  }) {
    _port = port;
    _portName = portName;
  }

  DestinationPort.fromJson(dynamic json) {
    _port = json['port'];
    _portName = json['portName'];
  }
  String? _port;
  String? _portName;
  DestinationPort copyWith({
    String? port,
    String? portName,
  }) =>
      DestinationPort(
        port: port ?? _port,
        portName: portName ?? _portName,
      );
  String? get port => _port;
  String? get portName => _portName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['port'] = _port;
    map['portName'] = _portName;
    return map;
  }

  @override
  toString() => '$_portName';
}
