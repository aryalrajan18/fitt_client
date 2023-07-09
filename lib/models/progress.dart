import 'dart:convert';

Progress progressFromJson(String str) => Progress.fromJson(json.decode(str));

String progressToJson(Progress data) => json.encode(data.toJson());

class Progress {
  Progress({
    required this.userId,
    required this.planId,
    required this.planStart,
    required this.id,
    required this.activeDay,
  });

  String userId;
  String planId;
  DateTime planStart;
  String id;
  List<ActiveDay> activeDay;

  factory Progress.fromJson(Map<String, dynamic> json) => Progress(
        userId: json["userId"],
        planId: json["planId"],
        planStart: DateTime.parse(json["planStart"]),
        id: json["_id"],
        activeDay: List<ActiveDay>.from(
            json["activeDay"].map((x) => ActiveDay.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "planId": planId,
        "planStart": planStart.toIso8601String(),
        "_id": id,
        "activeDay": List<dynamic>.from(activeDay.map((x) => x.toJson())),
      };
}

class ActiveDay {
  ActiveDay({
    required this.workouts,
    required this.timeStart,
    required this.timeEnd,
  });

  int workouts;
  DateTime timeStart;
  DateTime timeEnd;

  factory ActiveDay.fromJson(Map<String, dynamic> json) => ActiveDay(
        workouts: json["workouts"],
        timeStart: DateTime.parse(json["timeStart"]),
        timeEnd: DateTime.parse(json["timeEnd"]),
      );

  Map<String, dynamic> toJson() => {
        "workouts": workouts,
        "timeStart": timeStart.toIso8601String(),
        "timeEnd": timeEnd.toIso8601String(),
      };
}
