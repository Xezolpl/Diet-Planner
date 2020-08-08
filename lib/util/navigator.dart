import 'package:diet_planner/presentation/account/account_page.dart';
import 'package:flutter/material.dart';

navigateToAccountPage(BuildContext context) {
  _pushWidgetWithFade(context, AccountPage());
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
