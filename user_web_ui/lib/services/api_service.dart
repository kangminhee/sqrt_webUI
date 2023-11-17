import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_web_ui/models/food_list.dart';

class ApiService {
  static String baseUrl = "http://112.219.28.28:3000";
  static String foodmenu = "menu";

  static Future<List<FoodList>> getFoodList() async {
    List<FoodList> foodmenuInstaces = [];
    final url = Uri.parse('$baseUrl/$foodmenu');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> foods = jsonDecode(response.body);
      for (var food in foods) {
        foodmenuInstaces.add(FoodList.fromJson(food));
      }
      return foodmenuInstaces;
    }
    throw Error();
  }
}
