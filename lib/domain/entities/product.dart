import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import 'nutrition.dart';

part 'product.freezed.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    @required String id,
    @required String name,
    @required String category,
    @required Nutrition nutrition,
    @required double weight,
  }) = _Product;

  factory Product.empty() => Product(
      id: Uuid().v4(),
      name: '',
      category: 'none',
      nutrition: Nutrition.empty(),
      weight: 0);
}
