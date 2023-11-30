class OrderList {
  int id;
  int amount;

  OrderList({required this.id, required this.amount});

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
      };
}

//List<OrderFood> orderItems = [];
