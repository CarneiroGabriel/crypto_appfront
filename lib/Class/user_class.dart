class UserBD {
  String id;
  final String name;
  final int age;


  UserBD({
    this.id = '',
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "age": age,
  };

  static UserBD fromJson(Map<String, dynamic> json) => UserBD(
    id: json["id"],
    name: json["name"],
    age: json["age"],
  );
}
