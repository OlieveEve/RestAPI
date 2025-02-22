import 'dart:convert';

import 'package:http/http.dart' as http;
import './model.dart';

class teamAPI {
  Future getTeams() async {
    List teamList = [];
    var response = await http.get(Uri.https('balldontlie.io', 'api/v1/teams'));
    if (response.statusCode == 200) {
      print(response.body);
      var jsonData = jsonDecode(response.body);
      for (var data in jsonData['data']) {
        final team = Teams(
          abbreviation: data['abbreviation'],
          city: data['city'],
        );
        teamList.add(team);
      }
      // print(teamList.length);
    } else {
      throw Exception('Failed to load data');
    }
    return teamList;
  }
}
