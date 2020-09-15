import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    @required String id,
    @required String name,
    @required String category,
    @required double weight,
    @nullable int barcode,
    //major nutrients
    @required int kcal,
    @required double carbohydrates,
    @required double proteins,
    @required double fats,
    //more nutrients
    @nullable double sugars,
    @nullable double salt,
    @nullable double saturated,
    @nullable double monounsaturated,
    @nullable double poliunsaturated,
    @nullable double omega3,
    @nullable double omega6,
    @nullable double ala,
    @nullable double epa,
    @nullable double dha,
    @nullable double fibre,
    @nullable double cholesterol,
    @nullable double caffeine,
    //vitamins
    @nullable double vitaminA,
    @nullable double vitaminB1,
    @nullable double vitaminB2,
    @nullable double vitaminB3,
    @nullable double vitaminB4,
    @nullable double vitaminB5,
    @nullable double vitaminB6,
    @nullable double vitaminB7,
    @nullable double vitaminB9,
    @nullable double vitaminB12,
    @nullable double vitaminC,
    @nullable double vitaminD,
    @nullable double vitaminE,
    @nullable double vitaminK,
    //minerals
    @nullable double sodium,
    @nullable double potassium,
    @nullable double calcium,
    @nullable double magnesium,
    @nullable double phosphorous,
    @nullable double iron,
    @nullable double copper,
    @nullable double zinc,
    @nullable double fluorine,
    @nullable double selenium,
    @nullable double iodine,
  }) = _Product;

  factory Product.empty() => Product(
        id: Uuid().v4(),
        name: 'Product',
        category: 'none',
        weight: 0.0,
        kcal: 0,
        carbohydrates: 0.0,
        proteins: 0.0,
        fats: 0.0,
      );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
