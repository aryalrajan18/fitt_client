import 'dart:convert';

Plan planFromJson(String str) => Plan.fromJson(json.decode(str));

String planToJson(Plan data) => json.encode(data.toJson());

class Plan {
  Plan({
    required this.id,
    required this.name,
    required this.desc,
    required this.level,
    required this.goal,
    required this.totalWeeks,
    required this.weeks,
  });

  String id;
  String name;
  String desc;
  String level;
  String goal;
  int totalWeeks;
  List<Week> weeks;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["_id"],
        name: json["name"],
        desc: json["desc"],
        level: json["level"],
        goal: json["goal"],
        totalWeeks: json["totalWeeks"],
        weeks: List<Week>.from(json["weeks"].map((x) => Week.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "desc": desc,
        "level": level,
        "goal": goal,
        "totalWeeks": totalWeeks,
        "weeks": List<dynamic>.from(weeks.map((x) => x.toJson())),
      };
}

class Week {
  Week({
    required this.days,
    required this.id,
  });

  List<Day> days;
  String id;

  factory Week.fromJson(Map<String, dynamic> json) => Week(
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
        "_id": id,
      };
}

class Day {
  Day({
    required this.workouts,
    required this.id,
  });

  List<Workout> workouts;
  String id;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        workouts: List<Workout>.from(
            json["workouts"].map((x) => Workout.fromJson(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "workouts": List<dynamic>.from(workouts.map((x) => x.toJson())),
        "_id": id,
      };
}

class Workout {
  Workout({
    required this.wid,
    required this.sets,
    required this.reps,
    required this.weights,
    required this.id,
  });

  String wid;
  int sets;
  List<int> reps;
  List<int> weights;
  String id;

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
        wid: json["wid"],
        sets: json["sets"],
        reps: List<int>.from(json["reps"].map((x) => x)),
        weights: List<int>.from(json["weights"].map((x) => x)),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "wid": wid,
        "sets": sets,
        "reps": List<dynamic>.from(reps.map((x) => x)),
        "weights": List<dynamic>.from(weights.map((x) => x)),
        "_id": id,
      };
}
