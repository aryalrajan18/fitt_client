import 'dart:convert';

RequestProgress progressFromJson(String str) =>
    RequestProgress.fromJson(json.decode(str));

String progressToJson(RequestProgress data) => json.encode(data.toJson());

class RequestProgress {
  RequestProgress({
    required this.planId,
  });

  String planId;

  factory RequestProgress.fromJson(Map<String, dynamic> json) =>
      RequestProgress(
        planId: json["planId"],
      );

  Map<String, dynamic> toJson() => {
        "planId": planId,
      };
}
