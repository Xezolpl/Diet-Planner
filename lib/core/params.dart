import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class Params extends Equatable {
  String getWhere();
  List<dynamic> getWhereArgs();
}

class ProductDatabaseParams extends Params {
  final String id;
  final int barcode;

  ProductDatabaseParams({this.id, this.barcode});

  @override
  String getWhere() {
    if (barcode != null) {
      return 'barcode = ?';
    }
    if (id != null) {
      return 'id = ?';
    }
    return null;
  }

  @override
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
  List<Object> get props => [id, barcode];

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
  final NutrientFilter filter;

  ProductQueryParams(
      {this.pattern,
      this.barcode,
      this.productOrDish,
      this.language,
      this.filter});

  @override
  String getWhere() {
    String where = '';

    //If barcode is not null - we have usually only one item with that barcode in db/api.
    if (barcode != null) {
      return 'barcode = ?';
    }

    //If barcode is null we can set concrete params
    if (pattern != null) {
      where += 'name = ? OR category = ?<>';
    }

    if (productOrDish != null) {
      where += 'type = ?<>';
    }
    //Language is usefull only in the API so there we will skip it
    if (filter != null) {
      where += filter.getWhere();
    }
    where.replaceAll('<>', ' AND ');
    if (where.endsWith(' AND ')) {
      where.replaceRange(where.length - 5, where.length - 1, '');
    }

    return where;
  }

  @override
  List getWhereArgs() {
    List<dynamic> args;

    //If barcode is not null - we have usually only one item with that barcode in db/api.
    if (barcode != null) {
      return [barcode];
    }

    //If barcode is null we can set concrete params
    if (pattern != null) {
      args.addAll([pattern, pattern]);
    }

    if (productOrDish != null) {
      args.add(productOrDish == ProductOrDish.PRODUCT ? 'product' : 'dish');
    }
    //Language is usefull only in the API so there we will skip it
    if (filter != null) {
      args.addAll(filter.getWhereArgs());
    }

    return args;
  }

  @override
  List<Object> get props => [pattern, barcode, productOrDish, language, filter];
}

enum NutrientType { CARBOHYDRATES, PROTEINS, FATS }
enum ProductOrDish { PRODUCT, DISH }
enum QueryLanguage { POLISH, ENGLISH }

class NutrientFilter {
  final NutrientType nutrientType;
  final int min, max;

  NutrientFilter({@required this.nutrientType, this.min = 0, this.max = 9999});

  String getWhere() {
    if (nutrientType == null) return null;
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
