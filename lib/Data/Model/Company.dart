class Company {
  Company({
       this.companyName,
       this.companyDescription,
       this.address,
       this.phone,
       this.image,
       this.id,
      this.createdAt, 
      this.updatedAt,});

  Company.fromJson(dynamic json) {
    companyName = json['companyName'];
    companyDescription = json['companyDescription'];
    address = json['address'];
    phone = json['phone'];
    image = json['image'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? companyName;
  String? companyDescription;
  String? address;
  String? phone;
  String? image;
  int? id;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['companyName'] = companyName;
    map['companyDescription'] = companyDescription;
    map['address'] = address;
    map['phone'] = phone;
    map['image'] = image;
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}