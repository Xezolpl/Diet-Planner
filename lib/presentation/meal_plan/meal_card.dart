import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  const MealCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.blueGrey[100], spreadRadius: 1, offset: Offset(0, 2))
      ], borderRadius: BorderRadius.circular(20), color: Colors.blue[50]),
      margin: EdgeInsets.only(top: 5, bottom: 5),
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Breakfast',
                    style: TextStyle(
                      //TODO: FIND A NICE FONT
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      '750/1000kcal',
                      style: TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            child: Icon(Icons.add, color: Colors.blue[200]),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.blue[200], width: 1.7)),
          ),
        ],
      ),
    );
  }
}
