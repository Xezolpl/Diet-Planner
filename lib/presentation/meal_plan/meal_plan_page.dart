import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:diet_planner/model/meal.dart';
import 'package:diet_planner/presentation/widgets/ads.dart';
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

class MealPlanPage extends StatefulWidget {
  MealPlanPage({Key key}) : super(key: key);

  @override
  _MealPlanPageState createState() => _MealPlanPageState();
}

class _MealPlanPageState extends State<MealPlanPage> {
  bool isAdPlayerVisible = false;

  @override
  void initState() {
    super.initState();
  }

  void _connectionChanged(dynamic hasConnection) {
    setState(() {
      isAdPlayerVisible = hasConnection;
    });
  }

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
