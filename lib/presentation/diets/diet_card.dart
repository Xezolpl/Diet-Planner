import 'package:auto_size_text/auto_size_text.dart';
import 'package:diet_planner/model/diet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DietCard extends StatelessWidget {
  static const lightGrey = Color(0xffaaaaaa);
  final Diet diet;

  const DietCard({
    @required this.diet,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: lightGrey),
        height: 120,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.8), BlendMode.dstATop),
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/png/diet_backgrounds/fruit_diet.png',
                      )),
                ),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: AutoSizeText(
                  diet.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    shadows: [
                      Shadow(color: Color(0xff333333), blurRadius: 5),
                      Shadow(
                          color: Colors.black,
                          offset: Offset(2, 2),
                          blurRadius: 1.5)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(5),
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: lightGrey),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconWithTextRow(
                        iconData: FontAwesomeIcons.rocket,
                        iconColor: Colors.green,
                        label: '3120kcal'),
                    IconWithTextRow(
                        iconData: FontAwesomeIcons.fire,
                        iconColor: Colors.red,
                        label: '500g'),
                    IconWithTextRow(
                        iconData: FontAwesomeIcons.dumbbell,
                        iconColor: Colors.blueAccent,
                        label: '120g'),
                    IconWithTextRow(
                        iconData: FontAwesomeIcons.oilCan,
                        iconColor: Colors.yellow[700],
                        label: '80g'),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class IconWithTextRow extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String label;

  const IconWithTextRow(
      {@required this.iconData,
      @required this.label,
      this.iconColor = Colors.black,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(7)),
      child: Row(
        children: [
          Icon(
            iconData,
            color: iconColor,
            size: 16,
          ),
          SizedBox(
            width: 10,
          ),
          Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
