// To parse this JSON data, do
//
//     final productsCategoriesModel = productsCategoriesModelFromJson(jsonString);

import 'dart:convert';

ProductsCategoriesModel productsCategoriesModelFromJson(String str) =>
    ProductsCategoriesModel.fromJson(json.decode(str));

String productsCategoriesModelToJson(ProductsCategoriesModel data) =>
    json.encode(data.toJson());

class ProductsCategoriesModel {
  final List<dynamic>? products;
  final int? total;
  final int? skip;
  final int? limit;

  ProductsCategoriesModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory ProductsCategoriesModel.fromJson(Map<String, dynamic> json) =>
      ProductsCategoriesModel(
        products: json["products"] == null
            ? []
            : List<dynamic>.from(json["products"]!.map((x) => x)),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products":
            products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}
