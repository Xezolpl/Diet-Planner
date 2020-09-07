import 'package:diet_planner/domain/entities/meal.dart';
import 'package:flutter/material.dart';
import 'package:diet_planner/domain/core/xdatetime.dart';

AppBar getMealDateAppBar(BuildContext context, Meal meal,
    {List<Widget> actions = const []}) {
  return AppBar(
    centerTitle: true,
    actions: actions,
    leading: Container(
      margin: EdgeInsets.only(left: 10),
      child: IconButton(
        onPressed: () {
          FocusScope.of(context).unfocus();
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.keyboard_arrow_left,
          size: 32,
        ),
      ),
    ),
    toolbarHeight: 70,
    title: Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          '${meal.name}',
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '${meal.date.printAdverbOfTimeOrDate()}',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    ),
  );
}
