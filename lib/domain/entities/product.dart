import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import 'nutrients.dart';

part 'product.freezed.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    @required String id,
    @required String name,
    @required List<String> categories,
    @required Nutrients nutrients,
    @required double weight,
  }) = _Product;

  factory Product.empty() => Product(
      id: Uuid().v4(),
      name: '',
      categories: ['none'],
      nutrients: Nutrients.empty(),
      weight: 0);

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        categories: json['categories'],
        nutrients: Nutrients
            .empty(), //TODO: NUTRIENTS IMPLEMENTATION (ITS IN THE SECODN TABLE)
        weight: json['weight'],
      );
}
