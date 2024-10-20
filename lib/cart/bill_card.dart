import 'package:flutter/material.dart';

class BillCard extends StatelessWidget {
  final int totalItemCount;
  final double totalAmount;

  const BillCard({
    super.key,
    required this.totalItemCount,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10, left: 15),
          // padding: const EdgeInsets.all(10),
          child: const Text(
            "Order Details",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
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
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Item Total",
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "₹ ${totalAmount.round()}",
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${totalAmount.round()}",
                    style: TextStyle(
                      color: Colors.blue[400],
                      fontSize: 15,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.blue[400],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Text(
                    "Delivery Charges",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Free",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text(
                    "Total Items",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    totalItemCount.toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
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
            children: [
              Text(
                "To Pay",
                style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Text(
                "₹ ${totalAmount.round()}",
                style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
