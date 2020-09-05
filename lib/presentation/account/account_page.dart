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
              children: [
                StyledActionContainer(
                    imagePath: 'assets/png/account_cards/progress_photos.png',
                    color: Color(0xff999999),
                    label: 'Something important :P'),
                StyledActionContainer(
                    imagePath: 'assets/png/account_cards/progress_photos.png',
                    color: Color(0xff999999),
                    label: 'Something important :P'),
                StyledActionContainer(
                    imagePath: 'assets/png/account_cards/progress_photos.png',
                    color: Color(0xff999999),
                    label: 'Something important :P'),
                StyledActionContainer(
                    imagePath: 'assets/png/account_cards/progress_photos.png',
                    color: Color(0xff999999),
                    label: 'Something important :P'),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

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
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 30,
            child: Text(label),
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
            Text(
              '$titleText',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ArchivoNarrow'),
            ),
            Text(
              '$valueText',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontFamily: 'Signika'),
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
              Text(
                user.name,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              Text(
                user.emailAddress,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
