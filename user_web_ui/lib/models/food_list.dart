class FoodList {
  final String name, image, id;

  FoodList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['title'],
        image = json['thumb'];
}

/*
class FoodList {
  final String name, price, image, id;

  FoodList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        image = json['image'];
}
*/