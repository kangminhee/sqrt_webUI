import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String name;
  final double price;
  int quantity;

  CartItem(
      {required this.id,
      required this.name,
      required this.price,
      this.quantity = 1});
}

class CartModel with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  // 장바구니에 항목 추가, 제거, 수정 등의 메서드를 여기에 추가합니다.
}
