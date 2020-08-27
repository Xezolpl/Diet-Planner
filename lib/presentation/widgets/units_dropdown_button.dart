import 'package:flutter/material.dart';

/* May be used in the future 
enum UnitOfMeasurement {
  kg,
  dag,
  g,
  mg,
  ug,
  ng,
  l,
  dl,
  ml,
}

extension XUnitOfMeasurement on UnitOfMeasurement {
  static UnitOfMeasurement fromString(String unit) {
    switch (unit) {
      case 'kg':
        return UnitOfMeasurement.kg;
      case 'dag':
        return UnitOfMeasurement.dag;
      case 'g':
        return UnitOfMeasurement.g;
      case 'mg':
        return UnitOfMeasurement.mg;
      case 'ug':
        return UnitOfMeasurement.ug;
      case 'ng':
        return UnitOfMeasurement.ng;
      case 'l':
        return UnitOfMeasurement.l;
      case 'dl':
        return UnitOfMeasurement.dl;
      case 'ml':
        return UnitOfMeasurement.ml;
    }
    return UnitOfMeasurement.g;
  }

  static String print() => 

}
*/
class UnitsDropdownButton extends StatefulWidget {
  final List<String> units;
  const UnitsDropdownButton(this.units, {Key key}) : super(key: key);

  @override
  _UnitsDropdownButtonState createState() => _UnitsDropdownButtonState(units);
}

class _UnitsDropdownButtonState extends State<UnitsDropdownButton> {
  String selectedUnit;
  final List<String> units;

  _UnitsDropdownButtonState(this.units);

  @override
  void initState() {
    super.initState();
    selectedUnit = units.isNotEmpty ? units.first : '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.grey,
            )),
        padding: EdgeInsets.only(left: 5),
        width: 55,
        height: 35,
        child: units.length == 1
            ? Text(units[0])
            : DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedUnit,
                  onChanged: (value) {
                    setState(() {
                      selectedUnit = value;
                    });
                  },
                  items: units
                      .map<DropdownMenuItem<String>>(
                          (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ))
                      .toList(),
                ),
              ));
  }
}
