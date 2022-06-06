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




// class DestinationPort {
//   DestinationPort({
//     String? port,
//     String? portName,
//   }) {
//     _port = port;
//     _portName = portName;
//   }

//   DestinationPort.fromJson(dynamic json) {
//     _port = json['port'];
//     _portName = json['portName'];
//   }
//   String? _port;
//   String? _portName;
//   DestinationPort copyWith({
//     String? port,
//     String? portName,
//   }) =>
//       DestinationPort(
//         port: port ?? _port,
//         portName: portName ?? _portName,
//       );
//   String? get port => _port;
//   String? get portName => _portName;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['port'] = _port;
//     map['portName'] = _portName;
//     return map;
//   }


// }
