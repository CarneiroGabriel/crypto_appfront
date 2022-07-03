import 'package:cloud_firestore/cloud_firestore.dart';

class Coins{
  String id;
  final double price;
  final DateTime when;

  Coins({
    this.id = "",
    required this.price,
    required this.when
});

  Map<String, dynamic> toJson() => {
      "id" : id,
      "price" : price,
      "when" : when
  };

  static Coins fromJson(Map<String, dynamic> json) => Coins(
    id: json["id"],
    price: json["price"],
    when: (json["when"] as Timestamp).toDate(),
  );
}