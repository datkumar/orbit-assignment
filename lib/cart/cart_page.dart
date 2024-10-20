import 'dart:convert';

import 'package:assignment/cart/bill_card.dart';
import 'package:assignment/cart/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/product_data_response.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<ProductData> _products = [];
  List<int> _qtySelected = [];
  int _totalItems = 0;
  double _totalAmt = 0;

  void initValuesFromFile() async {
    String jsonString = await rootBundle.loadString(
      'assets/data/products-data.json',
    );
    List<dynamic> jsonList = jsonDecode(jsonString)["products"];
    final aggregatedProducts = jsonList.map(
      (productJsonObj) {
        return ProductData.fromJson(productJsonObj);
      },
    );
    setState(() {
      _products = aggregatedProducts.toList();
      _qtySelected = _products.map((p) => p.qty).toList();
    });
    calculateBill();
  }

  void calculateBill() {
    final itemCount = _qtySelected.fold(0, (acc, curr) => acc + curr);
    double billAmt = 0;
    for (int i = 0; i < _products.length; i++) {
      billAmt += _products[i].price * _qtySelected[i];
    }
    setState(() {
      _totalItems = itemCount;
      _totalAmt = billAmt;
    });
  }

  @override
  void initState() {
    super.initState();
    initValuesFromFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue[900],
          ),
        ),
        title: Text(
          "Review Cart",
          style: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Green top banner
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            color: Colors.green.withOpacity(0.2),
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    "Balance in your wallet",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                Icon(
                  Icons.wallet_outlined,
                  color: Colors.green,
                ),
                Text(
                  "₹5386",
                  style: TextStyle(color: Colors.green),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.info,
                  color: Colors.orange,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Products Summary
                ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) => ProductCard(
                    currentQty: _qtySelected[index],
                    productData: _products[index],
                    onMinusPressed: () {
                      if (_qtySelected[index] == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text(
                              'At least 1 quantity is required.',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      } else {
                        setState(() => _qtySelected[index]--);
                        calculateBill();
                      }
                    },
                    onPlusPressed: () {
                      if (_qtySelected[index] == _products[index].maxQty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text(
                              'Maximum quantity reached.',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      } else {
                        setState(() => _qtySelected[index]++);
                        calculateBill();
                      }
                    },
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                ),

                BillCard(
                  totalItemCount: _totalItems,
                  totalAmount: _totalAmt,
                )
              ],
            ),
          ),
          // Checkout Button
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: double.infinity,
            child: FilledButton(
              onPressed: () => {},
              style: ButtonStyle(
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 15),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.blue[900]),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: const Text(
                "Checkout",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
