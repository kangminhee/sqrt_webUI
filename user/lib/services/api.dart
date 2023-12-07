import 'dart:convert';
import 'dart:async';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:user/models/cartmodel.dart';

// import 'package:user/models/product.dart';

class FoodApiService {
  static String baseUrl = "http://112.219.28.28:3000";
  // static String baseUrl = "http://127.0.0.1:5050";
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
  // static String baseUrl = "http://112.219.28.28:3000";
  static String baseUrl = "http://127.0.0.1:5050";
  static String subUrl = "game_menu";

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
  static String baseUrl = "http://112.219.28.28:3000";
  // static const String baseUrl = "http://127.0.0.1:5050";
  static const String subUrl = "order";

  static Future<http.Response> postOrder(
      List<FoodList> foodcart, List<GameList> gamecart) async {
    Uri url = Uri.parse('$baseUrl/$subUrl');

    //qrId 받아오기
    var wholeUrl = window.location.href;
    var uri = Uri.parse(wholeUrl);
    var qrId = uri.queryParameters['qr_id'];
    if (qrId != null) {
      // 여기서 qrId 변수를 사용하여 필요한 작업을 수행
      print('qr_id 값: $qrId');
    } else {
      print('qr_id 파라미터가 URL에 없습니다.');
    }
    print("url: $wholeUrl");

    //socket

    String jsonBody = jsonEncode(
      {
        'qrId': qrId,
        'foods': foodcart.map((product) => product.toJson()).toList(),
        'games': gamecart.map((product) => product.toJson()).toList(),
      },
    );

    return http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonBody,
    );
  }
}
