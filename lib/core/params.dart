import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

abstract class Params extends Equatable {}

class ProductDatabaseParams extends Params {
  final String id;
  final int barcode;
  final bool fromApi;

  ProductDatabaseParams({this.id, this.barcode, this.fromApi = false});

  String getWhere() {
    if (barcode != null) {
      return 'barcode = ?';
    }
    if (id != null) {
      return 'id = ?';
    }
    return null;
  }

  List<dynamic> getWhereArgs() {
    if (barcode != null) {
      return [barcode];
    }
    if (id != null) {
      return [id];
    }
    return [];
  }

  @override
  List<Object> get props => [id, barcode, fromApi];

  @override
  String toString() {
    return 'barcode = $barcode, id = $id';
  }
}

class ProductQueryParams extends Params {
  final String pattern;
  final int barcode;
  final ProductOrDish productOrDish;
  final QueryLanguage language;
  final NutrientType majorNutrient; //High: carbs, proteins or fats
  final NutrientFilter filter;

  ProductQueryParams(this.pattern, this.barcode, this.productOrDish,
      this.language, this.majorNutrient, this.filter);

  @override
  List<Object> get props =>
      [pattern, barcode, productOrDish, language, majorNutrient, filter];
}

enum NutrientType { CARBOHYDRATES, PROTEINS, FATS }
enum ProductOrDish { PRODUCT, DISH }
enum QueryLanguage { POLISH, ENGLISH }

class NutrientFilter {
  final NutrientType nutrientType;
  final int min, max;

  NutrientFilter({@required this.nutrientType, this.min = 0, this.max = 9999});

  String getWhere() {
    switch (nutrientType) {
      case NutrientType.CARBOHYDRATES:
        return 'carbohydrates > ? AND carbohydrates < ?';
      case NutrientType.PROTEINS:
        return 'proteins > ? AND proteins < ?';
      case NutrientType.FATS:
        return 'fats > ? AND fats < ?';
    }
    return null;
  }

  List<dynamic> getWhereArgs() {
    if (nutrientType == null) return [];
    return [min, max];
  }
}
