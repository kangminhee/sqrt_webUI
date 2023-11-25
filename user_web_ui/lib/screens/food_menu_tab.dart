import 'package:flutter/material.dart';
import 'package:user_web_ui/models/food_list.dart';
import 'package:user_web_ui/services/food_api.dart';

class FoodMenuTab extends StatefulWidget {
  const FoodMenuTab({Key? key}) : super(key: key);

  @override
  State<FoodMenuTab> createState() => _FoodMenuTabState();
}

class _FoodMenuTabState extends State<FoodMenuTab> {
  final Future<List<FoodList>> foods = FoodApiService.getFoodList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.pink,
        title: const Text(
          "Food Court",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: FutureBuilder(
        future: foods,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return makeList(snapshot);
          } else {
            return const Center(child: Text('No data available'));
          }
        },
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _showPopup(context, '첫 번째 버튼');
                          },
                          child: const Text('+ 1'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _showPopup(context, '두 번째 버튼');
                          },
                          child: const Text('0'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _showPopup(context, '세 번째 버튼');
                          },
                          child: const Text('- 1'),
                        ),
                        const SizedBox(
                          width: 100,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPopup(BuildContext context, String buttonText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('팝업 창'),
          content: Text('$buttonText 클릭됨'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // 팝업 창 닫기
              },
              child: const Text('닫기'),
            ),
          ],
        );
      },
    );
  }
}
