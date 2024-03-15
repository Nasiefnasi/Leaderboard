// class Leader {
//   final String? userId;
//   final String? name;
//   final String? profilePic;
//   final int? points;
//   final String? region;
//   Leader({
//     this.userId,
//     this.name,
//     this.profilePic,
//     this.points,
//     this.region,
//   });
//   factory Leader.fromJson(Map<String, dynamic> map) {
//     return Leader(
//         userId: map["userId"],
//         name: map["name"],
//         profilePic: map["profilePic"],
//         points: map["point"],
//         region: map["region"]);
//   }
// }

// To parse this JSON data, do
//
//     final getModels = getModelsFromJson(jsonString);

import 'dart:convert';

GetModels getModelsFromJson(String str) => GetModels.fromJson(json.decode(str));

// String getModelsToJson(GetModels data) => json.encode(data.toJson());

class GetModels {
  String region;
  List<Leader> leaders;

  GetModels({
    required this.region,
    required this.leaders,
  });

  factory GetModels.fromJson(Map<String, dynamic> json) => GetModels(
        region: json["region"],
        leaders:
            List<Leader>.from(json["leaders"].map((x) => Leader.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "region": region,
        "leaders": List<dynamic>.from(leaders.map((x) => x.toJson())),
      };
}

class Leader {
  String userId;
  String name;
  String profilePic;
  int points;

  Leader({
    required this.userId,
    required this.name,
    required this.profilePic,
    required this.points,
  });

  factory Leader.fromJson(Map<String, dynamic> json) => Leader(
        userId: json["userId"],
        name: json["name"],
        profilePic: json["profilePic"],
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "profilePic": profilePic,
        "points": points,
      };
}
