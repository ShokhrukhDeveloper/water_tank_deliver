

class User {
  User({
      num? companyId, 
      String? name, 
      String? address, 
      String? phone, 
      num? tankCount, 
      num? balanse, 
      dynamic passwordHash, 
      num? id, 
      dynamic createdAt, 
      dynamic updatedAt,}){
    _companyId = companyId;
    _name = name;
    _address = address;
    _phone = phone;
    _tankCount = tankCount;
    _balanse = balanse;
    _passwordHash = passwordHash;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _companyId = json['companyId'];
    _name = json['name'];
    _address = json['address'];
    _phone = json['phone'];
    _tankCount = json['tankCount'];
    _balanse = json['balanse'];
    _passwordHash = json['passwordHash'];
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  num? _companyId;
  String? _name;
  String? _address;
  String? _phone;
  num? _tankCount;
  num? _balanse;
  dynamic _passwordHash;
  num? _id;
  dynamic _createdAt;
  dynamic _updatedAt;
User copyWith({  num? companyId,
  String? name,
  String? address,
  String? phone,
  num? tankCount,
  num? balanse,
  dynamic passwordHash,
  num? id,
  dynamic createdAt,
  dynamic updatedAt,
}) => User(  companyId: companyId ?? _companyId,
  name: name ?? _name,
  address: address ?? _address,
  phone: phone ?? _phone,
  tankCount: tankCount ?? _tankCount,
  balanse: balanse ?? _balanse,
  passwordHash: passwordHash ?? _passwordHash,
  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get companyId => _companyId;
  String? get name => _name;
  String? get address => _address;
  String? get phone => _phone;
  num? get tankCount => _tankCount;
  num? get balanse => _balanse;
  dynamic get passwordHash => _passwordHash;
  num? get id => _id;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['companyId'] = _companyId;
    map['name'] = _name;
    map['address'] = _address;
    map['phone'] = _phone;
    map['tankCount'] = _tankCount;
    map['balanse'] = _balanse;
    map['passwordHash'] = _passwordHash;
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}