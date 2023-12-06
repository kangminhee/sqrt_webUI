import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  List<FoodList> foodcart = [];
  List<GameList> gamecart = [];
  int totalCartValue = 0;

  int get total => foodcart.length + gamecart.length;

  void addFood(food) {
    int index = foodcart.indexWhere((i) => i.id == food.id);
    print(index);
    if (index != -1) {
      updateFood(food, food.quantity + 1);
    } else {
      foodcart.add(food);
      calculateTotal();
      notifyListeners();
    }
  }

  void removeFood(food) {
    int index = foodcart.indexWhere((i) => i.id == food.id);
    foodcart[index].quantity = 1;
    foodcart.removeWhere((item) => item.id == food.id);
    calculateTotal();
    notifyListeners();
  }

  void updateFood(food, quantity) {
    int index = foodcart.indexWhere((i) => i.id == food.id);
    foodcart[index].quantity = quantity;
    if (foodcart[index].quantity == 0) {
      removeFood(food);
    }

    calculateTotal();
    notifyListeners();
  }

  void clearFoodCart() {
    for (var f in foodcart) {
      f.quantity = 1;
    }
    foodcart = [];
    notifyListeners();
  }

  void calculateTotal() {
    totalCartValue = 0;
    for (var f in foodcart) {
      totalCartValue += f.price * f.quantity;
    }
    notifyListeners();
  }

  void addGame(game) {
    if (gamecart.isNotEmpty) {
      gamecart[0] = game; // 기존 게임을 새 게임으로 대체
    } else {
      gamecart.add(game); // 새 게임 추가
    }
    notifyListeners();
  }

  void removeGame() {
    gamecart.clear(); // 게임 제거
    notifyListeners();
  }
}

class GameList {
  int id;
  String name;
  String image;
  int price;
  int quantity;

  GameList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image_url'],
        price = json['price'],
        quantity = 1;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }

  GameList({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
  });
}

class FoodList {
  int id;
  String name;
  String image;
  int price;
  int quantity;

  FoodList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image_url'],
        price = json['price'],
        quantity = 1;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }

  FoodList({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
  });
}
