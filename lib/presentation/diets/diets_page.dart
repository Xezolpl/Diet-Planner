import 'package:diet_planner/domain/entities/diet.dart';
import 'package:diet_planner/presentation/home/home_page.dart';
import 'package:diet_planner/presentation/widgets/ads.dart';
import 'package:flutter/material.dart';

import 'diet_card.dart';

class DietsPage extends StatelessWidget {
  final HomePageState _homePageState;

  DietsPage(
    this._homePageState, {
    Key key,
  }) : super(key: key);

  final dumpUserDietsList = [
    Diet.empty().copyWith(name: 'Pyszna'),
    Diet.empty().copyWith(name: 'Wiosenna'),
    Diet.empty()
        .copyWith(name: 'Ketogeniczna dieta wegańska o zaostrzonym rygorze'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListView.builder(
                itemCount: dumpUserDietsList.length,
                itemBuilder: (context, index) {
                  var diet = dumpUserDietsList[index];

                  return GestureDetector(
                      onTap: () {
                        _homePageState.navigationTapped(0, diet);
                      },
                      child: DietCard(diet: diet));
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
