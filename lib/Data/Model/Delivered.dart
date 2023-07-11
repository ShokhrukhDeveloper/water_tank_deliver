class Delivered {
  Delivered({
      this.productName, 
      this.price, 
      this.quantity, 
      this.totalPrice, 
       this.productId,});

  Delivered.fromJson(dynamic json) {
    productName = json['productName'];
    price = json['price'];
    quantity = json['quantity'];
    totalPrice = json['totalPrice'];
    productId = json['productId'];
  }
  String? productName;
  int? price;
  int? quantity;
  int? totalPrice;
  int? productId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productName'] = productName;
    map['price'] = price;
    map['quantity'] = quantity;
    map['totalPrice'] = totalPrice;
    map['productId'] = productId;
    return map;
  }

}