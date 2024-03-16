// // ignore_for_file: unused_local_variable

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:leaderboardapp/model/leadermodel/leader_model.dart';

// class ApiControler extends ChangeNotifier {
//   dynamic data;

//   Future <dynamic> fetchResource() async {
//     final url = Uri.parse(
//         "https://run.mocky.io/v3/078310bd-5004-4d1e-af40-65917daa6eeb");
//     try {
//       final responne = await http.get(url);
//       if (responne.statusCode == 200) {
//         final datas = jsonDecode(responne.body)["leader"] as List<dynamic>;
//         final leader = datas.map((e) => Leader.formjosn(e)).toList();
//         return leader;
//       } else {
//         throw Exception('Failed to load ${responne.statusCode}');
//       }
//     } catch (e) {
//       throw Exception("Eror$e");
//     }
//   }
// }

// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:leaderboardapp/model/leadermodel/leader_model.dart';

class ApiControler extends ChangeNotifier {
  List<GetModels> data = [];
  String? regionx;

  Future fetchResource() async {
    final url = Uri.parse(
        "https://run.mocky.io/v3/078310bd-5004-4d1e-af40-65917daa6eeb");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final getmodel = getModelsFromJson(response.body);
        data.add(getmodel);
        regionx = getmodel.region;
        // final datas = jsonDecode(response.body)["leader"] as List<dynamic>;
        // final leaders = datas.map((e) => Leader.fromJson(e)).toList();
        // data = leaders;
        // return leaders;
        
      } else {
        throw Exception('Failed to load ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
