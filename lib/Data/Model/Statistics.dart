import 'Delivered.dart';

class Statistics {
  Statistics({
      this.delivered,});

  Statistics.fromJson(dynamic json) {
    if (json['delivered'] != null) {
      delivered = [];
      json['delivered'].forEach((v) {
        delivered?.add(Delivered.fromJson(v));
      });
    }
  }
  List<Delivered>? delivered;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['delivered'] = delivered?.map((v) => v.toJson()).toList();
    return map;
  }

}