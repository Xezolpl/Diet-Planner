import 'package:diet_planner/model/meal.dart';
import 'package:diet_planner/model/product.dart';
import 'package:diet_planner/presentation/account/account_page.dart';
import 'package:diet_planner/presentation/meal_products/meal_products_page.dart';
import 'package:diet_planner/presentation/product/product_page.dart';
import 'package:flutter/material.dart';

navigateToProductPage(BuildContext context, Product product, Meal meal) {
  _pushWidgetWithFade(context, ProductPage(product, meal));
}

navigateToAccountPage(BuildContext context) {
  _pushWidgetWithFade(context, AccountPage());
}

navigateToMealProductsPage(BuildContext context, Meal meal) {
  _pushWidgetWithFade(
      context,
      MealProductsPage(
        meal,
      ));
}

_pushWidgetWithFade(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return widget;
        }),
  );
}
