// import 'package:flutter/material.dart';
// import 'package:user/models/product.dart';

// class GlobalStore extends ChangeNotifier {
//   List<OrderList> foodOrderList = [];
//   List<OrderList> gameOrderList = [];

//   void addFoodItem(List<OrderList> foodOrderList) {
//     // 주문 목록에서 동일한 ID의 아이템 찾기
//     int where = foodOrderList.firstWhere((element) => false)
//     var existingOrder = foodOrderList.firstWhere(
//       (order) => order.id == foodOrderList.id,
//       // orElse: () => null,
//     );

//     // 이미 있는 아이템이면 수량 증가
//     existingOrder.count++;
//     notifyListeners();
//   }

//   void removeItem(int id) {
//     var existingOrder = foodOrderList.firstWhere(
//       (order) => order.id == id,
//       // orElse: () => null,
//     );

//     if (existingOrder.count > 1) {
//       // 수량이 1보다 많으면 감소
//       existingOrder.count--;
//     } else if (existingOrder.count == 1) {
//       // 수량이 1이면 목록에서 제거
//       foodOrderList.removeWhere((order) => order.id == id);
//     }
//     notifyListeners();
//   }
// }
