//our api
/*
class GameList {
  final String name, image;
  final int price, id;

  GameList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        image = json['image'];
}
*/

//*nico test api
class GameList {
  final String name, id, image;

  GameList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['title'],
        image = json['thumb'];
}
//*/