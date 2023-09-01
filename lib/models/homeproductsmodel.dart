import 'package:flutter/material.dart';

class homeproductsmodel {
  dynamic states;
  late dataproductmodel data;

  homeproductsmodel.fromjson(dynamic datajson) {
    states = datajson['status'];
    data = dataproductmodel.fromjson(datajson['data']);
  }
}

class dataproductmodel {
  List<productsmodel> products = [];
  List<bannermodel> banners = [];
  dataproductmodel.fromjson(dynamic data) {
    data['banners'].forEach((element) {
      banners.add(bannermodel.fromjson(element));
    });

    data['products'].forEach((element) {
      products.add(productsmodel.fromjson(element));
    });
  }
}

class bannermodel {
  dynamic id;
  late String image;
  bannermodel.fromjson(dynamic data) {
    id = data['id'];
    image = data['image'];
  }
}

class productsmodel {
  dynamic id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  dynamic image;
  dynamic name;
  dynamic description;
  dynamic in_favorites;
  dynamic in_cart;
  productsmodel.fromjson(dynamic data) {
    id = data['id'];
    price = data['price'];
    old_price = data['old_price'];
    discount = data['discount'];
    image = data['image'];
    name = data['name'];
    description = data['description'];
    in_favorites = data['in_favorites'];
    in_cart = data['in_cart'];
  }
}
