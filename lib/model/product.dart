import 'package:flutter/material.dart';
import 'package:diet_planner/model/nutrition.dart';

class Product {
  final String id, name, category;
  final Nutrition nutrition;
  final double weight;

  Product(
      {@required this.id,
      @required this.name,
      @required this.category,
      @required this.nutrition,
      @required this.weight});
}
