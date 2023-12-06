import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:user/models/cartmodel.dart';
import 'package:user/services/api.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Cart"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "Clear",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () =>
                ScopedModel.of<CartModel>(context, rebuildOnChange: false)
                    .clearFoodCart(),
          )
        ],
      ),
      body: Column(
        children: [
          //Foods
          ScopedModelDescendant<CartModel>(
            builder: (context, child, model) {
              if (model.foodcart.isEmpty && model.gamecart.isNotEmpty) {
                return const Center(
                  child: Text("No items in FoodCart"),
                );
              } else if (model.foodcart.isEmpty) {
                return const Center(
                  child: SizedBox(
                    height: 10,
                  ),
                );
              } else {
                return Container(
                  height: 300,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                          itemCount: model.foodcart.length,
                          itemBuilder: (context, index) {
                            final item = model.foodcart[index];
                            return ListTile(
                              leading: Image.network(
                                item.image,
                                width: 100, // 이미지 크기 조정
                                headers: const {
                                  "User-Agent":
                                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                                },
                              ),
                              title: Text(item.name),
                              subtitle: Text(
                                "${item.quantity} x ${item.price} = ${item.quantity * item.price}",
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () => model.updateFood(
                                      item,
                                      item.quantity + 1,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      if (item.quantity > 1) {
                                        model.updateFood(
                                          item,
                                          item.quantity - 1,
                                        );
                                      }
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      model.clearFoodCart();
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "합계: ${model.totalCartValue}원",
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),
          //Game
          ScopedModelDescendant<CartModel>(
            builder: (context, child, model) {
              if (model.gamecart.isEmpty && model.foodcart.isNotEmpty) {
                return const Center(
                  child: Text("No games chosen"),
                );
              } else if (model.gamecart.isEmpty) {
                return const Center(
                  child: SizedBox(height: 10),
                );
              } else {
                final item = model.gamecart[0]; // gamecart에 있는 첫 번째 게임

                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(
                      item.image,
                      width: 100, // 이미지 크기 조정
                      headers: const {
                        "User-Agent":
                            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                      },
                    ),
                    title: Text(item.name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        model.removeGame();
                      },
                    ),
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),

          //Button
          ScopedModelDescendant<CartModel>(
            builder: (context, child, model) {
              if (model.gamecart.isEmpty && model.foodcart.isEmpty) {
                return const Center(
                  child: Text("Nothing"),
                );
              } else {
                return Container(
                  height: 50,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              var cartModel = ScopedModel.of<CartModel>(context,
                                  rebuildOnChange: false);

                              var response = await OrderApiService.postOrder(
                                  cartModel.foodcart, cartModel.gamecart);

                              if (response.statusCode == 200) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Order successfully sent!")),
                                );
                                cartModel.removeGame();
                                cartModel.clearFoodCart();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Failed to send order. Please try again.")),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("Error: ${e.toString()}")),
                              );
                            }
                          },
                          child: const Text("BUY NOW"),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
