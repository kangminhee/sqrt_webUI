import 'package:user_web_ui/models/item_order.dart';

void addItemToOrder(List<OrderList> orderItems, int itemId) {
  var existingItem = orderItems.firstWhere(
    (item) => item.id == itemId,
  );

  existingItem.amount += 1;
}

void decreaseItemQuantity(List<OrderList> orderItems, int itemId) {
  var existingItem = orderItems.firstWhere(
    (item) => item.id == itemId,
  );
  if (existingItem.amount > 1) {
    existingItem.amount -= 1;
  } else {
    orderItems.remove(existingItem);
  }
}

void eraseItem(List<OrderList> orderItems, int itemId) {
  var existingItem = orderItems.firstWhere(
    (item) => item.id == itemId,
  );

  orderItems.remove(existingItem);
}
