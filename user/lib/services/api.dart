import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:user/models/product.dart';

class FoodApiService {
  // static String baseUrl = "http://112.219.28.28:3000";
  static String baseUrl = "http://127.0.0.1:3000";
  static String subUrl = "food_menu";

  static Future<List<FoodList>> getFoodList() async {
    try {
      final url = Uri.parse('$baseUrl/$subUrl');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> foods = jsonDecode(response.body);
        return foods.map((food) => FoodList.fromJson(food)).toList();
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

class GameApiService {
  static String baseUrl = "http://112.219.28.28:3000";
  static String subUrl = "food_menu";

  static Future<List<GameList>> getGameList() async {
    try {
      final url = Uri.parse('$baseUrl/$subUrl');
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

class OrderApiService {
  // static String baseUrl = "http://112.219.28.28:3000";
  static String baseUrl = "http://127.0.0.1:3000";
  static String subUrl = "order";

  static Future<List<FoodList>> getFoodList() async {
    try {
      final url = Uri.parse('$baseUrl/$subUrl');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> foods = jsonDecode(response.body);
        return foods.map((food) => FoodList.fromJson(food)).toList();
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
