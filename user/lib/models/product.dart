import 'package:flutter/foundation.dart';

class FoodList {
  final String name, image;
  final int id, price;

  FoodList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image_url'],
        price = json['price'];
}

class GameList {
  final String name, image;
  final int id;

  GameList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image_url'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> game = {};

    game['id'] = id;
    game['name'] = name;
    game['image_url'] = image;

    return game;
  }
}

class OrderList {
  int id;
  int count;

  OrderList({required this.id, required this.count});
}

class OrderModel extends ChangeNotifier {
  final List<OrderList> _foodOrderList = [];

  List<OrderList> get foodOrderList => _foodOrderList;
}
