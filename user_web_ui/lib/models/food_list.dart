//our api
class FoodList {
  final String name, image;
  final int id, price;

  FoodList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        image = json['image'];
}
//*/
/* nico test api
class FoodList {
  final String name, id, image;

  FoodList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['title'],
        image = json['thumb'];
}
*/