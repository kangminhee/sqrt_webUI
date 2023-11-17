import 'package:flutter/material.dart';
import 'package:user_web_ui/models/food_list.dart';
import 'package:user_web_ui/services/api_service.dart';

class FoodMenuTab extends StatelessWidget {
  FoodMenuTab({super.key});

  final Future<List<FoodList>> foods = ApiService.getFoodList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: foods,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<FoodList>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        print(index);
        var food = snapshot.data![index];
        return Column(
          children: [
            SizedBox(
              width: 250,
              child: Image.network(
                food.image,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              food.name,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
