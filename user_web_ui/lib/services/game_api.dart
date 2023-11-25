import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:user_web_ui/models/game_list.dart';

class GameApiService {
  //our test api
  static String baseUrl = "http://112.219.28.28:3000";
  static String gamemenu = "menu";

  /*nico test api
  static String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static String foodmenu = "today";
  */

  static Future<List<GameList>> getGameList() async {
    try {
      final url = Uri.parse('$baseUrl/$gamemenu');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> games = jsonDecode(response.body);
        return games.map((game) => GameList.fromJson(game)).toList();
      } else {
        // 상태 코드가 200이 아닌 경우 오류 메시지 반환
        throw Exception('Failed to load food list');
      }
    } catch (e) {
      // 네트워크 오류나 기타 예외 처리
      throw Exception('Error occurred: $e');
    }
  }
}
