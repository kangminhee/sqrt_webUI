import 'package:flutter/material.dart';

Widget basketContainer({
  required int productNo,
  required String productName,
  required String productImageUrl,
  required double price,
  required int quantity,
}) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          width: MediaQuery.of(context).size.width * 0.3,
          fit: BoxFit.cover,
          imageUrl: productImageUrl,
          placeholder: (context, url) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          },
          errorWidget: (context, url, error) {
            return const Center(
              child: Text("오류 발생"),
            );
          },
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                productName,
                textScaleFactor: 1.2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("${numberFormat.format(price)}원"),
              Row(
                children: [
                  const Text("수량:"),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove,
                      )),
                  Text("$quantity"),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                      )),
                ],
              ),
              Text("합계: ${numberFormat.format(price * quantity)}원"),
            ],
          ),
        ),
      ],
    ),
  );
}
