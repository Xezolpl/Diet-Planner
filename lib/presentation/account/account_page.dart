import 'package:auto_size_text/auto_size_text.dart';
import 'package:diet_planner/model/measurement.dart';
import 'package:diet_planner/model/user.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 10),
            onPressed: () {},
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.all(5),
        child: ListView(children: [
          NameDisplayRow(
              user: User(
                  uid: Uuid().v4(),
                  name: 'User',
                  emailAddress: 'user@gmail.com',
                  photoUrl:
                      'https://cdn.iconscout.com/icon/free/png-512/avatar-370-456322.png')),
          Container(
            height: 10,
            margin: EdgeInsets.only(bottom: 15),
            child: Divider(
              thickness: 3,
              color: Colors.amber[200],
              indent: 10,
              endIndent: 10,
            ),
          ),
          WeightBfBmiRow(Measurement(
              date: DateTime.now(),
              weight: 70,
              bodyFat: 15.5,
              height: 173,
              bmi: 23.5,
              parties: {})),
          SizedBox(
            height: 20,
          ),
          Container(
            child: GridView(
              primary: false,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: getActionContainers(),
            ),
          ),
        ]),
      ),
    );
  }
}

List<Widget> getActionContainers() => [
      StyledActionContainer(
          imagePath: 'assets/png/account_cards/progress.png',
          color: Colors.teal[200],
          label: 'Progress photos'),
      StyledActionContainer(
          imagePath: 'assets/png/account_cards/goal.png',
          color: Colors.blueGrey[300],
          label: 'Goals'),
      StyledActionContainer(
          imagePath: 'assets/png/account_cards/measurement.png',
          color: Colors.brown[300],
          label: 'Measurements'),
      StyledActionContainer(
          imagePath: 'assets/png/account_cards/calculator.png',
          color: Colors.lime[800],
          label: 'Calculators'),
      StyledActionContainer(
          imagePath: 'assets/png/account_cards/shopping-list.png',
          color: Colors.yellow[800],
          label: 'Shopping list'),
      StyledActionContainer(
          imagePath: 'assets/png/account_cards/programmer.png',
          color: Colors.pink[300],
          label: 'Contact & About'),
    ];

class StyledActionContainer extends StatelessWidget {
  final String imagePath, label;
  final Color color;

  const StyledActionContainer(
      {Key key,
      @required this.imagePath,
      @required this.label,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = (MediaQuery.of(context).size.width - 20) / 2;
    return Container(
      width: size,
      height: size + 30,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 40,
            child: AutoSizeText(
              label,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                  color: Color.fromRGBO(243, 244, 255, 1),
                  shadows: [
                    Shadow(color: Color(0xff7f7f7f), offset: Offset(2, 2)),
                  ]),
            ),
          ),
          Expanded(
              child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ))
        ],
      ),
    );
  }
}

class WeightBfBmiRow extends StatelessWidget {
  final Measurement measurement;
  const WeightBfBmiRow(this.measurement, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StyledValueContainer(
            titleText: 'Weight',
            valueText: '${measurement != null ? measurement.weight : '-'}kg',
            color: Colors.grey[100],
          ),
          SizedBox(
            width: 3,
          ),
          StyledValueContainer(
              titleText: 'Body Fat',
              valueText: '${measurement != null ? measurement.bodyFat : '-'}%',
              color: Colors.amber[50]),
          SizedBox(
            width: 3,
          ),
          StyledValueContainer(
            titleText: 'BMI',
            valueText:
                '${measurement != null ? double.parse(measurement.bmi.toStringAsFixed(2)) : '-'}',
            color: Colors.grey[100],
          ),
        ],
      ),
    );
  }
}

class StyledValueContainer extends StatelessWidget {
  final Color color;
  final String titleText, valueText;

  const StyledValueContainer(
      {@required this.titleText, @required this.valueText, this.color, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xff969696),
            width: 1.5,
          ),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AutoSizeText(
              '$titleText',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ArchivoNarrow'),
            ),
            AutoSizeText(
              '$valueText',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Signika',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NameDisplayRow extends StatelessWidget {
  final User user;
  const NameDisplayRow({@required this.user, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              user.photoUrl,
              width: 60,
              height: 60,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                user.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              AutoSizeText(
                user.emailAddress,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
