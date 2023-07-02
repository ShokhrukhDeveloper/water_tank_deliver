
class Product {
  Product({
      num? companyId, 
      num? adminId, 
      String? name, 
      String? description, 
      num? quantity, 
      num? priceIn, 
      num? priceOut, 
      String? image, 
      bool? isActive, 
      num? id, 
      dynamic createdAt, 
      dynamic updatedAt,}){
    _companyId = companyId;
    _adminId = adminId;
    _name = name;
    _description = description;
    _quantity = quantity;
    _priceIn = priceIn;
    _priceOut = priceOut;
    _image = image;
    _isActive = isActive;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Product.fromJson(dynamic json) {
    _companyId = json['companyId'];
    _adminId = json['adminId'];
    _name = json['name'];
    _description = json['description'];
    _quantity = json['quantity'];
    _priceIn = json['priceIn'];
    _priceOut = json['priceOut'];
    _image = json['image'];
    _isActive = json['isActive'];
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  int count=0;
  num? _companyId;
  num? _adminId;
  String? _name;
  String? _description;
  num? _quantity;
  num? _priceIn;
  num? _priceOut;
  String? _image;
  bool? _isActive;
  num? _id;
  dynamic _createdAt;
  dynamic _updatedAt;
Product copyWith({  num? companyId,
  num? adminId,
  String? name,
  String? description,
  num? quantity,
  num? priceIn,
  num? priceOut,
  String? image,
  bool? isActive,
  num? id,
  dynamic createdAt,
  dynamic updatedAt,
}) => Product(  companyId: companyId ?? _companyId,
  adminId: adminId ?? _adminId,
  name: name ?? _name,
  description: description ?? _description,
  quantity: quantity ?? _quantity,
  priceIn: priceIn ?? _priceIn,
  priceOut: priceOut ?? _priceOut,
  image: image ?? _image,
  isActive: isActive ?? _isActive,
  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get companyId => _companyId;
  num? get adminId => _adminId;
  String? get name => _name;
  String? get description => _description;
  num? get quantity => _quantity;
  num? get priceIn => _priceIn;
  num? get priceOut => _priceOut;
  String? get image => _image;
  bool? get isActive => _isActive;
  num? get id => _id;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['companyId'] = _companyId;
    map['adminId'] = _adminId;
    map['name'] = _name;
    map['description'] = _description;
    map['quantity'] = _quantity;
    map['priceIn'] = _priceIn;
    map['priceOut'] = _priceOut;
    map['image'] = _image;
    map['isActive'] = _isActive;
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}