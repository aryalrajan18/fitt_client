import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.fullname,
    required this.age,
    required this.gender,
    required this.weight,
    required this.height,
    required this.level,
    required this.goal,
  });

  String id;
  String fullname;
  dynamic age;
  String gender;
  dynamic weight;
  dynamic height;
  String level;
  String goal;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        fullname: json["fullname"],
        age: json["age"],
        gender: json["gender"],
        weight: json["weight"],
        height: json["height"],
        level: json["level"],
        goal: json["goal"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "age": age,
        "gender": gender,
        "weight": weight,
        "height": height,
        "level": level,
        "goal": goal,
      };
}
