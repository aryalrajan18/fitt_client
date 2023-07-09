import 'dart:convert';

UpdateProgress updateProgressFromJson(String str) =>
    UpdateProgress.fromJson(json.decode(str));

String updateProgressToJson(UpdateProgress data) => json.encode(data.toJson());

class UpdateProgress {
  UpdateProgress({
    required this.activeDay,
  });

  ActiveDay activeDay;

  factory UpdateProgress.fromJson(Map<String, dynamic> json) => UpdateProgress(
        activeDay: ActiveDay.fromJson(json["activeDay"]),
      );

  Map<String, dynamic> toJson() => {
        "activeDay": activeDay.toJson(),
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
