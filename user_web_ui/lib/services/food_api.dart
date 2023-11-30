import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:user_web_ui/models/food_list.dart';

class FoodApiService {
  //our test api
  static String baseUrl = "http://127.0.0.1:3000";
  static String foodmenu = "food_menu";

  static Future<List<FoodList>> getFoodList() async {
    try {
      final url = Uri.parse('$baseUrl/$foodmenu');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> foods = jsonDecode(response.body);
        return foods.map((food) => FoodList.fromJson(food)).toList();
      } else {
        // 상태 코드가 200이 아닌 경우 오류 메ㅊ시지 반환
        throw Exception('Failed to load food list');
      }
    } catch (e) {
      // 네트워크 오류나 기타 예외 처리
      throw Exception('Error occurred: $e');
    }
  }
}
