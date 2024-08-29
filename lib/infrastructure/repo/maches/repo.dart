import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mere_maahi_dummy/api/apis.dart';
import 'package:mere_maahi_dummy/main.dart';
import 'package:mere_maahi_dummy/model/matchesmodel.dart';
import 'package:mere_maahi_dummy/model/randomusers.dart';

class MatchesRepoScreen {
  static Future<List<MatchesFetchModel>> matchesFetch() async {
    final response = await http.get(
      Uri.parse('${Apis.baseUrl}user/match'),
      headers: {
        'Authorization': 'Bearer $accesstocken',
        'Content-Type': 'application/json',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['matches'];
      return jsonResponse
          .map((data) => MatchesFetchModel.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load matches');
    }
  }
}

class RandomUserFechRepo {
  static Future<RandomUsersModel> randomUser() async {
    final response = await http.get(
      Uri.parse('${Apis.baseUrl}user/search/random'),
      headers: {
        'Authorization': 'Bearer $accesstocken',
        'Content-Type': 'application/json',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      // Parse the entire response to RandomUsersModel
      final jsonResponse = json.decode(response.body);
      return RandomUsersModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
