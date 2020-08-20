import 'package:diet_planner/model/meal.dart';
import 'package:diet_planner/presentation/widgets/ads.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'meal_card.dart';

class MealPlanPage extends StatelessWidget {
  MealPlanPage({Key key}) : super(key: key);

  final dumpUserMealsList = [
    Meal(
        name: 'Breakfast',
        date: DateTime.now(),
        iconData: FontAwesomeIcons.egg,
        kcal: 1000),
    Meal(
        name: 'Dinner',
        date: DateTime.now(),
        iconData: FontAwesomeIcons.drumstickBite,
        kcal: 800),
    Meal(
        name: 'Supper',
        date: DateTime.now(),
        iconData: FontAwesomeIcons.fish,
        kcal: 500),
    Meal(
        name: 'Snacks',
        date: DateTime.now(),
        iconData: FontAwesomeIcons.pizzaSlice,
        kcal: 200),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(5),
            child: ListView.builder(
                itemCount: dumpUserMealsList.length,
                itemBuilder: (context, index) {
                  return MealCard(meal: dumpUserMealsList[index]);
                }),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        BottomAdPlayer(),
      ],
    );
  }
}
