import 'package:diet_planner/domain/entities/diet.dart';
import 'package:diet_planner/domain/entities/meal.dart';
import 'package:diet_planner/presentation/widgets/ads.dart';
import 'package:diet_planner/presentation/widgets/no_internet_banner.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'meal_card.dart';

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

class MealPlanPage extends StatelessWidget {
  final Diet diet;

  const MealPlanPage(
    this.diet, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(5),
            child: ListView.builder(
                itemCount:
                    diet == null ? dumpUserMealsList.length : diet.meals.length,
                itemBuilder: (context, index) {
                  return MealCard(
                      meal: diet == null
                          ? dumpUserMealsList[index]
                          : diet.meals[index]);
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
