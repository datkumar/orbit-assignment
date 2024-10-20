import 'package:flutter/material.dart';

import 'models/product_data_response.dart';

class ProductCard extends StatelessWidget {
  final ProductData productData;
  final void Function() onPlusPressed;
  final void Function() onMinusPressed;
  final int currentQty;

  const ProductCard({
    super.key,
    required this.productData,
    required this.currentQty,
    required this.onPlusPressed,
    required this.onMinusPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFE3F2FD),
            spreadRadius: 1.5,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              productData.image,
              width: 90,
              height: 90,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 12),
          // Stuff on the right of image
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      productData.productName,
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => {},
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 20,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green,
                        ),
                      ),
                      padding: const EdgeInsets.all(1),
                      child: const Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 10,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Litres",
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "₹${productData.price}",
                      style: TextStyle(fontSize: 16, color: Colors.blue[900]),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: onMinusPressed,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(
                        Icons.do_not_disturb_on_outlined,
                        color: Colors.blue[900],
                        size: 25,
                      ),
                    ),
                    Container(
                      width: 20,
                      alignment: Alignment.center,
                      child: Text(
                        currentQty.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: onPlusPressed,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.blue[900],
                        size: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
