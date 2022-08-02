
import 'dart:convert';

import 'package:get/get_utils/get_utils.dart';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {

  int id;
  String brand;
  String name;
  String price;
  String priceSign;
  String currency;
  String imageLink;
  String productLink;
  String websiteLink;
  String description;
  dynamic rating;
  String? category;
  String productType;
  List<String> tagList;
  DateTime createdAt;
  DateTime updatedAt;
  String productApiUrl;
  String apiFeaturedImage;
  List<ProductColor> productColors;

  ProductModel({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    required this.priceSign,
    required this.currency,
    required this.imageLink,
    required this.productLink,
    required this.websiteLink,
    required this.description,
    required this.rating,
    required this.category,
    required this.productType,
    required this.tagList,
    required this.createdAt,
    required this.updatedAt,
    required this.productApiUrl,
    required this.apiFeaturedImage,
    required this.productColors,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    brand: json["brand"],
    name: json["name"],
    price: json["price"],
    priceSign: json["price_sign"]??"NA",
    currency: json["currency"]??"NA",
    imageLink: json["image_link"]??"NA",
    productLink: json["product_link"]??"NA",
    websiteLink: json["website_link"]??"NA",
    description: json["description"]??"NA",
    rating: json["rating"],
    category: json["category"]??"NA",
    productType: json["product_type"]??"NA",
    tagList: List<String>.from(json["tag_list"].map((x) => x)),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    productApiUrl: json["product_api_url"],
    apiFeaturedImage: json["api_featured_image"],
    productColors: List<ProductColor>.from(json["product_colors"].map((x) => ProductColor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brand": brand,
    "name": name,
    "price": price,
    "price_sign": priceSign,
    "currency": currency,
    "image_link": imageLink,
    "product_link": productLink,
    "website_link": websiteLink,
    "description": description,
    "rating": rating,
    "category": category,
    "product_type": productType,
    "tag_list": List<dynamic>.from(tagList.map((x) => x)),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "product_api_url": productApiUrl,
    "api_featured_image": apiFeaturedImage,
    "product_colors": List<dynamic>.from(productColors.map((x) => x.toJson())),
  };
}

class ProductColor {
  ProductColor({
    this.hexValue,
    this.colourName,
  });

  String? hexValue;
  String? colourName;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
    hexValue: json["hex_value"],
    colourName: json["colour_name"],
  );

  Map<String, dynamic> toJson() => {
    "hex_value": hexValue,
    "colour_name": colourName,
  };
}
