/// add1 : "66/5A BHARAT COAL COMPOUND"
/// add2 : "BAIL BAZAR, KALE MARG ,"
/// add3 : "KURLA (W)"
/// br : "INNSA"
/// city : "MUMBAI"
/// code : "C100"
/// contactPerson : ""
/// contNo : "0"
/// country : "INDIA"
/// email : ""
/// email1 : ""
/// email2 : ""
/// firmNo : "123"
/// fyr : "2021-2022"
/// gstNo : ""
/// mail : "Y"
/// mobNo : "0"
/// name : "M/S JAJ INTERNATIONAL"
/// panNo : ""
/// passEmail : "0"
/// password : "TSV12345"
/// pinCode : "400070"
/// state : ""
/// stateCode : ""
/// staxNo : ""
/// username : "C100"

class UserDetails {
  UserDetails({
    String? add1,
    String? add2,
    String? add3,
    String? br,
    String? city,
    String? code,
    String? contactPerson,
    String? contNo,
    String? country,
    String? email,
    String? email1,
    String? email2,
    String? firmNo,
    String? fyr,
    String? gstNo,
    String? mail,
    String? mobNo,
    String? name,
    String? panNo,
    String? passEmail,
    String? password,
    String? pinCode,
    String? state,
    String? stateCode,
    String? staxNo,
    String? username,
  }) {
    _add1 = add1;
    _add2 = add2;
    _add3 = add3;
    _br = br;
    _city = city;
    _code = code;
    _contactPerson = contactPerson;
    _contNo = contNo;
    _country = country;
    _email = email;
    _email1 = email1;
    _email2 = email2;
    _firmNo = firmNo;
    _fyr = fyr;
    _gstNo = gstNo;
    _mail = mail;
    _mobNo = mobNo;
    _name = name;
    _panNo = panNo;
    _passEmail = passEmail;
    _password = password;
    _pinCode = pinCode;
    _state = state;
    _stateCode = stateCode;
    _staxNo = staxNo;
    _username = username;
  }

  UserDetails.fromJson(dynamic json) {
    _add1 = json['add1'];
    _add2 = json['add2'];
    _add3 = json['add3'];
    _br = json['br'];
    _city = json['city'];
    _code = json['code'];
    _contactPerson = json['contactPerson'];
    _contNo = json['contNo'];
    _country = json['country'];
    _email = json['email'];
    _email1 = json['email1'];
    _email2 = json['email2'];
    _firmNo = json['firmNo'];
    _fyr = json['fyr'];
    _gstNo = json['gstNo'];
    _mail = json['mail'];
    _mobNo = json['mobNo'];
    _name = json['name'];
    _panNo = json['panNo'];
    _passEmail = json['passEmail'];
    _password = json['password'];
    _pinCode = json['pinCode'];
    _state = json['state'];
    _stateCode = json['stateCode'];
    _staxNo = json['staxNo'];
    _username = json['username'];
  }
  String? _add1;
  String? _add2;
  String? _add3;
  String? _br;
  String? _city;
  String? _code;
  String? _contactPerson;
  String? _contNo;
  String? _country;
  String? _email;
  String? _email1;
  String? _email2;
  String? _firmNo;
  String? _fyr;
  String? _gstNo;
  String? _mail;
  String? _mobNo;
  String? _name;
  String? _panNo;
  String? _passEmail;
  String? _password;
  String? _pinCode;
  String? _state;
  String? _stateCode;
  String? _staxNo;
  String? _username;
  UserDetails copyWith({
    String? add1,
    String? add2,
    String? add3,
    String? br,
    String? city,
    String? code,
    String? contactPerson,
    String? contNo,
    String? country,
    String? email,
    String? email1,
    String? email2,
    String? firmNo,
    String? fyr,
    String? gstNo,
    String? mail,
    String? mobNo,
    String? name,
    String? panNo,
    String? passEmail,
    String? password,
    String? pinCode,
    String? state,
    String? stateCode,
    String? staxNo,
    String? username,
  }) =>
      UserDetails(
        add1: add1 ?? _add1,
        add2: add2 ?? _add2,
        add3: add3 ?? _add3,
        br: br ?? _br,
        city: city ?? _city,
        code: code ?? _code,
        contactPerson: contactPerson ?? _contactPerson,
        contNo: contNo ?? _contNo,
        country: country ?? _country,
        email: email ?? _email,
        email1: email1 ?? _email1,
        email2: email2 ?? _email2,
        firmNo: firmNo ?? _firmNo,
        fyr: fyr ?? _fyr,
        gstNo: gstNo ?? _gstNo,
        mail: mail ?? _mail,
        mobNo: mobNo ?? _mobNo,
        name: name ?? _name,
        panNo: panNo ?? _panNo,
        passEmail: passEmail ?? _passEmail,
        password: password ?? _password,
        pinCode: pinCode ?? _pinCode,
        state: state ?? _state,
        stateCode: stateCode ?? _stateCode,
        staxNo: staxNo ?? _staxNo,
        username: username ?? _username,
      );
  String? get add1 => _add1;
  String? get add2 => _add2;
  String? get add3 => _add3;
  String? get br => _br;
  String? get city => _city;
  String? get code => _code;
  String? get contactPerson => _contactPerson;
  String? get contNo => _contNo;
  String? get country => _country;
  String? get email => _email;
  String? get email1 => _email1;
  String? get email2 => _email2;
  String? get firmNo => _firmNo;
  String? get fyr => _fyr;
  String? get gstNo => _gstNo;
  String? get mail => _mail;
  String? get mobNo => _mobNo;
  String? get name => _name;
  String? get panNo => _panNo;
  String? get passEmail => _passEmail;
  String? get password => _password;
  String? get pinCode => _pinCode;
  String? get state => _state;
  String? get stateCode => _stateCode;
  String? get staxNo => _staxNo;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['add1'] = _add1;
    map['add2'] = _add2;
    map['add3'] = _add3;
    map['br'] = _br;
    map['city'] = _city;
    map['code'] = _code;
    map['contactPerson'] = _contactPerson;
    map['contNo'] = _contNo;
    map['country'] = _country;
    map['email'] = _email;
    map['email1'] = _email1;
    map['email2'] = _email2;
    map['firmNo'] = _firmNo;
    map['fyr'] = _fyr;
    map['gstNo'] = _gstNo;
    map['mail'] = _mail;
    map['mobNo'] = _mobNo;
    map['name'] = _name;
    map['panNo'] = _panNo;
    map['passEmail'] = _passEmail;
    map['password'] = _password;
    map['pinCode'] = _pinCode;
    map['state'] = _state;
    map['stateCode'] = _stateCode;
    map['staxNo'] = _staxNo;
    map['username'] = _username;
    return map;
  }
}
