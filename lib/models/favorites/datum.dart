import 'package:equatable/equatable.dart';

import 'product.dart';

class Datu extends Equatable {
  final dynamic id;
  final Product? product;

  const Datu({this.id, this.product});

  factory Datu.fromJson(Map<String, dynamic> json) => Datu(
        id: json['id'],
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product?.toJson(),
      };

  @override
  List<Object?> get props => [id, product];
}
