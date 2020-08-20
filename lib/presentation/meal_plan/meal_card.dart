import 'package:diet_planner/model/meal.dart';
import 'package:flutter/material.dart';
import 'package:diet_planner/util/navigator.dart';

class MealCard extends StatelessWidget {
  const MealCard({@required this.meal, Key key}) : super(key: key);

  final Meal meal;

  static const Color greenBold = Color.fromRGBO(0, 153, 51, 1.0);
  static const Color greenLighter = Color.fromRGBO(0, 184, 61, 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 15),
      padding: EdgeInsets.only(bottom: 5, right: 5),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(239, 254, 221, 1.0),
            Color.fromRGBO(226, 255, 191, 1.0)
          ]),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 3, offset: Offset(3, 2), color: Colors.green[400])
          ]),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                      gradient:
                          LinearGradient(colors: [greenBold, greenLighter])),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          meal.iconData,
                          color: greenBold,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        '${meal.name}',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      '750/${meal.kcal}kcal',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              navigateToMealProductsPage(context, meal);
            },
            child: Container(
              width: 45,
              height: 45,
              margin: EdgeInsets.only(left: 15, right: 10),
              alignment: Alignment.center,
              child: Icon(
                Icons.add,
                color: greenBold,
                size: 25,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: greenBold, width: 2)),
            ),
          ),
        ],
      ),
    );
  }
}
/*

          */
