import 'package:flutter/material.dart';
import 'package:user/models/product.dart';
import 'package:user/services/api.dart';
import 'package:user/models/globals.dart';
//
//

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  Future<List<FoodList>> foods = OrderApiService.getFoodList();
  
  printf("${foodOrderList[0].id}");
  
//   foods.then((foodList) {  orderfoods = foodList.where((game) {
//     return foodOrderList.any((order) => order.id == game.id);
//   }).toList();
// });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("장바구니"),
        centerTitle: true,
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<FoodList>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var food = snapshot.data![index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                food.image,
                width: 100, // 이미지 크기 조정
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "음식 이름: ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          food.name,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "음식 가격: ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          food.price.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
