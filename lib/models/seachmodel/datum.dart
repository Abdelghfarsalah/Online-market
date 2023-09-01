import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final dynamic id;
  final dynamic price;
  final String? image;
  final String? name;
  final String? description;
  final List<String>? images;
  final dynamic inFavorites;
  final dynamic inCart;

  const Datum({
    this.id,
    this.price,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] ,
        price: json['price'],
        image: json['image'] ,
        name: json['name'] ,
        description: json['description'] ,
        images: json['images'] as List<String>?,
        inFavorites: json['in_favorites'] as bool?,
        inCart: json['in_cart'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'image': image,
        'name': name,
        'description': description,
        'images': images,
        'in_favorites': inFavorites,
        'in_cart': inCart,
      };

  @override
  List<Object?> get props {
    return [
      id,
      price,
      image,
      name,
      description,
      images,
      inFavorites,
      inCart,
    ];
  }
}
