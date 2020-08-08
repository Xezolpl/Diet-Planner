import 'package:diet_planner/presentation/widgets/bottom_ad_player.dart';
import 'package:flutter/material.dart';

import 'meal_card.dart';

class MealPlanPage extends StatelessWidget {
  const MealPlanPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(5),
            child: ListView.builder(itemBuilder: (context, index) {
              return MealCard();
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
