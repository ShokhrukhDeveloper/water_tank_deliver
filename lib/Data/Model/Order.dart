/// userId : 1
/// companyId : 1
/// deliverId : null
/// address : "string"
/// productName : "Salom"
/// productId : 1
/// status : 0
/// quantity : 2
/// price : 24000
/// totalPrice : 48000
/// acceptedAt : "0001-01-01T00:00:00"
/// deliveredAt : "0001-01-01T00:00:00"
/// cancelledAt : "0001-01-01T00:00:00"
/// id : 17
/// createdAt : ""
/// updatedAt : ""

class Order {
  Order({
      num? userId, 
      num? companyId, 
      dynamic deliverId, 
      String? address, 
      String? productName, 
      num? productId, 
      num? status, 
      num? quantity, 
      num? price, 
      num? totalPrice, 
      String? acceptedAt, 
      String? deliveredAt, 
      String? cancelledAt, 
      num? id, 
      String? createdAt, 
      String? updatedAt,}){
    _userId = userId;
    _companyId = companyId;
    _deliverId = deliverId;
    _address = address;
    _productName = productName;
    _productId = productId;
    _status = status;
    _quantity = quantity;
    _price = price;
    _totalPrice = totalPrice;
    _acceptedAt = acceptedAt;
    _deliveredAt = deliveredAt;
    _cancelledAt = cancelledAt;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Order.fromJson(dynamic json) {
    _userId = json['userId'];
    _companyId = json['companyId'];
    _deliverId = json['deliverId'];
    _address = json['address'];
    _productName = json['productName'];
    _productId = json['productId'];
    _status = json['status'];
    _quantity = json['quantity'];
    _price = json['price'];
    _totalPrice = json['totalPrice'];
    _acceptedAt = json['acceptedAt'];
    _deliveredAt = json['deliveredAt'];
    _cancelledAt = json['cancelledAt'];
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  num? _userId;
  num? _companyId;
  dynamic _deliverId;
  String? _address;
  String? _productName;
  num? _productId;
  num? _status;
  num? _quantity;
  num? _price;
  num? _totalPrice;
  String? _acceptedAt;
  String? _deliveredAt;
  String? _cancelledAt;
  num? _id;
  String? _createdAt;
  String? _updatedAt;
Order copyWith({  num? userId,
  num? companyId,
  dynamic deliverId,
  String? address,
  String? productName,
  num? productId,
  num? status,
  num? quantity,
  num? price,
  num? totalPrice,
  String? acceptedAt,
  String? deliveredAt,
  String? cancelledAt,
  num? id,
  String? createdAt,
  String? updatedAt,
}) => Order(  userId: userId ?? _userId,
  companyId: companyId ?? _companyId,
  deliverId: deliverId ?? _deliverId,
  address: address ?? _address,
  productName: productName ?? _productName,
  productId: productId ?? _productId,
  status: status ?? _status,
  quantity: quantity ?? _quantity,
  price: price ?? _price,
  totalPrice: totalPrice ?? _totalPrice,
  acceptedAt: acceptedAt ?? _acceptedAt,
  deliveredAt: deliveredAt ?? _deliveredAt,
  cancelledAt: cancelledAt ?? _cancelledAt,
  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get userId => _userId;
  num? get companyId => _companyId;
  dynamic get deliverId => _deliverId;
  String? get address => _address;
  String? get productName => _productName;
  num? get productId => _productId;
  num? get status => _status;
  num? get quantity => _quantity;
  num? get price => _price;
  num? get totalPrice => _totalPrice;
  String? get acceptedAt => _acceptedAt;
  String? get deliveredAt => _deliveredAt;
  String? get cancelledAt => _cancelledAt;
  num? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['companyId'] = _companyId;
    map['deliverId'] = _deliverId;
    map['address'] = _address;
    map['productName'] = _productName;
    map['productId'] = _productId;
    map['status'] = _status;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['totalPrice'] = _totalPrice;
    map['acceptedAt'] = _acceptedAt;
    map['deliveredAt'] = _deliveredAt;
    map['cancelledAt'] = _cancelledAt;
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}