/// port : "AEAUH"
/// portname : "ABU DHABI PORT"

class LoadingPort {
  LoadingPort({
      String? port, 
      String? portname,}){
    _port = port;
    _portname = portname;
}

  LoadingPort.fromJson(dynamic json) {
    _port = json['port'];
    _portname = json['portname'];
  }
  String? _port;
  String? _portname;

  String? get port => _port;
  String? get portname => _portname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['port'] = _port;
    map['portname'] = _portname;
    return map;
  }

}