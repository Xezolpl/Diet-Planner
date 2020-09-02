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
                padding: EdgeInsets.all(3),
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
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InformationMark(
                                  iconData: FontAwesomeIcons.clock,
                                  text: '3h',
                                  color: Colors.amber[700]),
                              InformationMark(
                                  iconData: FontAwesomeIcons.coins,
                                  text: '40zł',
                                  color: Colors.blue[800]),
                              SizedBox(),
                            ])),
                    Container(
                      padding: EdgeInsets.only(bottom: 30, top: 20),
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
                  ],
                ),
              ),
            ),
            Container(
              width: 110,
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

class InformationMark extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color color;
  const InformationMark(
      {@required this.iconData,
      @required this.text,
      @required this.color,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(text,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
