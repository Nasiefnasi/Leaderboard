// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:leaderboardapp/model/leadermodel/leader_model.dart';
import 'package:leaderboardapp/model/storehive/storedata.dart';

class ApiControler extends ChangeNotifier {
  List<GetModels> data = [];
  List<GetModelshive> datahive = [];
  String? regionx;
  dynamic regionhive;

  Future fetchResource() async {
    final url = Uri.parse(
        "https://run.mocky.io/v3/078310bd-5004-4d1e-af40-65917daa6eeb");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final getmodel = getModelsFromJson(response.body);
        data.add(getmodel);
        regionx = getmodel.region;

        saveDataToHive(getmodel);
      } else {
        throw Exception('Failed to load ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<void> saveDataToHive(GetModels getmodel) async {
    final box = await Hive.openBox<GetModelshive>("hive_box");

    getmodel.leaders.sort((a, b) => b.points.compareTo(a.points));

    final topThreeLeaders = getmodel.leaders.take(3).toList();

    final getModelshive = GetModelshive(
      region: getmodel.region,
      leaderss: getmodel.leaders
          .map((leader) => Leaders(
                userId: leader.userId,
                name: leader.name,
                profilePic: leader.profilePic,
                points: leader.points,
              ))
          .toList(),
    );

    await box.put("key", getModelshive);
  }
}
