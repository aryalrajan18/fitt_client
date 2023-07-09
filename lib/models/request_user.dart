import 'dart:convert';

RequestUser storeUserFromJson(String str) =>
    RequestUser.fromJson(json.decode(str));

String userToJson(RequestUser data) => json.encode(data.toJson());

class RequestUser {
  RequestUser({
    required this.fullname,
    required this.age,
    required this.gender,
    required this.weight,
    required this.height,
    required this.level,
    required this.goal,
  });

  String fullname;
  dynamic age;
  String gender;
  dynamic weight;
  dynamic height;
  String level;
  String goal;

  factory RequestUser.fromJson(Map<String, dynamic> json) => RequestUser(
        fullname: json["fullname"],
        age: json["age"],
        gender: json["gender"],
        weight: json["weight"],
        height: json["height"],
        level: json["level"],
        goal: json["goal"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "age": age,
        "gender": gender,
        "weight": weight,
        "height": height,
        "level": level,
        "goal": goal,
      };
}
