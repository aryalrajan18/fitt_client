import 'dart:convert';

Workout workoutFromJson(String str) => Workout.fromJson(json.decode(str));

String workoutToJson(Workout data) => json.encode(data.toJson());

class Workout {
  Workout({
    required this.id,
    required this.name,
    required this.focusArea,
    required this.desc,
    required this.steps,
  });

  String id;
  String name;
  String focusArea;
  String desc;
  List<String> steps;

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
        id: json["_id"],
        name: json["name"],
        focusArea: json["focusArea"],
        desc: json["desc"],
        steps: List<String>.from(json["steps"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "focusArea": focusArea,
        "desc": desc,
        "steps": List<dynamic>.from(steps.map((x) => x)),
      };
}
