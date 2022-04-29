/// port : "AEAUH"
/// portName : "ABU DHABI PORT"

class LoadingPort {
  LoadingPort({
    String? port,
    String? portName,
  }) {
    _port = port;
    _portName = portName;
  }

  LoadingPort.fromJson(Map<dynamic, dynamic> json) {
    _port = json['port'];
    _portName = json['portName'];
  }
  String? _port;
  String? _portName;

  String? get port => _port;
  String? get portName => _portName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['port'] = _port;
    map['portName'] = _portName;
    return map;
  }
}
