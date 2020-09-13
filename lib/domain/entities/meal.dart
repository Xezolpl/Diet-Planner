import 'package:flutter/material.dart';

class Meal {
  final String name;
  final DateTime date;
  final int kcal;
  final IconData iconData;
  const Meal(
      {@required this.name,
      @required this.date,
      @required this.iconData,
      @required this.kcal});
}
