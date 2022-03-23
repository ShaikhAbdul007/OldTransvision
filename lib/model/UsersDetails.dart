/// add1 : "66/5A BHARAT COAL COMPOUND"
/// add2 : "BAIL BAZAR, KALE MARG ,"
/// add3 : "KURLA (W)"
/// city : "MUMBAI"
/// contno : "0"
/// country : "INDIA"
/// email : ""
/// email1 : ""
/// email2 : ""
/// mail : "Y"
/// mobno : "0"
/// panno : ""
/// passemail : "0"
/// pincode : "400070"
/// state : ""
/// statecode : ""
/// staxno : ""
/// username : "C100"

class UserDetails {
  UserDetails({
      String? add1, 
      String? add2, 
      String? add3, 
      String? city, 
      String? contno, 
      String? country, 
      String? email, 
      String? email1, 
      String? email2, 
      String? mail, 
      String? mobno, 
      String? panno, 
      String? passemail, 
      String? pincode, 
      String? state, 
      String? statecode, 
      String? staxno, 
      String? username,})

  {
    _add1 = add1;
    _add2 = add2;
    _add3 = add3;
    _city = city;
    _contno = contno;
    _country = country;
    _email = email;
    _email1 = email1;
    _email2 = email2;
    _mail = mail;
    _mobno = mobno;
    _panno = panno;
    _passemail = passemail;
    _pincode = pincode;
    _state = state;
    _statecode = statecode;
    _staxno = staxno;
    _username = username;
}

  UserDetails.fromJson(dynamic json) {
    _add1 = json['add1'];
    _add2 = json['add2'];
    _add3 = json['add3'];
    _city = json['city'];
    _contno = json['contno'];
    _country = json['country'];
    _email = json['email'];
    _email1 = json['email1'];
    _email2 = json['email2'];
    _mail = json['mail'];
    _mobno = json['mobno'];
    _panno = json['panno'];
    _passemail = json['passemail'];
    _pincode = json['pincode'];
    _state = json['state'];
    _statecode = json['statecode'];
    _staxno = json['staxno'];
    _username = json['username'];
  }
  String? _add1;
  String? _add2;
  String? _add3;
  String? _city;
  String? _contno;
  String? _country;
  String? _email;
  String? _email1;
  String? _email2;
  String? _mail;
  String? _mobno;
  String? _panno;
  String? _passemail;
  String? _pincode;
  String? _state;
  String? _statecode;
  String? _staxno;
  String? _username;

  String? get add1 => _add1;
  String? get add2 => _add2;
  String? get add3 => _add3;
  String? get city => _city;
  String? get contno => _contno;
  String? get country => _country;
  String? get email => _email;
  String? get email1 => _email1;
  String? get email2 => _email2;
  String? get mail => _mail;
  String? get mobno => _mobno;
  String? get panno => _panno;
  String? get passemail => _passemail;
  String? get pincode => _pincode;
  String? get state => _state;
  String? get statecode => _statecode;
  String? get staxno => _staxno;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['add1'] = _add1;
    map['add2'] = _add2;
    map['add3'] = _add3;
    map['city'] = _city;
    map['contno'] = _contno;
    map['country'] = _country;
    map['email'] = _email;
    map['email1'] = _email1;
    map['email2'] = _email2;
    map['mail'] = _mail;
    map['mobno'] = _mobno;
    map['panno'] = _panno;
    map['passemail'] = _passemail;
    map['pincode'] = _pincode;
    map['state'] = _state;
    map['statecode'] = _statecode;
    map['staxno'] = _staxno;
    map['username'] = _username;
    return map;
  }

}