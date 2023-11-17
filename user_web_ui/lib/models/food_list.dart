class FoodList {
  final String name, price, image;
  final int id;

  FoodList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        image = json['image'];
}
