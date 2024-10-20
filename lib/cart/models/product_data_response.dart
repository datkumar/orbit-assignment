import 'dart:convert';

class ProductsDataResponse {
  final bool status;
  final List<ProductData> products;

  ProductsDataResponse({
    required this.status,
    required this.products,
  });

  factory ProductsDataResponse.fromRawJson(String str) =>
      ProductsDataResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductsDataResponse.fromJson(Map<String, dynamic> json) =>
      ProductsDataResponse(
        status: json["status"],
        products: List<ProductData>.from(
          json["products"].map(
            (x) => ProductData.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "products": List<dynamic>.from(
          products.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class ProductData {
  final int id;
  final int productId;
  final String productName;
  final int price;
  final int qty;
  final int maxQty;
  final int segmentPrice;
  final String image;

  ProductData({
    required this.id,
    required this.productId,
    required this.productName,
    required this.price,
    required this.qty,
    required this.maxQty,
    required this.segmentPrice,
    required this.image,
  });

  factory ProductData.fromRawJson(String str) =>
      ProductData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"],
        productId: json["productID"],
        productName: json["productName"],
        price: json["price"],
        qty: json["qty"],
        maxQty: json["maxQty"],
        segmentPrice: json["segmentPrice"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productID": productId,
        "productName": productName,
        "price": price,
        "qty": qty,
        "maxQty": maxQty,
        "segmentPrice": segmentPrice,
        "image": image,
      };
}
